SKIPUNZIP=1

enforce_install_from_app() {
  if $BOOTMODE; then
    ui_print "- Installing from Magisk/KernelSU app"
  else
    ui_print "*********************************************************"
    ui_print "! Install from recovery is NOT supported"
    ui_print "! Please install from Magisk/KernelSU"
    abort "*********************************************************"
  fi
}

ui_print "- Extracting module files"
unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2

if [ "$API" -lt 34 ]; then
  rm -rf "$MODPATH/zygisk"
fi

set_perm_recursive "$MODPATH" 0 0 0755 0644
