import 'package:flutter/material.dart';
import 'package:test_widget/audio/presentation/view_audio/view.dart';

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
        const FileExploreScreen(),
      // ),
    );
  }
}


// class Home extends StatefulWidget {

//   const Home({super.key, required String musicFile});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late final RecorderController recorderController;

//   String? path;
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


//   @override
//   void dispose() {
//     recorderController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
     
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
//                                       MediaQuery.of(context).size.width / 6,
//                                       50),
//                                   recorderController: recorderController,
//                                   waveStyle: const WaveStyle(
//                                     waveColor: Color.fromARGB(255, 255, 4, 4),
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
//                                 ):SizedBox(),
                          
//                         ),
                    
//                         const SizedBox(width: 16),
                    
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
//       alignment: widget.isSender ? Alignment.topCenter : Alignment.center,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
       
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               onPressed: _togglePlayPause,
//               icon: Icon(
//                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: const Color.fromARGB(255, 0, 0, 0),
//               ),
//             ),
//             AudioFileWaveforms(
//               playerController: _playerController,
//               size: Size(MediaQuery.of(context).size.width * 0.4, 50),
//               enableSeekGesture: true,
//               waveformType: WaveformType.long,
//               playerWaveStyle: const PlayerWaveStyle(
//                 fixedWaveColor: Color.fromARGB(255, 0, 0, 0),
//                 liveWaveColor: Color.fromARGB(255, 0, 0, 0),
//                 showSeekLine: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
