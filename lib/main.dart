// import 'package:flutter/material.dart';
// import 'package:test_widget/audio/presentation/view_audio/view.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Audio Waveforms',
//       debugShowCheckedModeBanner: false,
//       home:
//       //  BlocProvider<AudioExplorerCubit>(
//       //   create: (_) => AudioExplorerCubit(getFoldersUseCase: null, getSubFoldersUseCase: null, getFilesUseCase: null),
//       //   
//         const FileExploreScreen(),
//       // ),
//     );
//   }
// }


// // class Home extends StatefulWidget {

// //   const Home({super.key, required String musicFile});

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   late final RecorderController recorderController;

// //   String? path;
// //   bool isRecording = false;
// //   bool isRecordingCompleted = false;
// //   bool isLoading = true;
// //   late Directory appDirectory;

// //   @override
// //   void initState() {
// //     super.initState();
    
// //     _getDir();
// //     _initialiseControllers();
// //   }

// //   void _getDir() async {
// //     appDirectory = await getApplicationDocumentsDirectory();
// //     path = "${appDirectory.path}/recording.m4a";
// //     isLoading = false;
// //     setState(() {});
// //   }

// //   void _initialiseControllers() {
// //     recorderController = RecorderController()
// //       ..androidEncoder = AndroidEncoder.aac
// //       ..androidOutputFormat = AndroidOutputFormat.mpeg4
// //       ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
// //       ..sampleRate = 44100;
// //   }


// //   @override
// //   void dispose() {
// //     recorderController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
     
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : SafeArea(
// //               child: Column(
// //                 children: [
// //                   const SizedBox(height: 60),
              
// //                   if (isRecordingCompleted)
// //                     AudioMessageBubble(
// //                       path: path!,
// //                       isSender: true,
// //                     ),
// //                   if (musicFile != null)
// //                     AudioMessageBubble(
// //                       path: musicFile!,
// //                       isSender: true,
// //                     ),
// //                   SafeArea(
// //                     child: Row(
// //                       children: [
// //                         AnimatedSwitcher(
// //                           duration: const Duration(milliseconds: 200),
// //                           child: isRecording
// //                               ? AudioWaveforms(
// //                                   enableGesture: true,
// //                                   size: Size(
// //                                       MediaQuery.of(context).size.width / 6,
// //                                       50),
// //                                   recorderController: recorderController,
// //                                   waveStyle: const WaveStyle(
// //                                     waveColor: Color.fromARGB(255, 255, 4, 4),
// //                                     extendWaveform: true,
// //                                     showMiddleLine: false,
// //                                   ),
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(12.0),
// //                                     color: const Color(0xFF1E1B26),
// //                                   ),
// //                                   padding: const EdgeInsets.only(left: 18),
// //                                   margin: const EdgeInsets.symmetric(
// //                                       horizontal: 15),
// //                                 ):SizedBox(),
                          
// //                         ),
                    
// //                         const SizedBox(width: 16),
                    
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //     );
// //   }

// //   void _startOrStopRecording() async {
// //     try {
// //       if (isRecording) {
// //         recorderController.reset();
// //         path = await recorderController.stop(false);
// //         if (path != null) {
// //           isRecordingCompleted = true;
// //           debugPrint(path);
// //           debugPrint("Recorded file size: ${File(path!).lengthSync()}");
// //         }
// //       } else {
// //         await recorderController.record(path: path);
// //       }
// //     } catch (e) {
// //       debugPrint(e.toString());
// //     } finally {
// //       if (recorderController.hasPermission) {
// //         setState(() {
// //           isRecording = !isRecording;
// //         });
// //       }
// //     }
// //   }

// //   void _refreshWave() {
// //     if (isRecording) recorderController.refresh();
// //   }
// // }

// // class AudioMessageBubble extends StatefulWidget {
// //   final String path;
// //   final bool isSender;

// //   const AudioMessageBubble({
// //     super.key,
// //     required this.path,
// //     required this.isSender,
// //   });

// //   @override
// //   State<AudioMessageBubble> createState() => _AudioMessageBubbleState();
// // }

// // class _AudioMessageBubbleState extends State<AudioMessageBubble> {
// //   final PlayerController _playerController = PlayerController();
// //   bool _isPlaying = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _prepareAudio();
// //     _playerController.onCompletion.listen((_) {
// //       setState(() {
// //         _isPlaying = false;
// //       });
// //     });
// //   }

// //   Future<void> _prepareAudio() async {
// //     await _playerController.preparePlayer(
// //       path: widget.path,
// //       shouldExtractWaveform: true,
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _playerController.dispose();
// //     super.dispose();
// //   }

// //   void _togglePlayPause() {
// //     if (_isPlaying) {
// //       _playerController.pausePlayer();
// //     } else {
// //    _playerController.startPlayer();

// //     }

// //     setState(() {
// //       _isPlaying = !_isPlaying;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Align(
// //       alignment: widget.isSender ? Alignment.topCenter : Alignment.center,
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
       
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             IconButton(
// //               onPressed: _togglePlayPause,
// //               icon: Icon(
// //                 _isPlaying ? Icons.pause : Icons.play_arrow,
// //                 color: const Color.fromARGB(255, 0, 0, 0),
// //               ),
// //             ),
// //             AudioFileWaveforms(
// //               playerController: _playerController,
// //               size: Size(MediaQuery.of(context).size.width * 0.4, 50),
// //               enableSeekGesture: true,
// //               waveformType: WaveformType.long,
// //               playerWaveStyle: const PlayerWaveStyle(
// //                 fixedWaveColor: Color.fromARGB(255, 0, 0, 0),
// //                 liveWaveColor: Color.fromARGB(255, 0, 0, 0),
// //                 showSeekLine: true,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_helper/platform_helper.dart';
import 'package:test_widget/audio/presentation/ui/view.dart';
import 'package:waveform_flutter/waveform_flutter.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: FileExploreScreen());
}




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final _waveController = WaveformRecorderController();
  final _amplitudes = List<Amplitude>.empty(growable: true);
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _textController.dispose();
    _waveController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('WaveForm Example')),
        body: ListenableBuilder(
          listenable: _waveController,
          builder: (context, _) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _waveController.isRecording
                            ? WaveformRecorder(
                                height: 48,
                                controller: _waveController,
                                onRecordingStopped: _onRecordingStopped,
                              )
                            : TextField(
                                controller: _textController,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const Gap(8),
                    if (_waveController.isRecording)
                      IconButton(
                        tooltip: _waveController.isPaused
                            ? 'Resume Recording'
                            : 'Pause Recording',
                        icon: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _waveController.isPaused
                                ? Colors.purple
                                : Colors.orange,
                          ),
                          child: Center(
                            child: Icon(
                              _waveController.isPaused
                                  ? Icons.fiber_manual_record
                                  : Icons.pause,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: _togglePauseRecording,
                      ),
                    if (_waveController.isRecording)
                      IconButton(
                        tooltip: 'Cancel Recording',
                        icon: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: _cancelRecording,
                      ),
                    IconButton(
                      tooltip: _waveController.isRecording
                          ? 'Stop Recording'
                          : 'Start Recording',
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _waveController.isRecording
                              ? Colors.blue
                              : Colors.green,
                        ),
                        child: Center(
                          child: Icon(
                            _waveController.isRecording
                                ? Icons.stop
                                : Icons.mic,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: _toggleRecording,
                    ),
                    IconButton(
                      tooltip: _waveController.isRecording
                          ? ''
                          : _waveController.file != null
                              ? 'Play Recording'
                              : 'No recording to play',
                      onPressed: !_waveController.isRecording &&
                              _waveController.file != null
                          ? _playRecording
                          : null,
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: !_waveController.isRecording &&
                                  _waveController.file != null
                              ? Colors.yellow
                              : Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: _waveController.file != null
                          ? 'Delete Recording'
                          : 'No recording to delete',
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _waveController.file != null
                              ? Colors.black
                              : Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: _waveController.file != null
                          ? _deleteRecording
                          : null,
                    ),
                    IconButton(
                      tooltip: _waveController.file != null
                          ? 'Download Recording'
                          : 'No recording to download',
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _waveController.file != null
                              ? Colors.purple
                              : Colors.grey,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.download,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: _waveController.file != null
                          ? _downloadRecording
                          : null,
                    ),
                  ],
                ),
              ),
              if (!_waveController.isRecording && _amplitudes.isNotEmpty)
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: AnimatedWaveList(
                        stream: Stream.fromIterable(_amplitudes),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  Future<void> _toggleRecording() async {
    if (_waveController.isRecording) {
      await _waveController.stopRecording();
    } else {
      await _waveController.startRecording();
      _waveController.amplitudeStream.listen(_amplitudes.add);
    }
  }

  Future<void> _cancelRecording() async {
    await _waveController.cancelRecording();
    _textController.text = 'canceled';
  }

  Future<void> _togglePauseRecording() => switch (_waveController.isPaused) {
        true => _waveController.resumeRecording(),
        false => _waveController.pauseRecording(),
      };

  Future<void> _onRecordingStopped() async {
    final file = _waveController.file;
    if (file == null) return;

    _textController.text = ''
        '${file.name}: '
        '${_waveController.length.inMilliseconds / 1000} seconds';

    debugPrint('XFile properties:');
    debugPrint('  path: ${file.path}');
    debugPrint('  name: ${file.name}');
    debugPrint('  mimeType: ${file.mimeType}');
  }

  Future<void> _playRecording() async {
    final file = _waveController.file;
    if (file == null) return;

    // Play the recorded audio
    await _audioPlayer.play(PlatformHelper.audioSource(file) as Source);

    // Listen to playback completion
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        // Do something when the playback is finished
        debugPrint('Audio playback completed.');
      }
    });
  }

  Future<void> _deleteRecording() async {
    final file = _waveController.file;
    if (file == null) return;

    _amplitudes.clear();
    _waveController.clear();
    await PlatformHelper.deleteFile(file);
    _textController.text = '';
  }

  Future<void> _downloadRecording() async {
    final file = _waveController.file;
    if (file == null) return;

    await PlatformHelper.downloadFile(file);
    if (mounted) {
      debugPrint('Downloaded ${file.name} to Downloads folder');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${file.name} downloaded to Downloads folder')),
      );
    }
  }
}

class PlatformHelper {
  // Method to get the audio source for the platform (for playing audio)
  static String audioSource(XFile file) {
    // For simplicity, return the file path
    return file.path;
  }

  // Method to delete a file
  static Future<void> deleteFile(XFile file) async {
    final filePath = file.path;
    if (await File(filePath).exists()) {
      await File(filePath).delete();
    }
  }

  // Method to download a file
  static Future<void> downloadFile(XFile file) async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory?.path}/${file.name}';
    await file.saveTo(filePath);
  }
}
