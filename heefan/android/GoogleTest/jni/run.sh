#adb push ../libs/armeabi/libAccountService.a /data/local/tmp/
adb push ../libs/armeabi/account_test /data/local/tmp/
adb shell chmod 775 /data/local/tmp/account_test
adb shell "LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/account_test"

