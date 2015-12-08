# Copyright (C) 2014 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Inherit from molly device
$(call inherit-product, device/google/molly/device.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)


TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920
PRODUCT_RELEASE_NAME := molly

PRODUCT_NAME := aosp_molly
PRODUCT_DEVICE := molly
PRODUCT_MODEL := ADT-1
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
