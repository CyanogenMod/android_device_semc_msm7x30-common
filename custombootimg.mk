LOCAL_PATH := $(call my-dir)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

INITSH := device/semc/msm7x30-common/combinedroot/init.sh
BOOTREC_DEVICE := $(PRODUCT_OUT)/recovery/bootrec-device

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(uncompressed_ramdisk) $(recovery_uncompressed_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(INITSH) $(BOOTREC_DEVICE) $(PRODUCT_OUT)/utilities/flash_image $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/erase_image $(MKBOOTIMG) $(MINIGZIP) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")

	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin

	$(hide) mv $(PRODUCT_OUT)/root/logo.rle $(PRODUCT_OUT)/combinedroot/logo.rle
	$(hide) cp $(uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) cp $(INITSH) $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) chmod 755 $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) ln -s sbin/init.sh $(PRODUCT_OUT)/combinedroot/init
	$(hide) cp $(BOOTREC_DEVICE) $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) $(MKBOOTIMG) --kernel $(PRODUCT_OUT)/kernel --ramdisk $(PRODUCT_OUT)/combinedroot.fs --base $(BOARD_KERNEL_BASE) --pagesize 131072 --output $@

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --output $@
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

