# Copyright (C) 2017 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from scx30g common configs
-include device/samsung/scx30g-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/samsung/j1pop3g/BoardConfigVendor.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := SC7727S

# Partitions
# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1080033280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2428502016
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Camera HAL1 hack
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

SPRD_MODULES:
	mkdir -p $(PRODUCT_OUT)/system/lib/modules
	ln -sf $(KERNEL_OUT)/drivers/autotst/autotst.ko $(PRODUCT_OUT)/system/lib/modules/autotst.ko
	ln -sf $(KERNEL_OUT)/drivers/gpu/mali400/r4p1/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
	ln -sf $(KERNEL_OUT)/drivers/mmc/card/mmc_test.ko $(PRODUCT_OUT)/system/lib/modules/mmc_test.ko
	ln -sf $(KERNEL_OUT)/drivers/net/wireless/sc2331/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko

TARGET_KERNEL_MODULES := SPRD_MODULES

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_sprdwl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_sprdwl
BOARD_WLAN_DEVICE           := sc2331
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fwpath"
WIFI_DRIVER_FW_PATH_STA     := "sta_mode"
WIFI_DRIVER_FW_PATH_P2P     := "p2p_mode"
WIFI_DRIVER_FW_PATH_AP      := "ap_mode"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/sprdwl.ko"
WIFI_DRIVER_MODULE_NAME     := "sprdwl"
BOARD_HAVE_SAMSUNG_WIFI 	:= true

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_j1pop3g_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/j1pop3g

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Assert
TARGET_OTA_ASSERT_DEVICE := j1pop3g,j110h,sc7727s,j1ace3g

# Gralloc
TARGET_UPDATED_MALI := true