#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:53e097adb7c180959091c4cb155a6402e88a4e97; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:5224173629695b9a89b2572d42a7157f2c4bfa17 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:53e097adb7c180959091c4cb155a6402e88a4e97 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
