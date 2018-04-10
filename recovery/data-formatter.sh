#!/sbin/sh

DATABLOCK="/dev/block/bootdevice/by-name/userdata"
UPDATERFD_PATH=""
FORMAT_COMMAND="mkfs.f2fs"
get_updater_info() {

    UPDATERPID=""
    UPDATERFD=""
    UPDATERPROC=""

    for line in "$(ps | grep updater)"
    do
	    if [[ "$(echo $line | cut -d ' ' -f5)" == "/tmp/updater" ]]; then
	    	UPDATERPID="$(echo $line | cut -d ' ' -f1)"
		UPDATERFD="$(echo $line | cut -d ' ' -f7)"
	    	break
	    fi
    done

    UPDATERFD_PATH="/proc/$UPDATERPID/fd/$UPDATERFD"
}

mecho(){
    echo -n -e "ui_print      $1\n" > "$UPDATERFD_PATH"
    echo -n -e "ui_print\n" > "$UPDATERFD_PATH"
}

checkerror() {
    if [[ $1 -gt 0 ]]; then
	if [[ "$3" == "-fatal" ]]; then
		mecho "ERROR: $2"
		exit $1
	else
		mecho "WARNING: $2"	
	fi
    fi
}

umount() {
	if [[ $( cat /proc/mounts | grep -c $1) -gt 0 ]]; then
		/sbin/umount $1
		checkerror $? "Could not umount $1" $2
	else
		mecho "$1 is already umounted.."
	fi
}

printheader() {
mecho '              ______     ______     __  __          '
mecho '             /\  ___\   /\  __ \   /\ \_\ \         '
mecho '             \ \ \____  \ \ \/\ \  \ \  __ \        ' 
mecho '              \ \_____\  \ \_____\  \ \_\ \_\       '
mecho '               \/_____/   \/_____/   \/_/\/_/       '
mecho '                                                    '
}

clearscreen() {
    I=0
    while true
    do
	mecho ""
 	if [[ $I -eq 19 ]]; then break; fi
	I=$(expr $I + 1)
    done
}

wait_umounted() {
	while [[ $( cat /proc/mounts | grep -c $1) -gt 0 ]]; do sleep 0.1;umount $1;done 
}

is_custom() {
    if [[ ! -e /system/build.prop ]]; then
		mecho "No build.prop assume stock"
		wait_unmounted /system
                /sbin/setprop sys.stock 1
		return
	fi

	if [[ $( cat /system/build.prop | grep -c "ro.config.twrp=custom") -gt 0 ]]; then
		mecho "Custom ROM"
		wait_umounted /system
		/sbin/setprop sys.stock 0
	elif [[ $( cat /system/build.prop | grep -c 'ro.build.id=Elite ROM') -gt 0 ]]; then
		mecho "Fstab Mode EliteROM"
		wait_unmounted /system
		/sbin/setprop sys.stock 0
	else
		wait_umounted /system
		/sbin/setprop sys.stock 1
	fi
}

mount /system -fatal
is_custom

if [[ "$(getprop sys.stock)" == "1" ]]; then
    get_updater_info
    clearscreen
    printheader
    checkerror 1 "The current ROM is a stock EMUI ROM."
    checkerror 1 "Internal storage MUST be formatted!"
    checkerror 1 "You have an opportunity to stop -"
    checkerror 1  "and back up your data now."
    mecho ""
    checkerror 1 "Do you wish to continue?"
    checkerror 1 "[volume up: yes | volume down: no]?"
    mecho ""
    if [[ "$(/tmp/install/bin/volumeinput)" == "down" ]]; then
        checkerror 1 "Installation cancelled."
        checkerror 1 "Nothing has been modified."
        checkerror 1 " " -fatal
    fi
    mecho "" 
    mecho "Unmounting /sdcard"
    umount /sdcard
    mecho "Unmounting /data"
    umount /data 
    mecho "Formatting /data using $FORMAT_COMMAND ..."
    $FORMAT_COMMAND $DATABLOCK
    checkerror $? "Could not format userdata!." -fatal
    mecho "Format of /data complete."
    mecho ""
    sleep 2
fi
