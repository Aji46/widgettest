import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/presentation/ui/network_wave_form.dart';

class AudioInfo extends StatefulWidget {
  final AudioFileEntity audioFile;

  const AudioInfo({
    required this.audioFile,
    super.key,
  });

  @override
  _AudioInfoState createState() => _AudioInfoState();
}

class _AudioInfoState extends State<AudioInfo> {
  String _fullTranscription = "";
  String _matchedSentence = "";

  void _updateTranscription(String highlightedTranscription) {
final regex = RegExp(r'\*\*(.+?)\*\*');

    final match = regex.firstMatch(highlightedTranscription);
    
    setState(() {
      _fullTranscription = highlightedTranscription.replaceAll('**', '');
      _matchedSentence = match?.group(1) ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _fullTranscription = widget.audioFile.transcription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.audioFile.fileName),
        backgroundColor: const Color(0xFF87EDED),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_sharp),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            WavedAudioPlayer(
              source: AssetSource(widget.audioFile.folderPath),
              iconColor: Colors.red,
              playedColor: const Color.fromARGB(255, 255, 0, 0),
              unplayedColor: const Color.fromARGB(255, 0, 0, 0),
              barWidth: 2,
              buttonSize: 40,
              showTiming: true,
              onError: (error) {
                print('Error occurred: $error.message');
              },
              onTranscriptionReceived: _updateTranscription,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: _buildHighlightedText(),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildHighlightedText() {
  const commonStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.normal, 
    height: 1.5,
    letterSpacing: 1.2,
    wordSpacing: 0.0,
  );

  if (_matchedSentence.isEmpty) {
    return Text(_fullTranscription, style: commonStyle);
  }

  final textSpans = <TextSpan>[];
  final parts = _fullTranscription.split(_matchedSentence);

  for (int i = 0; i < parts.length; i++) {
    if (parts[i].isNotEmpty) {
      textSpans.add(TextSpan(
        text: parts[i],
        style: commonStyle,
      ));
    }

    if (i < parts.length - 1) {
      textSpans.add(TextSpan(
        text: _matchedSentence,
        style: commonStyle.copyWith(
          backgroundColor: Colors.yellow.shade100,
        ),
      ));
    }
  }

  return RichText(
    text: TextSpan(
      children: textSpans,
      style: commonStyle,
    ),
  );
}

}
