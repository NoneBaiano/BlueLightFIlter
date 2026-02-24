#!/system/bin/sh
# =============================================================
# BlueFilter - Installation script
# Executed by Magisk / KernelSU during module flash
# =============================================================

MODDIR="/data/adb/modules/bluelightfilter"
CONFIG_DEST="$MODDIR/config.conf"

ui_print ""
ui_print "============================================"
ui_print "   Blue Light Filter"
ui_print "   System-wide filter via SurfaceFlinger"
ui_print "============================================"
ui_print ""

# ------ Android SDK check ------
SDK=$(getprop ro.build.version.sdk)
ui_print "  Android SDK : ${SDK:-unknown}"

if [ -n "$SDK" ] && [ "$SDK" -lt 26 ]; then
    ui_print "  [WARNING] Android 8.0+ (SDK 26+) is required."
    ui_print "  The filter may not work correctly on this device."
    ui_print ""
fi

# ------ SurfaceFlinger binary check ------
if [ ! -f "/system/bin/service" ]; then
    ui_print "  [WARNING] /system/bin/service not found."
    ui_print "  SurfaceFlinger control will not work on this ROM."
    ui_print ""
fi

# ------ Set binary permissions ------
ui_print "  Setting binary permissions..."
set_perm "$MODPATH/system/bin/bluefilter" root root 0755

# ------ Install config ------
# On a fresh install: copy the bundled default.
# On an upgrade: keep the user's existing config untouched.
mkdir -p "$MODDIR"
if [ ! -f "$CONFIG_DEST" ]; then
    cp "$MODPATH/config.conf" "$CONFIG_DEST"
    ui_print "  Default config installed."
else
    ui_print "  Existing config preserved."
fi

# ------ First-install vs upgrade detection ------
# We use a sentinel file written at the end of the first install.
# If it is absent this is a fresh install; if present, it's an upgrade.
SENTINEL="$MODDIR/.installed"
if [ ! -f "$SENTINEL" ]; then
    # Fresh install — start with the filter off and auto-boot off.
    rm -f "$MODDIR/enabled" "$MODDIR/autoboot"
    touch "$SENTINEL"
    ui_print "  Fresh install — filter starts disabled."
else
    ui_print "  Upgrade — existing filter state preserved."
fi

ui_print ""
ui_print "  Installation complete."
ui_print ""
