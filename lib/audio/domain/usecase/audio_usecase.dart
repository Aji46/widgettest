// import 'package:test_widget/audio/data/model/api/model.dart';
// import 'package:test_widget/audio/domain/repository/audio_repository.dart';

// class GetAudioFoldersUseCase {
//   final AudioRepository repository;

//   GetAudioFoldersUseCase(this.repository);

//   Future<List<String>> call() async {
//     return await repository.getAudioFolders();
//   }
// }

// class GetAudioFilesUseCase {
//   final AudioRepository repository;

//   GetAudioFilesUseCase(this.repository);

//   Future<List<AudioModel>> call(String folderName) async {
//     return await repository.getAudioFilesByDate(folderName);
//   }
// }

import 'package:test_widget/audio/data/entity/audio_entity.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';
import 'package:test_widget/audio/domain/repository/audio_repository.dart';

class GetAudioFoldersUseCase {
  final AudioRepository repository;

  GetAudioFoldersUseCase(this.repository);

  Future<List<AudioEntity>> call() async {
    return await repository.getAudioFolders();
  }
}

class GetSubFoldersUseCase {
  final AudioRepository repository;

  GetSubFoldersUseCase(this.repository);

  Future<List<SubFolderEntity>> call(String folderName) async {
    return await repository.getSubFoldersByFolderName();
  }
}

class GetAudioFilesUseCase {
  final AudioRepository repository;

  GetAudioFilesUseCase(this.repository);

  Future<List<AudioFileEntity>> call(
    String folderName,
    String subFolderName,
  ) async {
    return await repository.getAudioFilesBySubFolder();
  }
}
