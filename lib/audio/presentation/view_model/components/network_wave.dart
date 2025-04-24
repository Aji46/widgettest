import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class AudioMessageBubble extends StatefulWidget {
  final String path;

  const AudioMessageBubble({Key? key, required this.path}) : super(key: key);

  @override
  State<AudioMessageBubble> createState() => _AudioMessageBubbleState();
}

class _AudioMessageBubbleState extends State<AudioMessageBubble> {
  late final PlayerController _playerController;
  bool isPlaying = false;

  @override
@override
void initState() {
  super.initState();
  _playerController = PlayerController();

  _playerController.preparePlayer(
    path: widget.path,
    shouldExtractWaveform: true,
  );

  _playerController.onCompletion.listen((_) {
    setState(() {
      isPlaying = false;
    });
  });
}


void _togglePlayPause() async {
  if (isPlaying) {
    await _playerController.pausePlayer();
  } else {
    await _playerController.startPlayer();
  }

  setState(() {
    isPlaying = !isPlaying;
  });
}


  @override
  void dispose() {
    _playerController.stopPlayer();
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _togglePlayPause,
          ),
          SizedBox(
            height: 60,
            child: AudioFileWaveforms(
              size: Size(MediaQuery.of(context).size.width * 0.6, 40),
              playerController: _playerController,
              enableSeekGesture: true,
              waveformType: WaveformType.long,
              playerWaveStyle: const PlayerWaveStyle(
                fixedWaveColor: Colors.black,
                liveWaveColor: Colors.black,
                showSeekLine: false,
                spacing: 4,
                waveThickness: 3,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
