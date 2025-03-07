// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class TextWrapper extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;
  final String tooltip;

  const TextWrapper(
    this.text, {
    super.key,
    String? tooltip,
    this.style = const TextStyle(),
    this.maxLines = 1,
  }) : tooltip = tooltip ?? text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ThemeHelper.isTextExceedWidth(text, style, constraints.maxWidth)) {
          return Tooltip(
            message: tooltip,
            child: Text(
              text,
              style: style,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          );
        } else {
          return Text(
            text,
            style: style,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          );
        }
      },
    );
  }
}
