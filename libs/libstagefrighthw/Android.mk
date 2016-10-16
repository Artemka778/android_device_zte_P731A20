LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    SprdOMXPlugin.cpp \
	SprdOMXComponent.cpp \
	SprdSimpleOMXComponent.cpp

LOCAL_CFLAGS := $(PV_CFLAGS_MINUS_VISIBILITY)

LOCAL_C_INCLUDES:= \
    $(TOP)/frameworks/native/include/media/openmax \
	$(TOP)/frameworks/native/include/media/hardware \
	$(TOP)/vendor/sprd/open-source/libs/libstagefrighthw/include	\
	$(TOP)/vendor/sprd/open-source/libs/gralloc

LOCAL_SHARED_LIBRARIES :=       \
        libbinder               \
        libutils                \
        libcutils               \
        libui                   \
        libdl			\
	libstagefright_foundation
LOCAL_MODULE := libstagefrighthw

LOCAL_CFLAGS:= -DLOG_TAG=\"$(TARGET_BOARD_PLATFORM).libstagefright\"

ifeq ($(TARGET_BUILD_VARIANT), userdebug)
        LOCAL_CPPFLAGS += -DDUMP_DEBUG
endif

include $(BUILD_SHARED_LIBRARY)

