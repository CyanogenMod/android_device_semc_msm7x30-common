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
#ifndef __MSM_ROTATOR_H__
#include <linux/types.h>
#include <linux/msm_mdp.h>
#define MSM_ROTATOR_IOCTL_MAGIC 'R'
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
#define MSM_ROTATOR_IOCTL_START   _IOWR(MSM_ROTATOR_IOCTL_MAGIC, 1, struct msm_rotator_img_info)
#define MSM_ROTATOR_IOCTL_ROTATE   _IOW(MSM_ROTATOR_IOCTL_MAGIC, 2, struct msm_rotator_data_info)
#define MSM_ROTATOR_IOCTL_FINISH   _IOW(MSM_ROTATOR_IOCTL_MAGIC, 3, int)
#define ROTATOR_VERSION_01 0xA5B4C301
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
enum rotator_clk_type {
 ROTATOR_AXI_CLK,
 ROTATOR_PCLK,
 ROTATOR_IMEM_CLK
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
};
struct msm_rotator_img_info {
 unsigned int session_id;
 struct msmfb_img src;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 struct msmfb_img dst;
 struct mdp_rect src_rect;
 unsigned int dst_x;
 unsigned int dst_y;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 unsigned char rotations;
 int enable;
 unsigned int downscale_ratio;
};
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
struct msm_rotator_data_info {
 int session_id;
 struct msmfb_data src;
 struct msmfb_data dst;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 unsigned int version_key;
 struct msmfb_data src_chroma;
 struct msmfb_data dst_chroma;
};
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
struct msm_rot_clocks {
 const char *clk_name;
 enum rotator_clk_type clk_type;
 unsigned int clk_rate;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
};
struct msm_rotator_platform_data {
 unsigned int number_of_clocks;
 unsigned int hardware_version_number;
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
 struct msm_rot_clocks *rotator_clks;
 const char *regulator_name;
};
#endif
/* WARNING: DO NOT EDIT, AUTO-GENERATED CODE - SEE TOP FOR INSTRUCTIONS */
