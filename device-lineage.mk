#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Disable artifact path requirements
DISABLE_ARTIFACT_PATH_REQUIREMENTS=true

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.mep.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.mep.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Kernel
TARGET_PREBUILT_KERNEL := device/google/shusky-kernel/Image.lz4

# PixelParts
include packages/apps/PixelParts/device.mk

# Basic Call Recorder
$(call inherit-product, vendor/bcr/bcr.mk)

# ViPER4AndroidFX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Face Unlock
$(call inherit-product, vendor/google/faceunlock/device.mk)

# PowerShare
$(call inherit-product, hardware/google/pixel/powershare/device.mk)

# wireless_charger HAL service
$(call inherit-product, device/google/gs-common/wireless_charger/wireless_charger.mk)

# Pixel Framework
$(call inherit-product, vendor/pixel-framework/config.mk)

# Signed Build
-include vendor/lineage-priv/keys/keys.mk

# Build necessary packages for vendor

# Codec2
PRODUCT_PACKAGES += \
    libexynosv4l2

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal
