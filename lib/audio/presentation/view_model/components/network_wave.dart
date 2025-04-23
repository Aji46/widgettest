import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class AudioMessageBubble extends StatelessWidget {
  final String path;


  const AudioMessageBubble({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: AudioFileWaveforms(
            size: Size(MediaQuery.of(context).size.width * 0.5, 50),
            playerController: PlayerController()
              ..preparePlayer(
                path: path,
                shouldExtractWaveform: true,
              ),
            enableSeekGesture: true,
            waveformType: WaveformType.long,
            playerWaveStyle: const PlayerWaveStyle(
              fixedWaveColor: Color.fromARGB(255, 0, 0, 0),
              liveWaveColor: Color.fromARGB(255, 0, 0, 0),
              showSeekLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
