

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_widget/audio/domain/usecase/audio_usecase.dart';
// import 'package:test_widget/audio/presentation/view_model/audio_state.dart';

// class AudioExplorerCubit extends Cubit<AudioExplorerState> {
//   final GetAudioFoldersUseCase getFoldersUseCase;
//   final GetAudioFilesUseCase getFilesUseCase;

//   AudioExplorerCubit({required this.getFoldersUseCase, required this.getFilesUseCase})
//       : super(AudioExplorerState.initial());

//   void toggleFolderVisibility() {
//     emit(state.copyWith(showFolders: !state.showFolders));
//   }

//   Future<void> loadFolders() async {
//     final folders = await getFoldersUseCase();
//     emit(state.copyWith(dateFolders: folders));
//   }

//   Future<void> loadAudioFiles(String date) async {
//     emit(state.copyWith(loadingAudio: true));
//     final files = await getFilesUseCase(date);
//     emit(state.copyWith(audioFiles: files, loadingAudio: false));
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget/audio/domain/usecase/audio_usecase.dart';
import 'package:test_widget/audio/presentation/view_model/audio_state.dart';

class AudioExplorerCubit extends Cubit<AudioExplorerState> {
  final GetAudioFoldersUseCase getFoldersUseCase;
  final GetSubFoldersUseCase getSubFoldersUseCase;
  final GetAudioFilesUseCase getFilesUseCase;

  AudioExplorerCubit({
    required this.getFoldersUseCase,
    required this.getSubFoldersUseCase,
    required this.getFilesUseCase,
  }) : super(AudioExplorerState.initial());

  void toggleFolderVisibility() {
    emit(state.copyWith(showFolders: !state.showFolders));
  }

  Future<void> loadFolders() async {
    try {
      emit(state.copyWith(loadingFolders: true));
      final folders = await getFoldersUseCase();
      emit(state.copyWith(dateFolders: folders, loadingFolders: false));
    } catch (e) {
      emit(state.copyWith(loadingFolders: false, error: e.toString()));
    }
  }

  Future<void> loadSubFolders(String folderName) async {
    try {
      emit(state.copyWith(loadingSubFolders: true));
      final subFolders = await getSubFoldersUseCase(folderName);
      emit(state.copyWith(subFolders: subFolders, loadingSubFolders: false));
    } catch (e) {
      emit(state.copyWith(loadingSubFolders: false, error: e.toString()));
    }
  }

  Future<void> loadAudioFiles(String folderName, String subFolderName) async {
    try {
      emit(state.copyWith(loadingAudio: true));
      final files = await getFilesUseCase(folderName, subFolderName);
      emit(state.copyWith(audioFiles: files, loadingAudio: false));
    } catch (e) {
      emit(state.copyWith(loadingAudio: false, error: e.toString()));
    }
  }
}
