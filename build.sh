## Instructions to build the yocto image for raspberry pi
echo "Adding submodules poky, meta-raspberrypi, meta-openembedded"

## commands to add submodules 

git submodule add --branch kirkstone https://git.yoctoproject.org/poky

git submodule add --branch kirkstone https://git.yoctoproject.org/meta-raspberrypi

git submodule add --branch kirkstone https://git.openembedded.org/meta-openembedded

git submodule init
git submodule update

## commands to add .gitignore 
echo "poky/" > .gitignore 
echo "meta-raspberrypi/" >> .gitignore 
echo "meta-openembedded/" >> .gitignore 


MACHINE="raspi4b" bitbake core-image-base

bitbake core-image-minimal

runqemu qemuarm

cd ./tmp/deploy/images/raspberrypi4-64/

qemu-system-aarch64 \
    -machine virt \
    -cpu cortex-a57 \
    -m 1024 \
    -kernel Image-raspberrypi4-64.bin \
    -append "console=ttyAMA0 root=/dev/vda rw" \
    -drive file=core-image-minimal-raspberrypi4-64-20250226060752.rootfs.ext3,if=virtio,format=raw \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net-device,netdev=net0 \
    -nographic


wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.19.50-buster

qemu-system-aarch64 \
    -M raspi3 \
    -cpu cortex-a72 \
    -m 1G \
    -kernel kernel-qemu-4.19.50-buster \
    -dtb bcm2710-rpi-3-b.dtb \
    -sd build/tmp/deploy/images/raspberrypi4-64/core-image-minimal-raspberrypi4-64.rpi-sdimg \
    -serial stdio \
    -append "root=/dev/mmcblk0p2 rw console=ttyAMA0,115200 rootwait" \
    -net user,hostfwd=tcp::5022-:22 \
    -net nic


qemu-system-aarch64 \
    -M raspi3 \
    -cpu cortex-a72 \
    -m 1G \
    -kernel kernel-qemu-4.19.50-buster \
    -dtb bcm2710-rpi-3-b.dtb \
    -sd build/tmp/deploy/images/raspberrypi4-64/core-image-minimal-raspberrypi4-64.rpi-sdimg \
    -serial stdio \
    -append "root=/dev/mmcblk0p2 rw console=ttyAMA0,115200 rootwait" \
    -net user,hostfwd=tcp::5022-:22 \
    -net nic


qemu-system-aarch64 -enable-kvm \
-machine raspi3b -cpu cortex-a53  \
-dtb bcm2710-rpi-3-b.dtb \
-m 1G -smp 4 \
-kernel kernel8.img \
-sd ./Downloads/rpi.img \
-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \
-device usb-net,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::2222-:22 \
-no-reboot -nographic



qemu-system-aarch64 -M raspi4b2g -dtb bcm2711-rpi-4-b.dtb -sd core-image-full-cmdline-raspberrypi4-64.rpi-sdimg -kernel kernel8.img -nographic -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2"

P=/home/mj/Downloads/mj-personal/git/final-project/final-project-mukesh2006/build/tmp/deploy/images/raspberrypi4
qemu-system-arm -kernel ~/qemu_vms/<your-kernel-qemu> -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda core-image-base-raspberrypi4.ext3 -redir tcp:5022::22 -no-reboot


qemu-img convert -O raw core-image-base-raspberrypi4.wic.bz2 rpi_image.raw


qemu-system-aarch64 \
  -M raspi3b \
  -kernel /home/mj/Downloads/mj-personal/git/final-project/final-project-mukesh2006/build/tmp/deploy/images/raspberrypi4/zImage-1-5.15.92+git0+509f4b9d68_14b35093ca-r0-raspberrypi4-20250225194830.bin \
  -dtb /home/mj/Downloads/mj-personal/git/final-project/final-project-mukesh2006/build/tmp/deploy/images/raspberrypi4/bcm2710-rpi-3-b.dtb \
  -drive file=rpi_image.raw,if=sd,format=raw \
  -append "root=/dev/mmcblk0p2 rw rootwait console=ttyAMA0,115200" \
  -serial stdio \
  -display none