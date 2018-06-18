function el-qemu
	optirun qemu-system-x86_64 -enable-kvm -machine q35,accel=kvm -vga virtio -net nic -net user -netdev user,id=vmnic -device virtio-net,netdev=vmnic -display gtk,gl=on -cpu host -m 6G -drive file=eos.img,if=virtio,format=raw -usbdevice host:1871:0142;
end

