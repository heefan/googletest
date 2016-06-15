# Googletest on Android

heefan@14Jun2016

## Development Environment 

```
Android Studio 2.1.2
Android API 8
MacOSX 10.11.5
Xcode 7.3.1
android-ndk-r11c
```

## Intent

First time run googletest on Android, seek simplest sample to run it. 
Reference from `android-ndk-r11c/sources/third_party/googletest`


## Steps
(1) Create an Application, and named `GoogleTestApp`
(2) create an `jin` folder under project `GoogleTest/jni`

```
jni
├── Android.mk  
├── Application.mk
├── foo.cpp
├── foo.h
├── foo_unittest.cpp
└── run.sh

0 directories, 6 files
```

1. Android.mk => `ndk-build` need to build the file.
2. Application.mk => you have to enable `C++` support here.
3. foo.cpp/foo.h => Generate foo.so
4. foo_unittest.cpp => application to run test
5. run.sh => copy file to android and run it. 

**Build**

```
[heefan@/Users/heefan/heefan/github/googletest/heefan/android/GoogleTest/jni] >>  (heefan/android)
$ndk-build
[arm64-v8a] Compile++      : foo <= foo.cpp
[arm64-v8a] SharedLibrary  : libfoo.so
[arm64-v8a] Install        : libfoo.so => libs/arm64-v8a/libfoo.so
[arm64-v8a] Compile++      : foo_unittest <= foo_unittest.cpp

...

[mips] Compile++      : googletest_static <= gtest-typed-test.cc
[mips] Compile++      : googletest_static <= gtest.cc
[mips] StaticLibrary  : libgoogletest_static.a
[mips] Executable     : foo_unittest
[mips] Install        : foo_unittest => libs/mips/foo_unittest
```

1. generated static library `libgoogletest_static.a`
2. generated executable `foo_unittest`
3. Install path `libs/`

**Run it**

```
[heefan@/Users/heefan/heefan/github/googletest/heefan/android/GoogleTest/jni] >>  (heefan/android)
$./run.sh
896 KB/s (9332 bytes in 0.010s)
2931 KB/s (255452 bytes in 0.085s)
Running main() from gtest_main.cc
[==========] Running 2 tests from 1 test case.
[----------] Global test environment set-up.
[----------] 2 tests from FooTest
[ RUN      ] FooTest.ZeroZero
[       OK ] FooTest.ZeroZero (0 ms)
[ RUN      ] FooTest.OneOne
[       OK ] FooTest.OneOne (0 ms)
[----------] 2 tests from FooTest (4 ms total)

[----------] Global test environment tear-down
[==========] 2 tests from 1 test case ran. (9 ms total)
[  PASSED  ] 2 tests.

```

**Notes for the case**

1. Must add `APP_STL := stlport_static` into `Application.mk`, otherwise you will get error on `cannot find <limit> as you need CPP support`
2. No need to worry about `gnustl_shared`. It mentioned in `android-ndk-r11c/sources/third_party/googletest`

