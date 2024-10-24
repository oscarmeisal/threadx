set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR aarch64)


set(CMAKE_C_COMPILER    aarch64-none-elf-gcc)
set(CMAKE_CXX_COMPILER  aarch64-none-elf-g++)
set(AS                  aarch64-none-elf-as)
set(AR                  aarch64-none-elf-ar)
set(OBJCOPY             aarch64-none-elf-objcopy)
set(OBJDUMP             aarch64-none-elf-objdump)
set(SIZE                aarch64-none-elf-size)

set(THREADX_ARCH "cortex_a53")
set(THREADX_TOOLCHAIN "gnu")

# These flags are set by CMAKE_C_FLAGS
set(CCS_FLAGS "-mabi=lp64 -mcmodel=large -mstrict-align -mfix-cortex-a53-835769 -mfix-cortex-a53-843419 -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast -Wno-unused-but-set-variable")

set(MCPU_FLAGS "-mcpu=cortex-a53")

set(CMAKE_C_FLAGS   "${MCPU_FLAGS} ${CCS_FLAGS}" CACHE INTERNAL "c compiler flags")
set(CMAKE_CXX_FLAGS "${MCPU_FLAGS} ${CCS_FLAGS} -fno-rtti -fno-exceptions" CACHE INTERNAL "cxx compiler flags")
set(CMAKE_ASM_FLAGS "${MCPU_FLAGS} ${CCS_FLAGS} -x assembler-with-cpp" CACHE INTERNAL "asm compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "${MCPU_FLAGS} ${LD_FLAGS} ${CCS_FLAGS} -Wl,--gc-sections" CACHE INTERNAL "exe link flags")

SET(CMAKE_C_FLAGS_DEBUG "-Og -g -ggdb3" CACHE INTERNAL "c debug compiler flags")
SET(CMAKE_CXX_FLAGS_DEBUG "-Og -g -ggdb3" CACHE INTERNAL "cxx debug compiler flags")
SET(CMAKE_ASM_FLAGS_DEBUG "-g -ggdb3" CACHE INTERNAL "asm debug compiler flags")

SET(CMAKE_C_FLAGS_RELEASE "-O3" CACHE INTERNAL "c release compiler flags")
SET(CMAKE_CXX_FLAGS_RELEASE "-O3" CACHE INTERNAL "cxx release compiler flags")
SET(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "asm release compiler flags")

# this makes the test compiles use static library option so that we don't need to pre-set linker flags and scripts
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
