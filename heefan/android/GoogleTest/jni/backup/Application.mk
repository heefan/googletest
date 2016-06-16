APP_ABI := all
APP_STL := gnustl_shared
#APP_STL := stlport_static
APP_CPPFLAGS += -DGTEST_USE_OWN_TR1_TUPLE=1
APP_CPPFLAGS += -std=c++11
#APP_STL := gnustl_static
#APP_STL := c++_static
