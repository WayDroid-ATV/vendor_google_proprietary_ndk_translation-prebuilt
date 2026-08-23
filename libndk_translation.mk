# Bundle libndk_translation as ARM on x86 native bridge
include frameworks/libs/native_bridge_support/native_bridge_support.mk

PRODUCT_PROPERTY_OVERRIDES += \
	ro.berberis.flags=accurate-sigsegv \
	ro.berberis.version=16.0.0 \
	ro.dalvik.vm.native.bridge=libndk_translation.so \
	ro.dalvik.vm.isa.arm64=x86_64 \
	ro.enable.native.bridge.exec=1

PRODUCT_PACKAGES += \
	$(NATIVE_BRIDGE_PRODUCT_PACKAGES) \
    berberis_cpuinfo_arm64 \
    ld.config.arm64.txt \
	libberberis_exec_region \
	libndk_translation \
    libproxy_arm64_to_x86_64_libEGL \
    libproxy_arm64_to_x86_64_libGLESv1_CM \
    libproxy_arm64_to_x86_64_libGLESv2 \
    libproxy_arm64_to_x86_64_libGLESv3 \
    libproxy_arm64_to_x86_64_libOpenMAXAL \
    libproxy_arm64_to_x86_64_libOpenSLES \
    libproxy_arm64_to_x86_64_libaaudio \
    libproxy_arm64_to_x86_64_libamidi \
    libproxy_arm64_to_x86_64_libandroid \
    libproxy_arm64_to_x86_64_libandroid_runtime \
    libproxy_arm64_to_x86_64_libbinder_ndk \
    libproxy_arm64_to_x86_64_libc \
    libproxy_arm64_to_x86_64_libcamera2ndk \
    libproxy_arm64_to_x86_64_libjnigraphics \
    libproxy_arm64_to_x86_64_libm \
    libproxy_arm64_to_x86_64_libmediandk \
    libproxy_arm64_to_x86_64_libnativehelper \
    libproxy_arm64_to_x86_64_libnativewindow \
    libproxy_arm64_to_x86_64_libneuralnetworks \
    libproxy_arm64_to_x86_64_libvulkan \
    libproxy_arm64_to_x86_64_libwebviewchromium_plat_support \
	ndk_translation_program_runner_binfmt_misc \
	ndk_translation.rc

PRODUCT_SOONG_NAMESPACES += frameworks/libs/native_bridge_support/android_api/libc
