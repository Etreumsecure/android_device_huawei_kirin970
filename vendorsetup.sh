if [[ -e vendor/slim ]]; then
    add_lunch_combo slim_kirin970-userdebug
elif [[ -e vendor/omni ]]; then
    add_lunch_combo omni_kirin970-userdebug
elif [[ -e vendor/cm ]]; then
    add_lunch_combo lineage_kirin970-userdebug
elif [[ -e vendor/rr ]]; then
    add_lunch_combo rr_kirin970-userdebug
elif [[ -e vendor/validus ]]; then
    add_lunch_combo validus_kirin970-userdebug
elif [[ -e vendor/gzosp ]]; then
    add_lunch_combo gzosp_kirin970-eng
else
    add_lunch_combo aosp_kirin970-userdebug
fi
