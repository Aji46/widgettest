


// abstract class AudioRepository {
//   Future<List<String>> getAudioFolders();

//   Future<List<AudioModel>> getAudioFilesByDate(String folderName);
// }


import 'package:test_widget/audio/data/entity/audio_entity.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';

abstract class AudioRepository {
  Future<List<AudioEntity>> getAudioFolders();
  Future<List<SubFolderEntity>> getSubFoldersByFolderName();
  Future<List<AudioFileEntity>> getAudioFilesBySubFolder();
}
