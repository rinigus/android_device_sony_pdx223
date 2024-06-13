#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE_COMMON=pdx223
export DEVICE_COMMON=sm8450-common
export VENDOR=sony

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
