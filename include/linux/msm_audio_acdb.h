/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ***   To edit the content of this header, modify the corresponding
 ***   source file (e.g. under external/kernel-headers/original/) then
 ***   run bionic/libc/kernel/tools/update_all.py
 ***
 ***   Any manual change here will be lost the next time this script will
 ***   be run. You've been warned!
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef __MSM_AUDIO_ACDB_H
#define __MSM_AUDIO_ACDB_H
#include <linux/msm_audio.h>
#define AUDIO_SET_VOCPROC_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+0), unsigned)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define AUDIO_SET_VOCPROC_STREAM_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+1), unsigned)
#define AUDIO_SET_VOCPROC_VOL_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+2), unsigned)
#define AUDIO_SET_AUDPROC_RX_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+3), unsigned)
#define AUDIO_SET_AUDPROC_RX_STREAM_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+4), unsigned)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define AUDIO_SET_AUDPROC_RX_VOL_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+5), unsigned)
#define AUDIO_SET_AUDPROC_TX_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+6), unsigned)
#define AUDIO_SET_AUDPROC_TX_STREAM_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+7), unsigned)
#define AUDIO_SET_AUDPROC_TX_VOL_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+8), unsigned)
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define AUDIO_SET_SIDETONE_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+9), unsigned)
#define AUDIO_SET_ANC_CAL _IOW(AUDIO_IOCTL_MAGIC,   (AUDIO_MAX_COMMON_IOCTL_NUM+10), unsigned)
struct cal_block {
 uint32_t cal_size;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 uint32_t cal_offset;
};
struct sidetone_cal {
 uint16_t enable;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 uint16_t gain;
};
#endif
