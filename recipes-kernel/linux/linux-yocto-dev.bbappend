KBRANCH = "rust"

SRC_URI = "git:///data/linux-yocto;protocol=file;name=machine;branch=rust; \
           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
LINUX_VERSION = "5.19.0-rc1"

# rust.cfg is the configs for rust
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://defconfig"

PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"

SRCREV_machine:qemux86 = "${AUTOREV}"
SRCREV_machine:qemux86-64 = "${AUTOREV}"
SRCREV_machine:qemuarm64 = "${AUTOREV}"
SRCREV_machine:qemuriscv64 = "${AUTOREV}"

SRCREV_meta = "${AUTOREV}"

do_configure:append() {
    make rustavailable # for sanity check
}