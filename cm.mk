#
# Copyright (C) 2016 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
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

# Inherit CM common Phone stuff.
$(call inherit-product-if-exists, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/kirin970/device.mk)

# Inherit CodeOfHonor's customizations
$(call inherit-product, device/huawei/kirin970/CoH.mk)

# Device identifier
PRODUCT_DEVICE := kirin970
PRODUCT_NAME := cm_kirin970
PRODUCT_BRAND := huawei
PRODUCT_MODEL := kirin970
PRODUCT_MANUFACTURER := huawei

TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

PRODUCT_PACKAGES += \
    Snap \
    mkyaffs2image \
    mkuserimg.sh

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.zygote=zygote64_32 \
    ro.secure=0 \
    ro.adb.secure=0
