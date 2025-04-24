// import 'dart:convert';

// import 'package:http/http.dart' as _apiService;
// import 'package:test_widget/audio/data/entity/audio_entity.dart';
// import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
// import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';

// Future<List<AudioEntity>> getAudioFolders() async {
//   final uri = Uri.parse("http://localhost:5229/api/Audio/all"); 
//   final response = await _apiService.get(uri);

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     return data.map((e) => AudioEntity.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load audio folders: ${response.statusCode}');
//   }
// }


//   Future<List<SubFolderEntity>> getSubFoldersByFolderName() async {
//   final uri = Uri.parse("http://localhost:5229/api/FileExplorer/filestructure"); 
//   final response = await _apiService.get(uri);

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//       return data.map((e) => SubFolderEntity.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load subfolders for folder:');
//     }
//   }

//   /// Fetches audio files inside a given subfolder
//   @override
//   Future<List<AudioFileEntity>> getAudioFilesBySubFolder() async {
//         final uri = Uri.parse("http://localhost:5229/api/FileExplorer/completed-files"); 
//   final response = await _apiService.get(uri);

//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//       return data.map((e) => AudioFileEntity.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load audio files for subfolder: ');
//     }
//   }


import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';

// Future<List<AudioEntity>> getAudioFolders() async {
//   await Future.delayed(const Duration(milliseconds: 300)); // simulate delay

//   return [
//     AudioEntity(
//       name: "Meeting Recordings",
//       path: "/audio/meetings",
//       type: "folder",
//       subFolders: [],
//       files: [
//         AudioFile(
//           guid: "001",
//           fileName: "meeting_01.mp3",
//           transcription: "Hello, this is the first meeting.",
//           folderPath: "/audio/meetings",
//           receivedAt: DateTime.now().subtract(const Duration(days: 1)),
//           convertedAt: DateTime.now(),
//         ),
//       ],
//     ),
//     AudioEntity(
//       name: "Lectures",
//       path: "/audio/lectures",
//       type: "folder",
//       subFolders: [],
//       files: [],
//     ),
//   ];
// }

Future<List<SubFolderEntity>> getSubFoldersByFolderName() async {
  await Future.delayed(const Duration(milliseconds: 300));

  return [
    SubFolderEntity(
      name: "Jan_2024",
      path: "/audio/lectures/Jan_2024",
      type: "folder",
      files: [
        AudioFileEntity(
          guid: "002",
          fileName: "lecture_01.mp3",
          transcription: "Lecture on Flutter architecture.",
          folderPath: "/audio/lectures/Jan_2024",
          receivedAt: DateTime.now().subtract(const Duration(days: 2)),
          convertedAt: DateTime.now(),
          type: "audio/mpeg",
        ),
             AudioFileEntity(
          guid: "003",
          fileName: "lecture_01.mp3",
          transcription: "Lecture on Flutter architecture.",
          folderPath: "/audio/lectures/Jan_2024",
          receivedAt: DateTime.now().subtract(const Duration(days: 2)),
          convertedAt: DateTime.now(),
          type: "audio/mpeg",
        ),
      ],
    ),
        SubFolderEntity(
      name: "march_2024",
      path: "/audio/lectures/Jan_2024",
      type: "folder",
      files: [
        AudioFileEntity(
          guid: "002",
          fileName: "lecture_01.mp3",
          transcription: "Lecture on Flutter architecture.",
          folderPath: "/audio/lectures/Jan_2024",
          receivedAt: DateTime.now().subtract(const Duration(days: 2)),
          convertedAt: DateTime.now(),
          type: "audio/mpeg",
        ),
             AudioFileEntity(
          guid: "003",
          fileName: "lecture_01.mp3",
          transcription: "Lecture on Flutter architecture.",
          folderPath: "/audio/lectures/Jan_2024",
          receivedAt: DateTime.now().subtract(const Duration(days: 2)),
          convertedAt: DateTime.now(),
          type: "audio/mpeg",
        ),
      ],
    ),
  ];
}

// Future<List<AudioFileEntity>> getAudioFilesBySubFolder() async {
//   await Future.delayed(const Duration(milliseconds: 300));

//   return [
//     AudioFileEntity(
//       guid: "003",
//       fileName: "subfolder_audio_01.mp3",
//       transcription: "Subfolder audio transcription.",
//       folderPath: "C:/Users/AJI/Downloads/audio/ll.mp3",
//       receivedAt: DateTime.now().subtract(const Duration(days: 1)),
//       convertedAt: DateTime.now(),
//       type: "audio/mpeg",
//     ),
//     AudioFileEntity(
//       guid: "004",
//       fileName: "subfolder_audio_02.mp3",
//       transcription: "Second audio transcription.",
//       folderPath: "/audio/lectures/Jan_2024",
//       receivedAt: DateTime.now().subtract(const Duration(days: 3)),
//       convertedAt: DateTime.now().subtract(const Duration(days: 1)),
//       type: "audio/mpeg",
//     ),
//   ];
// }



Future<List<AudioFileEntity>> getAudioFilesBySubFolder() async {
  await Future.delayed(const Duration(milliseconds: 300));

  // Return the original list (no file‑picker logic)
  return [
    AudioFileEntity(
      guid: "003",
      fileName: "subfolder_audio_01.mp3",
      transcription: "Subfolder audio transcription.",
      folderPath: "assets/ll.mp3",
      receivedAt: DateTime.now().subtract(const Duration(days: 1)),
      convertedAt: DateTime.now(),
      type: "audio/mpeg",
    ),
    AudioFileEntity(
      guid: "004",
      fileName: "subfolder_audio_02.mp3",
      transcription: "Second audio transcription.",
      folderPath: "assets/hi.mp3",
      receivedAt: DateTime.now().subtract(const Duration(days: 3)),
      convertedAt: DateTime.now().subtract(const Duration(days: 1)),
      type: "audio/mpeg",
      
    ),
     AudioFileEntity(
      guid: "005",
      fileName: "subfolder_audio_05.mp3",
      transcription: "Second audio transcription.",
      folderPath: "assets/tt.mp3",
      receivedAt: DateTime.now().subtract(const Duration(days: 3)),
      convertedAt: DateTime.now().subtract(const Duration(days: 1)),
      type: "audio/mpeg",
    ),
  ];
}


