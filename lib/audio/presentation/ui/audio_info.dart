// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
// import 'package:test_widget/audio/presentation/ui/network_wave_form.dart';

// class AudioInfo extends StatefulWidget {
//   final AudioFileEntity audioFile;

//   const AudioInfo({
//     required this.audioFile,
//     super.key,
//   });

//   @override
//   _AudioInfoState createState() => _AudioInfoState();
// }

// class _AudioInfoState extends State<AudioInfo> {
//   String _fullTranscription = "";
//   String _matchedSentence = "";

//   void _updateTranscription(String highlightedTranscription) {
// final regex = RegExp(r'\*\*(.+?)\*\*');

//     final match = regex.firstMatch(highlightedTranscription);
    
//     setState(() {
//       _fullTranscription = highlightedTranscription.replaceAll('**', '');
//       _matchedSentence = match?.group(1) ?? "";
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fullTranscription = widget.audioFile.transcription;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.audioFile.fileName),
//         backgroundColor: const Color(0xFF87EDED),
//         actions: [
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.close_sharp),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             const SizedBox(height: 30),
//             WavedAudioPlayer(
//               source: AssetSource(widget.audioFile.folderPath),
//               iconColor: Colors.red,
//               playedColor: const Color.fromARGB(255, 255, 0, 0),
//               unplayedColor: const Color.fromARGB(255, 0, 0, 0),
//               barWidth: 2,
//               buttonSize: 40,
//               showTiming: true,
//               onError: (error) {
//                 print('Error occurred: $error.message');
//               },
//               onTranscriptionReceived: _updateTranscription,
//             ),
//             const SizedBox(height: 50),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16.0),
//                 child: _buildHighlightedText(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// Widget _buildHighlightedText() {
//   const commonStyle = TextStyle(
//     fontSize: 16,
//     color: Colors.black,
//     fontWeight: FontWeight.normal, 
//     height: 1.5,
//     letterSpacing: 1.2,
//     wordSpacing: 0.0,
//   );

//   if (_matchedSentence.isEmpty) {
//     return Text(_fullTranscription, style: commonStyle);
//   }

//   final textSpans = <TextSpan>[];
//   final parts = _fullTranscription.split(_matchedSentence);

//   for (int i = 0; i < parts.length; i++) {
//     if (parts[i].isNotEmpty) {
//       textSpans.add(TextSpan(
//         text: parts[i],
//         style: commonStyle,
//       ));
//     }

//     if (i < parts.length - 1) {
//       textSpans.add(TextSpan(
//         text: _matchedSentence,
//         style: commonStyle.copyWith(
//           backgroundColor: Colors.yellow.shade100,
//         ),
//       ));
//     }
//   }

//   return RichText(
//     text: TextSpan(
//       children: textSpans,
//       style: commonStyle,
//     ),
//   );
// }

// }




import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
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
  final GlobalKey<WavedAudioPlayerState> _waveformKey = GlobalKey();
  String? _clickedSentence;


  void _updateTranscription(String highlightedTranscription) {
    final regex = RegExp(r'\*\*(.+?)\*\*');
    final match = regex.firstMatch(highlightedTranscription);
    
    setState(() {
      _fullTranscription = highlightedTranscription.replaceAll('**', '');
      _matchedSentence = match?.group(1) ?? "";
    });
  }

  void _handleTranscriptClick(String text) {
    // Find the matching transcription segment
    final transcription = _waveformKey.currentState?.segments;
    if (transcription != null) {
      for (var segment in transcription) {
        if (segment.transcriptText == text) {
          // Parse the start time and seek to that position
          final startTime = _parseDuration(segment.startTime);
          final endTime = _parseDuration(segment.endTime);
          final totalDuration = _waveformKey.currentState?.duration ?? Duration.zero;
          
          if (totalDuration != Duration.zero) {
            // Calculate position as percentage
            final position = (startTime.inMilliseconds / totalDuration.inMilliseconds) * 100;
            _waveformKey.currentState?.seekToPosition(position);
            
            // Update the selected segment in the waveform
            _waveformKey.currentState?.setSelectedSegment(segment);
          }
          break;
        }
      }
    }
  }

  Duration _parseDuration(String timeStr) {
    List<String> parts = timeStr.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds.toInt(),
      milliseconds: (seconds * 1000).toInt() % 1000,
    );
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
              key: _waveformKey,
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
  );

  final segments = _waveformKey.currentState?.segments ?? [];
  String text = _fullTranscription;
  final textSpans = <TextSpan>[];

  int currentIndex = 0;

  for (var segment in segments) {
    final phrase = segment.transcriptText.trim();
    final matchIndex = text.indexOf(phrase, currentIndex);

    if (matchIndex != -1) {
      // Add normal text before match
      if (matchIndex > currentIndex) {
        textSpans.add(TextSpan(
          text: text.substring(currentIndex, matchIndex),
          style: commonStyle,
        ));
      }

      final isMatched = phrase == _matchedSentence;
      final isClicked = phrase == _clickedSentence;

      Color? backgroundColor;
      if (isMatched) {
        backgroundColor = Colors.yellow.shade100;
      } else if (isClicked) {
        backgroundColor = Colors.lightBlue.shade100;
      }

      textSpans.add(TextSpan(
        text: phrase,
        style: commonStyle.copyWith(
          backgroundColor: backgroundColor,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            final startTime = _parseDuration(segment.startTime);
            final totalDuration = _waveformKey.currentState?.duration ?? Duration.zero;
            if (totalDuration != Duration.zero) {
              final position = (startTime.inMilliseconds / totalDuration.inMilliseconds) * 100;
              _waveformKey.currentState?.seekToPosition(position);
              _waveformKey.currentState?.setSelectedSegment(segment);
            }

            setState(() {
              _clickedSentence = phrase;
            });
          },
      ));

      currentIndex = matchIndex + phrase.length;
    }
  }

  // Add any remaining normal text after the last matched segment
  if (currentIndex < text.length) {
    textSpans.add(TextSpan(
      text: text.substring(currentIndex),
      style: commonStyle,
    ));
  }

  return RichText(
    text: TextSpan(children: textSpans),
  );
}





//   Widget _buildHighlightedText() {
//   const commonStyle = TextStyle(
//     fontSize: 16,
//     color: Colors.black,
//     fontWeight: FontWeight.normal, 
//     height: 1.5,
//     letterSpacing: 1.2,
//     wordSpacing: 0.0,
//   );

//   final textSpans = <TextSpan>[];

//   final matchStartIndex = _fullTranscription.indexOf(_matchedSentence);
//   final matchEndIndex = matchStartIndex + _matchedSentence.length;

//   if (matchStartIndex == -1) {
//     // No match found, return full unhighlighted text
//     return Text(_fullTranscription, style: commonStyle);
//   }

//   // Split into three parts: before, matched, and after
//   final beforeMatch = _fullTranscription.substring(0, matchStartIndex);
//   final matched = _fullTranscription.substring(matchStartIndex, matchEndIndex);
//   final afterMatch = _fullTranscription.substring(matchEndIndex);

//   textSpans.add(TextSpan(
//     text: beforeMatch,
//     style: commonStyle,
//   ));

//   textSpans.add(TextSpan(
//     text: matched,
//     style: commonStyle.copyWith(
//       backgroundColor: Colors.yellow.shade100,
//     ),
//     recognizer: TapGestureRecognizer()
//       ..onTap = () {
//         final transcription = _waveformKey.currentState?.segments;
//         if (transcription != null) {
//           for (var segment in transcription) {
//             if (segment.transcriptText.contains(_matchedSentence)) {
//               final startTime = _parseDuration(segment.startTime);
//               final totalDuration = _waveformKey.currentState?.duration ?? Duration.zero;

//               if (totalDuration != Duration.zero) {
//                 final position = (startTime.inMilliseconds / totalDuration.inMilliseconds) * 100;
//                 _waveformKey.currentState?.seekToPosition(position);
//                 _waveformKey.currentState?.setSelectedSegment(segment);
//               }
//               break;
//             }
//           }
//         }
//       },
//   ));

//   textSpans.add(TextSpan(
//     text: afterMatch,
//     style: commonStyle,
//   ));

//   return RichText(
//     text: TextSpan(
//       children: textSpans,
//       style: commonStyle,
//     ),
//   );
// }
}
