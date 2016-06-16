#APP_ABI := all
#APP_STL := gnustl_shared
#APP_STL := stlport_static
#APP_CPPFLAGS += -DGTEST_USE_OWN_TR1_TUPLE=1
#APP_CPPFLAGS += -std=c++11
##APP_STL := gnustl_static
##APP_STL := c++_static


NDK_TOOLCHAIN_VERSION := 4.9
#APP_ABI := armeabi armeabi-v8a x86 mips
#  Enable C++11. However, pthread, rtti and exceptions aren’t enabled 
APP_CPPFLAGS += -std=c++11
# Instruct to use the static GNU STL implementation
APP_STL := gnustl_static
LOCAL_C_INCLUDES += ${ANDROID_NDK_ROOT}/sources/cxx-stl/gnu-libstdc++/4.9/include
