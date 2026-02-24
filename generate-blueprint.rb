#!/usr/bin/env ruby

arm_bins_64bit = Dir['prebuilts/bin/arm64/*'].map { |lib| File.basename(lib) }
arm_libs_64bit = Dir['prebuilts/lib64/arm64/*.so'].map { |lib| File.basename(lib, '.so') }
ndk_libs_64bit = Dir['prebuilts/lib64/*.so'].map { |lib| File.basename(lib, '.so') }
required_list  = arm_bins_64bit + arm_libs_64bit + ndk_libs_64bit
android_bp     = File.open('Android.bp', 'w')

arm_bins_64bit.each do |bin|
    android_bp.write <<~EOF + "\n"
        cc_prebuilt_binary {
            name: "ndk_translation-#{bin}",
            stem: "#{bin}",
            check_elf_files: false,
            compile_multilib: "64",
            relative_install_path: "arm64",
            srcs: ["prebuilts/bin/arm64/#{bin}"],
            strip: {
                none: true,
            },
        }
    EOF
end

arm_libs_64bit.each do |lib|
    android_bp.write <<~EOF + "\n"
        cc_prebuilt_library_shared {
            name: "ndk_translation-#{lib}",
            stem: "#{lib}",
            check_elf_files: false,
            compile_multilib: "64",
            relative_install_path: "arm64",
            srcs: ["prebuilts/lib64/arm64/#{lib}.so"],
            strip: {
                none: true,
            },
        }
    EOF
end

ndk_libs_64bit.each do |lib|
    android_bp.write <<~EOF + "\n"
        cc_prebuilt_library_shared {
            name: "ndk_translation-#{lib}",
            stem: "#{lib}",
            check_elf_files: false,
            compile_multilib: "64",
            srcs: ["prebuilts/lib64/#{lib}.so"],
            strip: {
                none: true,
            },
        }
    EOF
end

android_bp.write <<~EOF
    prebuilt_etc {
        name: "ndk_translation-cpuinfo64",
        srcs: ["prebuilts/etc/cpuinfo.arm64.txt"],
    }

    prebuilt_etc {
        name: "ndk_translation-ldconfig64",
        srcs: ["prebuilts/etc/ld.config.arm64.txt"],
    }

    cc_prebuilt_binary {
        name: "ndk_translation_program_runner",
        check_elf_files: false,
        compile_multilib: "64",
        enabled: false,
        arch: {
            x86_64: {
                enabled: true,
                stem: "ndk_translation_program_runner_binfmt_misc_arm64",
                srcs: ["prebuilts/bin/ndk_translation_program_runner_binfmt_misc_arm64"],
                required: ["libberberis_exec_region", "ndk_translation-cpuinfo64", "ndk_translation-ldconfig64", #{required_list.map { |f| "ndk_translation-#{f}".inspect } .join(', ')}],
            },
        },
        init_rc: ["prebuilts/etc/init/ndk_translation.rc"],
        strip: {
            none: true,
        },
    }
EOF
