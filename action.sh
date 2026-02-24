#!/system/bin/sh
# =============================================================
# BlueFilter - WebUI launcher (action.sh)
# Called when the user taps the module action button in MMRL
# or KSUWebUIStandalone. Tries known WebUI hosts in order.
# =============================================================

# Try KSUWebUIStandalone first
if pm path io.github.a13e300.ksuwebui > /dev/null 2>&1; then
    am start \
        -n "io.github.a13e300.ksuwebui/.WebUIActivity" \
        -e id "bluelightfilter" \
        > /dev/null 2>&1
    exit 0
fi

# Try MMRL
if pm path com.dergoogler.mmrl > /dev/null 2>&1; then
    am start \
        -n "com.dergoogler.mmrl/.ui.activity.webui.WebUIActivity" \
        -e MOD_ID "bluelightfilter" \
        > /dev/null 2>&1
    exit 0
fi

# Neither app found — open the KSUWebUIStandalone release page
echo "[BlueFilter] No WebUI host found."
echo "Install KSUWebUIStandalone to use the graphical interface:"
sleep 1
am start \
    -a android.intent.action.VIEW \
    -d "https://github.com/5ec1cff/KsuWebUIStandalone/releases" \
    > /dev/null 2>&1
exit 0
