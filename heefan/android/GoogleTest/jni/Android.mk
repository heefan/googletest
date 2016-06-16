LOCAL_PATH := $(call my-dir)

$(warning ************************)
$(warning  JNI ==> Android.mk)
$(warning ************************)


include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(ANDROID_NDK_ROOT)/sources/third_party/googletest/googletest/include
LOCAL_C_INCLUDES := $(ANDROID_NDK_ROOT)/sources/third_party/gmock/include
LOCAL_EXPORT_C_INCLUDES :=  $(ANDROID_NDK_ROOT)/sources/third_party/googletest/googletest/include
LOCAL_EXPORT_C_INCLUDES +=  $(ANDROID_NDK_ROOT)/sources/third_party/gmock/include

LOCAL_MODULE := AccountService      # library name
LOCAL_SRC_FILES := Account.cpp \
			       AccountService.cpp 
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := account_test 
LOCAL_SRC_FILES := AccountServiceTest.cpp \
				   Main.cpp

LOCAL_STATIC_LIBRARIES := gmock_main_ndk \
 						  gmock_ndk \
  						  googletest_main \
 						  AccountService \

include $(BUILD_EXECUTABLE)    
$(call import-module,third_party/gmock)   
$(call import-module,third_party/googletest)   
