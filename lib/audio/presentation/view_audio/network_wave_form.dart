import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AudioWaveformWidget extends StatefulWidget {
  final String url;
  const AudioWaveformWidget({required this.url, super.key});

  @override
  State<AudioWaveformWidget> createState() => _AudioWaveformWidgetState();
}

class _AudioWaveformWidgetState extends State<AudioWaveformWidget> {
  List<int> _samples = [];
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadWaveform();
  }

  Future<void> _loadWaveform() async {
    final bytes = await downloadWavFromUrl(widget.url);
    final samples = parseWavSamples(bytes);
    setState(() => _samples = samples);

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.01;
        if (_progress > 1.0) {
          _progress = 1.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_samples.isEmpty) {
      return Container(
        height: 100,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text("Loading waveform or no data available..."),
      );
    }

    return CustomPaint(
      size: Size(double.infinity, 100),
      painter: WaveformPainter(_samples, _progress),
    );
  }

  List<int> parseWavSamples(Uint8List wavData) {
    final headerSize = 44; // Typical PCM header size
    if (wavData.length <= headerSize) return [];

    final data = wavData.sublist(headerSize);
    final samples = <int>[];

    for (int i = 0; i < data.length; i += 2) {
      int sample = data[i] | (data[i + 1] << 8);
      if (sample & 0x8000 != 0) {
        sample = sample - 0x10000; // convert to signed
      }
      samples.add(sample);
    }

    return samples;
  }

  Future<Uint8List> downloadWavFromUrl(String url) async {
    print("Downloading from URL: $url");
    final dio = Dio();
    try {
      final response = await dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      print("Download successful, received ${response.data!.length} bytes");
      return Uint8List.fromList(response.data!);
    } catch (e) {
      print("Download error: $e");
      throw Exception('Failed to download audio: $e');
    }
  }
}

class WaveformPainter extends CustomPainter {
  final List<int> samples;
  final double progress;

  WaveformPainter(this.samples, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFFAFAFA)
          ..strokeWidth = 2;

    final midY = size.height / 2;
    final sampleCount = samples.length;
    final visibleSamples = min(sampleCount, (size.width ~/ 2));

    for (int i = 0; i < visibleSamples; i++) {
      final x = i * 2.0;
      final sample = samples[i];
      final normalized = sample / 32768.0;
      final y = normalized * midY;

      paint.color =
          (i / visibleSamples) <= progress
              ? Colors.blue
              : const Color(0xFFFAFAFA);

      canvas.drawLine(Offset(x, midY - y), Offset(x, midY + y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
