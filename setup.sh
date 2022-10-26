insmod /lib/modules/5.10.0-xilinx-v2021.1/extra/piradio0.ko &&
insmod /lib/modules/5.10.0-xilinx-v2021.1/extra/piradio1.ko &&
ifconfig piradio00 up &&
ifconfig piradio10 up &&./zcu111_setup.elf -t template.bin -m map.bin -s sync_word.bin -p &&
ip addr add 192.168.4.4/24 dev piradio00 &&
ip addr add 192.168.5.5/24 dev piradio10




