# piradio-petalinux
Piradio Petalinux related files

## Steps for running the loopback project

0. Download the BSP from https://drive.google.com/file/d/1VoNb8wjLIOT0elhalzlcvbscgjMh2Bw0/view?usp=sharing

1. Create the petalinux project ``` petalinux-create -t project -s piradio_loopback.bsp ```

2. Navigate inside the zcu111_ofdm/pre-built/linux/images/ folder

3. Copy the following files to the SD card:

    * BOOT.bin
    * boot.scr
    * Image
    * rootfs.cpio.gz.u-boot
    * system.dtb

4. Copy to the SD card also the following files from the piradio-petalinux repository:

    * setup.sh
    * map.bin
    * template.bin
    * sync_word.bin

5. Boot petalinux in the ZCU111 board with the SD card

6. Navigate to the mountpoint of the SD card on /mnt/sd-mmcblk0p1

7. Run ``` sh setup.sh ``` . This will setup the piradio modules in the kernel as well as the network interfaces

8. There are now two network interfaces available, piradio00 and piradio10 which are connected through the PL fabric. piradio00 is on the 192.168.4.0/24 subnet while the piradio10
is in the 192.168.5.0/24 subnet. In order for them to seamlesly communicate the piradio10 interface responds to 192.168.4.5 while piradio00 responds to 192.168.5.4 through a bit shift
operation that happens in the piradio kernel module. This helps trick the kernel into thinking the two interfaces are not on the same host but have the same subnet. Therefore, do
``` ping 192.168.4.5 ``` for pinging piradio10 from piradio00 and ``` ping 192.168.5.4 ``` for pinging piradio00 from piradio10.
