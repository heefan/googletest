adb push ../libs/armeabi/libfoo.so /data/local/tmp/
adb push ../libs/armeabi/foo_unittest /data/local/tmp/
adb shell chmod 775 /data/local/tmp/foo_unittest
adb shell "LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/foo_unittest"

