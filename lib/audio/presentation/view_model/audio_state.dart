// class AudioExplorerState {
//   final bool showFolders;
//   final bool loadingFolders;
//   final bool loadingSubFolders;
//   final bool loadingAudio;
//   final List<String> dateFolders;
//   final List<String> subFolders;
//   final List<AudioFile> audioFiles;
//   final String error;

//   AudioExplorerState({
//     required this.showFolders,
//     required this.loadingFolders,
//     required this.loadingSubFolders,
//     required this.loadingAudio,
//     required this.dateFolders,
//     required this.subFolders,
//     required this.audioFiles,
//     required this.error,
//   });

//   factory AudioExplorerState.initial() {
//     return AudioExplorerState(
//       showFolders: false,
//       loadingFolders: false,
//       loadingSubFolders: false,
//       loadingAudio: false,
//       dateFolders: [],
//       subFolders: [],
//       audioFiles: [],
//       error: '',
//     );
//   }

//   AudioExplorerState copyWith({
//     bool? showFolders,
//     bool? loadingFolders,
//     bool? loadingSubFolders,
//     bool? loadingAudio,
//     List<String>? dateFolders,
//     List<String>? subFolders,
//     List<AudioFile>? audioFiles,
//     String? error,
//   }) {
//     return AudioExplorerState(
//       showFolders: showFolders ?? this.showFolders,
//       loadingFolders: loadingFolders ?? this.loadingFolders,
//       loadingSubFolders: loadingSubFolders ?? this.loadingSubFolders,
//       loadingAudio: loadingAudio ?? this.loadingAudio,
//       dateFolders: dateFolders ?? this.dateFolders,
//       subFolders: subFolders ?? this.subFolders,
//       audioFiles: audioFiles ?? this.audioFiles,
//       error: error ?? this.error,
//     );
//   }
// }

// class AudioFile {
//   final String fileName;
//   final String transcription;
//   final String receivedAt;
//   final String convertedAt;

//   AudioFile({
//     required this.fileName,
//     required this.transcription,
//     required this.receivedAt,
//     required this.convertedAt,
//   });
// }
