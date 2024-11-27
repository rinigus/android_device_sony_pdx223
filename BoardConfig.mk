#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from sony sm8450-common
-include device/sony/sm8450-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx223
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Display
TARGET_SCREEN_DENSITY := 420

# Dtb/o
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/kernel

# Kernel
KERNEL_MODULE_DIR := $(KERNEL_PATH)/vendor_dlkm
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_DIR)/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_MODULE_DIR)/modules.load))
BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD)))

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_ramdisk/modules.load))
#BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_PATH)/vendor_ramdisk/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_ramdisk/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/vendor_ramdisk/, $(notdir $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)))

#BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE :=  $(KERNEL_PATH)/vendor_dlkm/modules.blocklist

# BOARD_KERNEL_CMDLINE += buildproduct=pdx223
# TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers
# PRODUCT_COPY_FILES += \
# 	$(KERNEL_PATH)/kernel:kernel

# Device-specific partition sizes
# data from AOSP config
# Reserve space for data encryption (234859245568-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 234859229184

# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# inherit from the proprietary version
-include vendor/sony/pdx223/BoardConfigVendor.mk
