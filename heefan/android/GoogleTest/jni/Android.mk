LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := foo      # library name
LOCAL_SRC_FILES := foo.cpp    # source code
include $(BUILD_SHARED_LIBRARY) # build as so file, libfoo.so

include $(CLEAR_VARS)
LOCAL_MODULE := foo_unittest   # exe name
LOCAL_SRC_FILES := foo_unittest.cpp # exe source code
LOCAL_SHARED_LIBRARIES := foo  # link library libfoo.so
LOCAL_STATIC_LIBRARIES := googletest_main # link library  libgoogletest_main.a
LOCAL_STATIC_LIBRARIES += gmock_main # link library  libgoogletest_main.a

include $(BUILD_EXECUTABLE)    

$(call import-module,third_party/googletest)   
$(call import-module,third_party/gmock)

