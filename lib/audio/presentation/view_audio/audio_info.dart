import 'package:flutter/material.dart';
import 'package:test_widget/audio/presentation/view_audio/audio_list_page.dart';

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
      appBar: AppBar(
      title:Text(fileName),
      backgroundColor: Color(0xFF87EDED),
     actions: [
  IconButton(
    onPressed: () {},
    icon: Icon(Icons.close_sharp),
  ),
],

      ),
      body: SafeArea(
        child: Column(
          children: [
           
            SizedBox(height: 10),
            
            // Home(musicFile: file),
            AudioWaveformWidget(
  audioFilePath: file, 
),


            Text(transcriptText),
          ],
        ),
      ),
    );
  }
}
