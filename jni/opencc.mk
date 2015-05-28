# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)/OpenCC/src

include $(CLEAR_VARS)
LOCAL_MODULE    := opencc #1.0.2
LOCAL_SRC_FILES :=   BinaryDict.cpp \
  Config.cpp \
  Conversion.cpp \
  ConversionChain.cpp \
  Converter.cpp \
  DartsDict.cpp \
  Dict.cpp \
  DictEntry.cpp \
  DictGroup.cpp \
  MaxMatchSegmentation.cpp \
  PhraseExtract.cpp \
  SimpleConverter.cpp \
  Segmentation.cpp \
  TextDict.cpp \
  UTF8StringSlice.cpp \
  UTF8Util.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../deps/rapidjson-0.11 $(LOCAL_PATH)/../deps/darts-clone

LOCAL_LDLIBS := -latomic
#LOCAL_STATIC_LIBRARIES := c++_static
#LOCAL_CLANG :=true
#LOCAL_CFLAGS := -std=c++11
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := opencc_tool
LOCAL_SRC_FILES :=   tools/CommandLine.cpp
LOCAL_SHARED_LIBRARIES := libopencc
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../deps/tclap-1.2.1
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := opencc_dict
LOCAL_SRC_FILES :=   tools/DictConverter.cpp
LOCAL_SHARED_LIBRARIES := libopencc
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../deps/tclap-1.2.1
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE    := opencc_phrase_extract
LOCAL_SRC_FILES :=   tools/PhraseExtract.cpp
LOCAL_SHARED_LIBRARIES := libopencc
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../deps/tclap-1.2.1
include $(BUILD_EXECUTABLE)
