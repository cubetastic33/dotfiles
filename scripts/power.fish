#!/usr/bin/fish

if test $argv[1] = "Reboot"
    systemctl reboot
    exit 0
else if test $argv[1] = "Shutdown"
    systemctl poweroff
    exit 0
else if test $argv[1] = "Hibernate"
    systemctl hibernate
    exit 0
else if test $argv[1] = "Suspend"
    systemctl suspend
    exit 0
else if test $argv[1] = "Lock"
    xset s activate
    exit 0
end

echo -en "Reboot\0icon\x1f/home/aravk/Pictures/power-icons/reboot.png\n"
echo -en "Shutdown\0icon\x1f/home/aravk/Pictures/power-icons/shutdown.png\n"
echo -en "Hibernate\0icon\x1f/home/aravk/Pictures/power-icons/hibernate.png\n"
echo -en "Suspend\0icon\x1f/home/aravk/Pictures/power-icons/suspend.png\n"
echo -en "Lock\0icon\x1f/home/aravk/Pictures/power-icons/lock.png\n"
