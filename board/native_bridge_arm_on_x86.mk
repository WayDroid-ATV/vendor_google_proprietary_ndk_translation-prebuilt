# Enable support for ARM on x86 native bridge
BUILD_ARM_FOR_X86 := true

ifeq ($(filter x86 x86_64,$(TARGET_ARCH)),)
    $(error TARGET_ARCH needs to be set to x86 or x86_64)
endif

# If native bridge is bundled with the system, indicate support for ARM ABIs
NATIVE_BRIDGE_ABI_LIST_64_BIT := arm64-v8a
