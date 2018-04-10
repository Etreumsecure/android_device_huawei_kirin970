#
# Copyright (C) 2018 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
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

# Treble implemenation adjustments
# boot class paths need to be overridden
# default.prop is symlinked to this location
PRODUCT_COPY_FILES += \
    $(OUT)/root/init.environ.rc:system/etc/init/init.environ.rc \
    $(OUT)/root/default.prop:system/etc/prop.default


# Gatekeeper build for shared libs
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl

# nfc build for shared libs
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl

# usb build for shared libs
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# wifi build for shared libs
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.supplicant@1.0 

# fingerprint build for shared libs
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.device@3.3-impl \
    android.hardware.camera.provider@2.4-service 
