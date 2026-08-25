#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2026 The WayDroid-ATV Project
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

# Bundle libndk_translation as ARM on x86 native bridge
include frameworks/libs/native_bridge_support/native_bridge_support.mk

# ATTENTION: we are overriding
# PRODUCT_SYSTEM_PROPERTIES += ro.dalvik.vm.native.bridge?=0
# set by build/make/target/product/runtime_libart.mk
PRODUCT_SYSTEM_PROPERTIES += \
    ro.dalvik.vm.native.bridge=libndk_translation.so

PRODUCT_SYSTEM_PROPERTIES += \
	ro.dalvik.vm.isa.arm=x86 \
    ro.dalvik.vm.isa.arm64=x86_64 \
    ro.enable.native.bridge.exec=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.berberis.flags=accurate-sigsegv \
	ro.berberis.version=16.0.0

PRODUCT_PACKAGES += \
	$(NATIVE_BRIDGE_PRODUCT_PACKAGES) \
	libberberis_exec_region \
	libndk_translation \
    libndk_translation_proxy_libEGL \
    libndk_translation_proxy_libGLESv1_CM \
    libndk_translation_proxy_libGLESv2 \
    libndk_translation_proxy_libGLESv3 \
    libndk_translation_proxy_libOpenMAXAL \
    libndk_translation_proxy_libOpenSLES \
    libndk_translation_proxy_libaaudio \
    libndk_translation_proxy_libamidi \
    libndk_translation_proxy_libandroid \
    libndk_translation_proxy_libandroid_runtime \
    libndk_translation_proxy_libbinder_ndk \
    libndk_translation_proxy_libc \
    libndk_translation_proxy_libcamera2ndk \
    libndk_translation_proxy_libjnigraphics \
    libndk_translation_proxy_libm \
    libndk_translation_proxy_libmediandk \
    libndk_translation_proxy_libnativehelper \
    libndk_translation_proxy_libnativewindow \
    libndk_translation_proxy_libneuralnetworks \
    libndk_translation_proxy_libvulkan \
    libndk_translation_proxy_libwebviewchromium_plat_support \
	ndk_translation_program_runner_binfmt_misc \
	ndk_translation_program_runner_binfmt_misc_arm64 \
	ndk_translation_cpuinfo.arm.txt \
	ndk_translation_cpuinfo.arm64.txt \
	ndk_translation_ld.config.arm.txt \
	ndk_translation_ld.config.arm64.txt \
	ndk_translation_arm_dyn \
	ndk_translation_arm_exe \
	ndk_translation_arm64_dyn \
	ndk_translation_arm64_exe \
	ndk_translation.rc

PRODUCT_SOONG_NAMESPACES += frameworks/libs/native_bridge_support/android_api/libc
