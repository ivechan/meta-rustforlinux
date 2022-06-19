# meta-rustforlinux

meta-rustforlinux is an unoffcial yocto layer for https://github.com/Rust-for-Linux/linux

The goal of this layer is to make it easier to develop with rustforlinux..

# Usage

- git clone -b kirkstone git://git.yoctoproject.org/poky.git
- git clone https://github.com/Rust-for-Linux /data/linux-yocto # for local modification
- See https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst (rustforlinux quickstart) for rustc and bindgen requiremtns

- source poky/oe-init-build-env

- append the following text to `conf/local.conf`

```
PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
HOSTTOOLS += "rustc bindgen cc"
export LIBCLANG_PATH = "/path/to/clang/lib"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
```

- bitbake core-image-full-cmdline # so sshd works fine.
- runqemu kvm # Yes, I prefer KVM



# Something
- LIBCLANG_PATH see https://rust-lang.github.io/rust-bindgen/requirements.html