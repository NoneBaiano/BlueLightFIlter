#!/system/bin/sh
# =============================================================
# BlueFilter - Boot service
# Executed by Magisk / KernelSU after every boot
# =============================================================

MODDIR="/data/adb/modules/bluelightfilter"
AUTOBOOT_FILE="$MODDIR/autoboot"

# Wait until Android has fully booted
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

# Give SurfaceFlinger extra time to initialize and become stable.
# Without this delay the service call can silently fail.
sleep 5

# Only apply the filter if the user explicitly enabled auto-start
# on boot via the WebUI Quick Actions. The autoboot file is
# created / removed by the GUI — never by the filter toggle itself.
if [ -f "$AUTOBOOT_FILE" ]; then
    /system/bin/bluefilter start
fi
