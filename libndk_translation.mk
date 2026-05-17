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
	libberberis_exec_region \
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
	libndk_translation \
	ndk_translation_program_runner_binfmt_misc \
	ndk_translation.rc \
	cpuinfo.arm64.txt \
	ld.config.arm64.txt

PRODUCT_SOONG_NAMESPACES += frameworks/libs/native_bridge_support/android_api/libc
