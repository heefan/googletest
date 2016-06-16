LOCAL_PATH := $(call my-dir)


$(warning ************************)
$(warning  JNI ==> Android.mk)
$(warning ************************)


include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(ANDROID_NDK_ROOT)/sources/third_party/googletest/googletest/include
LOCAL_C_INCLUDES := $(ANDROID_NDK_ROOT)/sources/third_party/gmock/include
LOCAL_EXPORT_C_INCLUDES :=  $(ANDROID_NDK_ROOT)/sources/third_party/googletest/googletest/include
LOCAL_EXPORT_C_INCLUDES +=  $(ANDROID_NDK_ROOT)/sources/third_party/gmock/include

LOCAL_MODULE := foo      # library name
LOCAL_SRC_FILES := foo.cpp    # source code
include $(BUILD_SHARED_LIBRARY) # build as so file, libfoo.so

include $(CLEAR_VARS)
LOCAL_MODULE := foo_unittest   # exe name
LOCAL_SRC_FILES := foo_unittest.cpp # exe source code
LOCAL_SHARED_LIBRARIES := foo  # link library libfoo.so
LOCAL_STATIC_LIBRARIES := gmock_main # link library  libgoogletest_main.a
LOCAL_STATIC_LIBRARIES := googletest_main # link library  libgoogletest_main.a

include $(BUILD_EXECUTABLE)    

$(call import-module,third_party/gmock)   
$(call import-module,third_party/googletest)   

