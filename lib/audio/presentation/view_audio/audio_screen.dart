import 'package:flutter/material.dart';
import 'package:test_widget/audio/presentation/view_model/components/network_wave.dart';

class AudioWaveformCard extends StatelessWidget {
  final String audioFileName;
  final String? description;
  final VoidCallback? onClose;
  final VoidCallback? onTap;
  final Color waveformColor;
  final Color backgroundColor;
  final double height;
  final Widget? customContent;

  const AudioWaveformCard({
    Key? key,
    required this.audioFileName,
    this.description,
    this.onClose,
    this.onTap,
    this.waveformColor = Colors.black,
    this.backgroundColor = const Color(0xFFD1F5F5),
    this.height = 200,
    this.customContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            // Header with filename and close button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    audioFileName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (onClose != null)
                    InkWell(
                      onTap: onClose,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        child: const Center(child: Icon(Icons.close, size: 16)),
                      ),
                    ),
                ],
              ),
            ),
            
            // Waveform visualization
            Expanded(
              child: Stack(
                children: [
                  // The actual waveform
                AudioMessageBubble(path: '', ),
                ],
              ),
            ),
            
            // Description or custom content
            if (customContent != null)
              customContent!
            else if (description != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  description!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for the waveform
class WaveformPainter extends CustomPainter {
  final Color waveformColor;
  final double playbackProgress; // 0.0 to 1.0
  final Color playedColor;

  WaveformPainter({
    required this.waveformColor,
    required this.playbackProgress,
    required this.playedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveformColor
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final playedPaint = Paint()
      ..color = playedColor
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Draw a vertical playback position line
    final progressX = size.width * playbackProgress;
    canvas.drawLine(
      Offset(progressX, 0),
      Offset(progressX, size.height),
      Paint()
        ..color = playedColor
        ..strokeWidth = 2.0,
    );

    // Generate random waveform bars
    final random = waveformBars(size);
    final barWidth = 3.0;
    final gap = 2.0;
    final totalBarWidth = barWidth + gap;
    final numberOfBars = (size.width / totalBarWidth).floor();

    for (int i = 0; i < numberOfBars; i++) {
      final x = i * totalBarWidth;
      final barHeight = random[i % random.length] * size.height;
      final startY = (size.height - barHeight) / 2;
      final endY = startY + barHeight;

      // Choose paint based on position (played or not)
      final currentPaint = x <= progressX ? playedPaint : paint;

      canvas.drawLine(
        Offset(x, startY),
        Offset(x, endY),
        currentPaint,
      );
    }
  }

  // Generate a list of randomized heights for the waveform
  List<double> waveformBars(Size size) {
    // This generates a semi-realistic looking waveform pattern
    return [
      0.2, 0.5, 0.7, 0.4, 0.6, 0.9, 0.5, 0.3, 0.8, 0.6,
      0.4, 0.7, 0.3, 0.5, 0.8, 0.9, 0.6, 0.3, 0.5, 0.7,
      0.2, 0.5, 0.9, 0.6, 0.3, 0.5, 0.7, 0.4, 0.6, 0.8,
      0.5, 0.3, 0.7, 0.9, 0.4, 0.2, 0.6, 0.8, 0.5, 0.3,
    ];
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) {
    return oldDelegate.waveformColor != waveformColor ||
           oldDelegate.playbackProgress != playbackProgress ||
           oldDelegate.playedColor != playedColor;
  }
}

// Example usage
class AudioWaveformExample extends StatelessWidget {
  const AudioWaveformExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Waveform')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AudioWaveformCard(
          audioFileName: '1-22-1546-2025.wav',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          onClose: () {
            debugPrint('Close button pressed');
          },
          onTap: () {
            debugPrint('Audio card tapped');
          },
        ),
      ),
    );
  }
}

// For custom content, you can pass a Widget to the customContent parameter
class AudioWaveformWithCustomContent extends StatelessWidget {
  const AudioWaveformWithCustomContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioWaveformCard(
      audioFileName: '1-22-1546-2025.wav',
      customContent: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Play'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Download'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}