# Bundle libndk_translation as ARM on x86 native bridge
WITH_NATIVE_BRIDGE := true

# These are platform properties consumed by ART/native-bridge components.
# Keep them on the system side instead of routing them through vendor/build.prop.
PRODUCT_SYSTEM_PROPERTIES += \
	ro.dalvik.vm.native.bridge=libndk_translation.so \
	ro.dalvik.vm.isa.arm=x86 \
	ro.dalvik.vm.isa.arm64=x86_64 \
	ro.enable.native.bridge.exec=1 \
	ro.enable.native.bridge.exec64=1 \
	ro.ndk_translation.version=0.2.3 \
	ro.ndk_translation.flags=accurate-sigsegv

# Keep the enable switch with the native-bridge bundle so products do not need
# to duplicate it.
PRODUCT_SYSTEM_PROPERTIES += \
	persist.sys.nativebridge=1

# Vendor-scoped compatibility properties belong in vendor/build.prop.
PRODUCT_VENDOR_PROPERTIES += \
	ro.vendor.enable.native.bridge.exec=1 \
	ro.vendor.enable.native.bridge.exec64=1

PRODUCT_PACKAGES += ndk_translation_program_runner
