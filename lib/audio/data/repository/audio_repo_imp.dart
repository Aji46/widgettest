// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:test_widget/audio/data/model/api/model.dart';
// import 'package:test_widget/audio/domain/repository/audio_repository.dart';



// class AudioRepositoryImpl implements AudioRepository {
//   final http.Client client;

//   AudioRepositoryImpl(this.client);

//   static const baseUrl = 'https://your-api-url.com/api'; 

//   @override
//   Future<List<String>> getAudioFolders() async {
//     final response = await client.get(Uri.parse('$baseUrl/folders'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((folder) => folder.toString()).toList();
//     } else {
//       throw Exception('Failed to load folders');
//     }
//   }

//   @override
//   Future<List<AudioModel>> getAudioFilesByDate(String folderName) async {
//     final response = await client.get(Uri.parse('$baseUrl/folders/$folderName/audio-files'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => AudioModel.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load audio files for folder: $folderName');
//     }
//   }
// }






import 'dart:convert';

import 'package:test_widget/audio/data/entity/audio_entity.dart';
import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';
import 'package:test_widget/audio/domain/repository/audio_repository.dart';
import 'package:test_widget/core/network/api_endpoints/audio_endpoint.dart';
import 'package:test_widget/core/network/service/api_service.dart';

class AudioRepositoryImpl implements AudioRepository {
  final IApiService _apiService;

  AudioRepositoryImpl({required IApiService apiService}) : _apiService = apiService;

  static const baseUrl = 'https://your-api-url.com/api';

  /// Fetches all root-level audio folders and their nested content
  @override
  Future<List<AudioEntity>> getAudioFolders() async {
    final response = await _apiService.get(AudioEndpoints.getallAudio);

   if (response.success) {
      final List<dynamic> data = json.decode(response.data);
      return data.map((e) => AudioEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load audio folders');
    }
  }

  /// Fetches subfolder and files for a given folder name
  @override
  Future<List<SubFolderEntity>> getSubFoldersByFolderName(String folderName) async {
    final response = await _apiService.get(AudioEndpoints.getallAudio);

   if (response.success) {
      final List<dynamic> data = json.decode(response.data);
      return data.map((e) => SubFolderEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load subfolders for folder: $folderName');
    }
  }

  /// Fetches audio files inside a given subfolder
  @override
  Future<List<AudioFileEntity>> getAudioFilesBySubFolder(String folderName, String subFolderName) async {
    final response = await _apiService.get(AudioEndpoints.getallAudio);

  if (response.success) {
      final List<dynamic> data = json.decode(response.data);
      return data.map((e) => AudioFileEntity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load audio files for subfolder: $subFolderName');
    }
  }
}



// import 'package:http/http.dart' as http;
// import 'package:test_widget/audio/data/model/api/model.dart';
// import 'package:test_widget/audio/domain/repository/audio_repository.dart';

// class AudioRepositoryImpl implements AudioRepository {
//   final http.Client client;

//   AudioRepositoryImpl(this.client);

//   @override
//   Future<List<String>> getAudioFolders() async {
//     await Future.delayed(Duration(seconds: 1));
//     return ['2025-04-20', '2025-04-21', '2025-04-22'];
//   }

//   @override
//   Future<List<AudioModel>> getAudioFilesByDate(String folderName) async {
//     await Future.delayed(Duration(milliseconds: 800));

//     final dummyData = [
//       {
//         "fileName": "audio1.mp3",
//         "fileUrl": "https://example.com/audio/$folderName/audio1.mp3",
//         "duration": 120,
//         "uploadedAt": "2025-04-21T10:00:00Z"
//       },
//       {
//         "fileName": "audio2.mp3",
//         "fileUrl": "https://example.com/audio/$folderName/audio2.mp3",
//         "duration": 95,
//         "uploadedAt": "2025-04-21T11:00:00Z"
//       }
//     ];

//     return dummyData.map((item) => AudioModel.fromJson(item)).toList();
//   }
// }

