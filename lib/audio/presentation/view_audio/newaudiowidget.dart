import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';

class AudioWaveformPlayer extends StatefulWidget {
  final String audioPath; // Audio file from outside
  final List<double> waveformData;

  const AudioWaveformPlayer({
    super.key,
    required this.audioPath,
    required this.waveformData,
  });

  @override
  State<AudioWaveformPlayer> createState() => _AudioWaveformPlayerState();
}

class _AudioWaveformPlayerState extends State<AudioWaveformPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _progress = 0.0;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Load audio
    _audioPlayer.setSourceUrl(widget.audioPath);

    // Listen to duration and position
    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
        _progress = _duration.inMilliseconds == 0
            ? 0.0
            : p.inMilliseconds / _duration.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 20,
          child: Center(
            child: WaveformProgressbar(
              color: Colors.grey,
              progressColor: Colors.red,
              progress: _progress,
              onTap: (progress) {
                final newPosition = Duration(
                  milliseconds: (_duration.inMilliseconds * progress).toInt(),
                );
                _audioPlayer.seek(newPosition);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10),
                onPressed: () {
                  final newPos = _position - const Duration(seconds: 10);
                  _audioPlayer.seek(newPos > Duration.zero ? newPos : Duration.zero);
                },
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  _audioPlayer.resume();
                },
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  _audioPlayer.pause();
                },
              ),
              IconButton(
                icon: const Icon(Icons.forward_10),
                onPressed: () {
                  final newPos = _position + const Duration(seconds: 10);
                  if (newPos < _duration) {
                    _audioPlayer.seek(newPos);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
