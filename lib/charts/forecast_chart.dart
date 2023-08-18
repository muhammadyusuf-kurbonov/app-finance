// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/forecast_chart_painter.dart';
import 'package:app_finance/charts/foreground_chart_painter.dart';
import 'package:flutter/material.dart';

class ForecastChart extends StatefulWidget {
  final double width;
  final double indent;
  final String tooltip;
  final List<Offset> data;
  final double yMax;

  const ForecastChart({
    super.key,
    required this.data,
    required this.yMax,
    required this.width,
    this.indent = 0.0,
    this.tooltip = '',
  });

  @override
  ForecastChartState createState() => ForecastChartState();
}

class ForecastChartState extends State<ForecastChart> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final size = Size(widget.width, widget.width / 1.9);
    final bg = ForegroundChartPainter(
      size: size,
      color: Colors.black,
      lineColor: Colors.black,
      background: Colors.black.withOpacity(0.1),
      yMin: 0.0,
      yMax: 1.4,
      yArea: [0.8, 1.2],
      xType: DateTime,
      xMin: DateTime(now.year, now.month),
      xMax: DateTime(now.year, now.month + 1),
    );
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        size: size,
        painter: ForecastChartPainter(
          color: Colors.red,
          indent: bg.shift,
          size: size,
          data: widget.data,
          yMax: widget.yMax,
          xMin: DateTime(now.year, now.month).microsecondsSinceEpoch.toDouble(),
          xMax: DateTime(now.year, now.month + 1).microsecondsSinceEpoch.toDouble(),
        ),
        foregroundPainter: bg,
        willChange: false,
        child: Padding(
          padding: EdgeInsets.only(top: widget.indent / 4),
          child: Text(widget.tooltip),
        ),
      ),
    );
  }
}
