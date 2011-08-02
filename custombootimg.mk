LOCAL_PATH := $(call my-dir)

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(TARGET_PREBUILT_KERNEL) $(recovery_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/utilities/flash_image $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/erase_image $(MKBOOTIMG)
	$(call pretty,"Boot image: $@")
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/stage2/
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/bin/
	$(hide) cp $(recovery_ramdisk) $(PRODUCT_OUT)/combinedroot/stage2/recovery.cpio
	$(hide) cp $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/combinedroot/stage2/boot.cpio
	$(hide) cp $(LOCAL_PATH)/prebuilt/busybox $(PRODUCT_OUT)/combinedroot/bin/busybox
	$(hide) cp $(LOCAL_PATH)/prebuilt/keycheck $(PRODUCT_OUT)/combinedroot/bin/keycheck
	$(hide) cp $(LOCAL_PATH)/prebuilt/init $(PRODUCT_OUT)/combinedroot/init
	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | $(MINIGZIP) > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) $(MKBOOTIMG) --kernel $(TARGET_PREBUILT_KERNEL) --ramdisk $(PRODUCT_OUT)/combinedroot.fs --base $(BOARD_KERNEL_BASE) --output $@
