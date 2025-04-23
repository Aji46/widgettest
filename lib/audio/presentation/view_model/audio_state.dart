import 'package:test_widget/audio/data/entity/audio_entity.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';


class AudioExplorerState {
  final bool showFolders;

  final List<AudioEntity> dateFolders;
  final List<SubFolderEntity> subFolders;
  final List<AudioFileEntity> audioFiles;

  final bool loadingFolders;
  final bool loadingSubFolders;
  final bool loadingAudio;

  final String? error;

  AudioExplorerState({
    required this.showFolders,
    required this.dateFolders,
    required this.subFolders,
    required this.audioFiles,
    required this.loadingFolders,
    required this.loadingSubFolders,
    required this.loadingAudio,
    this.error,
  });

  factory AudioExplorerState.initial() {
    return AudioExplorerState(
      showFolders: false,
      dateFolders: [],
      subFolders: [],
      audioFiles: [],
      loadingFolders: false,
      loadingSubFolders: false,
      loadingAudio: false,
      error: null,
    );
  }

  AudioExplorerState copyWith({
    bool? showFolders,
    List<AudioEntity>? dateFolders,
    List<SubFolderEntity>? subFolders,
    List<AudioFileEntity>? audioFiles,
    bool? loadingFolders,
    bool? loadingSubFolders,
    bool? loadingAudio,
    String? error,
  }) {
    return AudioExplorerState(
      showFolders: showFolders ?? this.showFolders,
      dateFolders: dateFolders ?? this.dateFolders,
      subFolders: subFolders ?? this.subFolders,
      audioFiles: audioFiles ?? this.audioFiles,
      loadingFolders: loadingFolders ?? this.loadingFolders,
      loadingSubFolders: loadingSubFolders ?? this.loadingSubFolders,
      loadingAudio: loadingAudio ?? this.loadingAudio,
      error: error ?? this.error,
    );
  }
}
