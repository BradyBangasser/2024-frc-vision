// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

// Copyright (c) 2016 Nic Holthaus
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once

#include "units/base.h"

namespace units {
/**
 * @namespace units::data_transfer_rate
 * @brief namespace for unit types and containers representing data values
 * @details The base unit for data is `bytes`, and the corresponding `base_unit`
 *          category is `data_unit`.
 * @anchor dataContainers
 * @sa See unit_t for more information on unit type containers.
 */
#if !defined(DISABLE_PREDEFINED_UNITS) || \
    defined(ENABLE_PREDEFINED_DATA_TRANSFER_RATE_UNITS)
UNIT_ADD_WITH_METRIC_AND_BINARY_PREFIXES(
    data_transfer_rate, bytes_per_second, bytes_per_second, Bps,
    unit<std::ratio<1>, units::category::data_transfer_rate_unit>)
UNIT_ADD(data_transfer_rate, exabytes_per_second, exabytes_per_second, EBps,
         unit<std::ratio<1000>, petabytes_per_second>)
UNIT_ADD_WITH_METRIC_AND_BINARY_PREFIXES(
    data_transfer_rate, bits_per_second, bits_per_second, bps,
    unit<std::ratio<1, 8>, bytes_per_second>)
UNIT_ADD(data_transfer_rate, exabits_per_second, exabits_per_second, Ebps,
         unit<std::ratio<1000>, petabits_per_second>)

UNIT_ADD_CATEGORY_TRAIT(data_transfer_rate)
#endif

using namespace data_transfer_rate;
}  // namespace units
