import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/presentation/ui/network_wave_form.dart';



class AudioInfo extends StatelessWidget {
  final AudioFileEntity audioFile;

  const AudioInfo({
    required this.audioFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(audioFile.fileName),
        backgroundColor: const Color(0xFF87EDED),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_sharp),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
                   SizedBox(height: 30,),
            WavedAudioPlayer(
            source: AssetSource(audioFile.folderPath),
            iconColor: Colors.red,
            playedColor: const Color.fromARGB(255, 255, 0, 0),
            unplayedColor: const Color.fromARGB(255, 0, 0, 0),
            barWidth: 2,
            buttonSize: 40,
            showTiming: true,
            onError: (error) {
              print('Error occurred: $error.message');
            },
          ),
                SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                audioFile.transcription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_flutter_new.dart';
// // import 'package:flutter/material.dart';
// // import 'package:just_audio/just_audio.dart';

// // class AudioInfo extends StatefulWidget {
// //   final String fileName;
// //   final String file;
// //   final String transcriptText;

// //   const AudioInfo({
// //     required this.file,
// //     required this.fileName,
// //     required this.transcriptText,
// //     Key? key,
// //   }) : super(key: key);

// //   @override
// //   _AudioInfoState createState() => _AudioInfoState();
// // }

// // class _AudioInfoState extends State<AudioInfo> {
// //   late AudioPlayer _audioPlayer;
// //   List<double> _frequencyData = [];
// //   double _currentPosition = 0.0;
// //   final AudioFrequencyExtractor _extractor = AudioFrequencyExtractor();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _audioPlayer = AudioPlayer();

// //     // Load the audio file
// //     _loadAudio(widget.file);
// //   }

// //   Future<void> _loadAudio(String filePath) async {
// //     try {
// //       // Load audio and start playback
// //       await _audioPlayer.setFilePath(filePath);
// //       _audioPlayer.play();

// //       // Get frequency data and start listening to playback position
// //       _extractFrequencyData(filePath);

// //       // Periodically update current position
// //       _audioPlayer.positionStream.listen((position) {
// //         setState(() {
// //           _currentPosition = position.inMilliseconds.toDouble();
// //         });
// //       });
// //     } catch (e) {
// //       print("Error loading audio: $e");
// //     }
// //   }

// //   Future<void> _extractFrequencyData(String filePath) async {
// //     final frequencies = await _extractor.getFrequencyData(filePath);
// //     setState(() {
// //       _frequencyData = frequencies;
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.fileName),
// //       ),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             SizedBox(height: 10),
// //             if (_frequencyData.isNotEmpty)
// //               SizedBox(
// //                 height: 200,
// //                 width: double.infinity,
// //                 child: CustomPaint(
// //                   painter: FrequencyWaveformPainter(
// //                     frequencyData: _frequencyData,
// //                     currentPosition: _currentPosition,
// //                   ),
// //                 ),
// //               ),
// //             SizedBox(height: 10),
// //             Text(widget.transcriptText),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 _audioPlayer.play();
// //               },
// //               child: Text("Play Audio"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
