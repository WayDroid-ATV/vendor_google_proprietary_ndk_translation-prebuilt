# Bundle libndk_translation as ARM on x86 native bridge
WITH_NATIVE_BRIDGE := true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.berberis.flags=accurate-sigsegv \
	ro.berberis.version=16.0.0 \
	ro.dalvik.vm.native.bridge=libndk_translation.so \
	ro.dalvik.vm.isa.arm64=x86_64 \
	ro.enable.native.bridge.exec=1

PRODUCT_PACKAGES += ndk_translation_program_runner
