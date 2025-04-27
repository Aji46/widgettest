// import 'package:flutter/material.dart';

// class WaveformPainter extends CustomPainter {
//   final List<double> waveform;
//   final double progress; // Value from 0 to 1
//   final Color playedColor;
//   final Color unplayedColor;
//   final double barWidth;

//   WaveformPainter(
//     this.waveform,
//     this.progress, {
//     required this.playedColor,
//     required this.unplayedColor,
//     required this.barWidth,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint playedPaint = Paint()..color = playedColor;
//     final Paint unplayedPaint = Paint()..color = unplayedColor;

//     double barSpacing = barWidth;
//     for (int i = 0; i < waveform.length; i++) {
//       double x = i * (barWidth + barSpacing);
//       double height = waveform[i] * size.height;
//       double y = (size.height - height) / 2;

//       final paint = i / waveform.length < progress ? playedPaint : unplayedPaint;
//       canvas.drawRect(Rect.fromLTWH(x, y, barWidth, height), paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }


import 'package:flutter/material.dart';

class WaveformPainter extends CustomPainter {
  final List<double> waveformData;
  final double progress;
  final Color playedColor;
  final Color unplayedColor;
  final double barWidth;
  final double waveWidth;

  WaveformPainter({
    required this.waveformData,
    required this.progress,
    required this.playedColor,
    required this.unplayedColor,
    required this.barWidth,
    required this.waveWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint playedPaint = Paint()..color = playedColor;
    final Paint unplayedPaint = Paint()..color = unplayedColor;

    double totalBars = waveformData.length.toDouble();
 double barSpacing = totalBars > 1
    ? (waveWidth - (barWidth * totalBars)) / (totalBars - 1)
    : 0;

    double centerY = size.height / 2;

    for (int i = 0; i < waveformData.length; i++) {
      double x = (barWidth + barSpacing) * i;
      double halfHeight = (size.height * waveformData[i]) / 2;

      Rect barRect = Rect.fromLTRB(
        x,
        centerY - halfHeight,
        x + barWidth,
        centerY + halfHeight,
      );

      final paint = i / totalBars < progress ? playedPaint : unplayedPaint;
      canvas.drawRect(barRect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
