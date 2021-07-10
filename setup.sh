#!/bin/bash

asusctl graphics -m integrated

echo "logout and log back in Once you do this you wont have to do it again"

echo "Install these with your package manager: qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq\nThen edt settings in virt manager to add to the next thing in the game"
echo "If you are using fedora, open up a second terminal and make sure to change this line #security_default_confined = 1 to security_default_confined = 0 in the /etc/libvirt/qemu.conf"
echo "edit this file /etc/asusd/asusd.conf and make "gfx_vfio_enable": false,   -   "gfx_vfio_enable": true,"
read -e "Press enter to continue after doing the steps above"

sudo systemctl restart asusd
asusctl graphics -m vfio

#!/bin/bash
shopt -s nullglob
for g in `find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V`; do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;

read -e "Now copy this list and enter it into a text editor"


wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso
sudo mkdir -p /etc/libvirt/hooks/qemu.d && sudo wget 'https://asus-linux.org/files/vfio/libvirt_hooks/qemu' -O /etc/libvirt/hooks/qemu && sudo chmod +x /etc/libvirt/hooks/qemu
sudo systemctl restart libvirtd

echo "Enter Virtual Machine Mountain $: "
read vmname

sudo mkdir /etc/libvirt/hooks/qemu.d/$vmname && sudo mkdir -p /etc/libvirt/hooks/qemu.d/$vmname/prepare/begin && sudo mkdir -p /etc/libvirt/hooks/qemu.d/$vmname/release/end && sudo mkdir -p /etc/libvirt/hooks/qemu.d/$vname/stopped/end
