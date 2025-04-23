import 'dart:convert';

import 'package:http/http.dart' as _apiService;
import 'package:test_widget/audio/data/entity/audio_entity.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';

Future<List<AudioEntity>> getAudioFolders() async {
  final uri = Uri.parse("http://localhost:5229/api/Audio/all"); // Make sure to use a valid port (e.g., 80)
  final response = await _apiService.get(uri);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((e) => AudioEntity.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load audio folders: ${response.statusCode}');
  }
}


  Future<List<SubFolderEntity>> getSubFoldersByFolderName() async {
  final uri = Uri.parse("http://localhost:5229/api/FileExplorer/filestructure"); // Make sure to use a valid port (e.g., 80)
  final response = await _apiService.get(uri);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
      return data.map((e) => SubFolderEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load subfolders for folder:');
    }
  }

  /// Fetches audio files inside a given subfolder
  @override
  Future<List<AudioFileEntity>> getAudioFilesBySubFolder() async {
        final uri = Uri.parse("http://localhost:5229/api/FileExplorer/completed-files"); // Make sure to use a valid port (e.g., 80)
  final response = await _apiService.get(uri);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
      return data.map((e) => AudioFileEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load audio files for subfolder: ');
    }
  }


