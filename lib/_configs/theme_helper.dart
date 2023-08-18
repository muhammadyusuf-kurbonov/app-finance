// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

class ThemeHelper {
  final AdaptiveWindowType windowType;

  const ThemeHelper({
    required this.windowType,
  });

  bool isLower(AdaptiveWindowType size) => windowType <= size;

  double getIndent() => 8.0;

  bool isVertical(BoxConstraints constraints) => constraints.maxWidth < constraints.maxHeight;
}
