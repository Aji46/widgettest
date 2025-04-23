import 'package:flutter/material.dart';
import 'package:test_widget/audio/presentation/post.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Waveforms',
      debugShowCheckedModeBanner: false,
      home:
      //  BlocProvider<AudioExplorerCubit>(
      //   create: (_) => AudioExplorerCubit(getFoldersUseCase: null, getSubFoldersUseCase: null, getFilesUseCase: null),
      //   
         AudioUploadPage(),
      // ),
    );
  }
}


// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late final RecorderController recorderController;

//   String? path;
//   String? musicFile;
//   bool isRecording = false;
//   bool isRecordingCompleted = false;
//   bool isLoading = true;
//   late Directory appDirectory;

//   @override
//   void initState() {
//     super.initState();
//     _getDir();
//     _initialiseControllers();
//   }

//   void _getDir() async {
//     appDirectory = await getApplicationDocumentsDirectory();
//     path = "${appDirectory.path}/recording.m4a";
//     isLoading = false;
//     setState(() {});
//   }

//   void _initialiseControllers() {
//     recorderController = RecorderController()
//       ..androidEncoder = AndroidEncoder.aac
//       ..androidOutputFormat = AndroidOutputFormat.mpeg4
//       ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
//       ..sampleRate = 44100;
//   }

//   void _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       musicFile = result.files.single.path;
//       setState(() {});
//     } else {
//       debugPrint("File not picked");
//     }
//   }

//   @override
//   void dispose() {
//     recorderController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF252331),
     
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SafeArea(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 60),
              
//                   if (isRecordingCompleted)
//                     AudioMessageBubble(
//                       path: path!,
//                       isSender: true,
//                     ),
//                   if (musicFile != null)
//                     AudioMessageBubble(
//                       path: musicFile!,
//                       isSender: true,
//                     ),
//                   SafeArea(
//                     child: Row(
//                       children: [
//                         AnimatedSwitcher(
//                           duration: const Duration(milliseconds: 200),
//                           child: isRecording
//                               ? AudioWaveforms(
//                                   enableGesture: true,
//                                   size: Size(
//                                       MediaQuery.of(context).size.width / 2,
//                                       50),
//                                   recorderController: recorderController,
//                                   waveStyle: const WaveStyle(
//                                     waveColor: Colors.white,
//                                     extendWaveform: true,
//                                     showMiddleLine: false,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                     color: const Color(0xFF1E1B26),
//                                   ),
//                                   padding: const EdgeInsets.only(left: 18),
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                 )
//                               : Container(
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.7,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF1E1B26),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   padding: const EdgeInsets.only(left: 18),
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: TextField(
//                                     readOnly: true,
//                                     decoration: InputDecoration(
//                                       hintText: "Type Something...",
//                                       hintStyle: const TextStyle(
//                                           color: Colors.white54),
//                                       contentPadding:
//                                           const EdgeInsets.only(top: 16),
//                                       border: InputBorder.none,
//                                       suffixIcon: IconButton(
//                                         onPressed: _pickFile,
//                                         icon: Icon(Icons.adaptive.share),
//                                         color: Colors.white54,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                         ),
//                         IconButton(
//                           onPressed: _refreshWave,
//                           icon: Icon(
//                             isRecording ? Icons.refresh : Icons.send,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         IconButton(
//                           onPressed: _startOrStopRecording,
//                           icon: Icon(isRecording ? Icons.stop : Icons.mic),
//                           color: Colors.white,
//                           iconSize: 28,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   void _startOrStopRecording() async {
//     try {
//       if (isRecording) {
//         recorderController.reset();
//         path = await recorderController.stop(false);
//         if (path != null) {
//           isRecordingCompleted = true;
//           debugPrint(path);
//           debugPrint("Recorded file size: ${File(path!).lengthSync()}");
//         }
//       } else {
//         await recorderController.record(path: path);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       if (recorderController.hasPermission) {
//         setState(() {
//           isRecording = !isRecording;
//         });
//       }
//     }
//   }

//   void _refreshWave() {
//     if (isRecording) recorderController.refresh();
//   }
// }

// class AudioMessageBubble extends StatefulWidget {
//   final String path;
//   final bool isSender;

//   const AudioMessageBubble({
//     super.key,
//     required this.path,
//     required this.isSender,
//   });

//   @override
//   State<AudioMessageBubble> createState() => _AudioMessageBubbleState();
// }

// class _AudioMessageBubbleState extends State<AudioMessageBubble> {
//   final PlayerController _playerController = PlayerController();
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _prepareAudio();
//     _playerController.onCompletion.listen((_) {
//       setState(() {
//         _isPlaying = false;
//       });
//     });
//   }

//   Future<void> _prepareAudio() async {
//     await _playerController.preparePlayer(
//       path: widget.path,
//       shouldExtractWaveform: true,
//     );
//   }

//   @override
//   void dispose() {
//     _playerController.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     if (_isPlaying) {
//       _playerController.pausePlayer();
//     } else {
//    _playerController.startPlayer();

//     }

//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         decoration: BoxDecoration(
//           color: widget.isSender ? Colors.blue : Colors.grey[800],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               onPressed: _togglePlayPause,
//               icon: Icon(
//                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: Colors.white,
//               ),
//             ),
//             AudioFileWaveforms(
//               playerController: _playerController,
//               size: Size(MediaQuery.of(context).size.width * 0.4, 50),
//               enableSeekGesture: true,
//               waveformType: WaveformType.long,
//               playerWaveStyle: const PlayerWaveStyle(
//                 fixedWaveColor: Colors.white,
//                 liveWaveColor: Colors.red,
//                 showSeekLine: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
