# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2019 The Mokee Open Source Project
# Copyright (C) 2019 The LineageOS Open Source Project
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

import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImage(info, basename, dest):
  name = basename
  data = info.input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def AddImageRadio(info, basename, dest):
  name = basename
  data = info.input_zip.read("RADIO/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info):
  info.script.Print("Patching firmware images...")
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
  AddImageRadio(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
  AddImageRadio(info, "vendor.img", "/dev/block/bootdevice/by-name/vendor")

  AddImageRadio(info, "modem.img", "/dev/block/bootdevice/by-name/modem")
  AddImageRadio(info, "tz.mbn", "/dev/block/bootdevice/by-name/tz")
  AddImageRadio(info, "km4.mbn", "/dev/block/bootdevice/by-name/keymaster")
  AddImageRadio(info, "aop.mbn", "/dev/block/bootdevice/by-name/aop")
  AddImageRadio(info, "BTFM.bin", "/dev/block/bootdevice/by-name/bluetooth")
  AddImageRadio(info, "cmnlib.mbn", "/dev/block/bootdevice/by-name/cmnlib")
  AddImageRadio(info, "cmnlib64.mbn", "/dev/block/bootdevice/by-name/cmnlib64")
  AddImageRadio(info, "dspso.bin", "/dev/block/bootdevice/by-name/dsp")
  AddImageRadio(info, "hyp.mbn", "/dev/block/bootdevice/by-name/hyp")
  AddImageRadio(info, "qupv3fw.elf", "/dev/block/bootdevice/by-name/qupfw")
  AddImageRadio(info, "storsec.mbn", "/dev/block/bootdevice/by-name/storsec")
  AddImageRadio(info, "uefi_sec.mbn", "/dev/block/bootdevice/by-name/uefisecapp")
  return
