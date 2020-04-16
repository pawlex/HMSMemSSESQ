
#!/usr/bin/env bash


SOURCE_ROOT=`cat /proc/mounts  | grep ' / ' | awk '{ print $1 }'`
SOURCE_BOOT=`cat /proc/mounts  | grep ' /boot/efi ' | awk '{ print $1 }'`
echo SOURCE ROOT PARTITION: $SOURCE_ROOT
echo SOURCE BOOT PARTITION: $SOURCE_BOOT
blkid | grep PTTYPE
echo ""

#if [ -e "$1" ] && [ -e "$2" ]; then
if [ -z "$1" ]; then
        echo "usage: $0 <destination device> ex: /dev/nvme0n1"
        exit 0
fi

#Number  Start   End     Size    File system  Name    Flags
# 1      1049kB  512MB   511MB   fat32        EFI     msftdata
# 2      512MB   8000MB  7488MB  ext4         LINUX

echo "Disacarding all blocks on $1"
blkdiscard $1
echo "Creating partition layout on $1"
parted --script $1 \
    mklabel gpt \
    mkpart EFI fat32 1MB 512MB \
    mkpart LINUX 512MB 8000MB \
    toggle 1 msftdata \
    print
#
echo "Updating kernel partition table"
kpartx -u $1

# TODO: Handle sda/nvme partition numbering
echo "Cloning BOOT filesystem"
pv -p $SOURCE_BOOT > ${1}p1
echo "Cloning ROOT filesystem"
pv -p $SOURCE_ROOT > ${1}p2
echo "Fixing ROOT filesystem"
e2fsck ${1}p2 -af
echo "DONE"
