#!/bin/bash
set -e
REPO=/root/mikanos-observatory
(cd /root/edk2 && source edksetup.sh > /dev/null && build)
"$REPO/kernel/build.sh"
cd /root
./osbook/devenv/run_qemu.sh ./edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi "$REPO/kernel/kernel.elf"
