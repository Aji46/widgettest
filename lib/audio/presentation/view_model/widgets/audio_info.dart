import 'package:flutter/material.dart';
import 'package:test_widget/audio/presentation/view_model/components/network_wave.dart';

class AudioInfo extends StatelessWidget {
  final String fileName;
  final String file;
  final String transcriptText;
  const AudioInfo({
    required this.file,
    required this.fileName,
    required this.transcriptText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(fileName),
            SizedBox(height: 10),
            AudioMessageBubble(path: file),
            Text(transcriptText),
          ],
        ),
      ),
    );
  }
}
