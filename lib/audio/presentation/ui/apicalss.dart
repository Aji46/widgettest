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



// Future<AudioTranscription> getAudioTranscriptionByGuid(String fguid) async {
//   final uri = Uri.parse("http://localhost:5229/api/FileExplorer/GetByProcessedGuid/$fguid");
//   final response = await _apiService.get(uri);

//   if (response.statusCode == 200) {
//     final Map<String, dynamic> data = json.decode(response.body);
//     return AudioTranscription.fromJson(data);
//   } else {
//     throw Exception('Failed to load transcription: ${response.statusCode}');
//   }
// }


import 'package:test_widget/audio/data/entity/audio_file_entity.dart';
import 'package:test_widget/audio/data/entity/sub_folder_entity.dart';
import 'package:test_widget/audio/data/entity/tanscriptionSegment.dart';

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


Future<AudioTranscription> getAudioTranscriptionByGuidDemo(String fguid) async {
  await Future.delayed(const Duration(milliseconds: 300));

  return AudioTranscription(
    guid: fguid,
    fileName: "Rev.mp3",
    receivedAt: DateTime.parse("2025-04-22T16:17:25.564035Z"),
    convertedAt: DateTime.parse("2025-04-22T16:18:18.669669Z"),
    transcription: "General Hospital Discharge Creation and hospital details Question name John D. Data board 12th June 1952, 73 years old Medical record number NRM 123456 Date of admission time January 2025 Date of discharge 15th January 2025 Hospital name and what City General Hospital Hospitality Unit Attending physician Dr. James Patterson Primary care provider Dr. Sara Mitchell and Dr. Edward Saad family clinic Diagnosis and clinical purpose Admission diagnosis Community acute pneumonia requiring oxygen therapy Discharge diagnosis Resorder pneumonia in good oxygen on home air Secondary diagnosis Hypertension Type 2 Diabetics Traumatic picnic disease stage 3 Hospital and stage summary Consultation Infectious disease for antibiotic selection and duration guidance Polymerally for persistent hypoxia and weaning procedure Procedure number History of person illness 70 years old male person with worsening dyspnea productive cough and fever Just extra shower, night, lower blood, consolidation consistent with pneumonia Embryic treatment started with IV, Cif-Triaxone and Aziromazole Required supplement of oxygen at 2 LNC Brief hospital close",
    folderPath: "G:\\dotnet learning\\AudioToText\\AudioToText.API\\Audio\\completed\\Rev.mp3",
    type: null,
    status: "Completed",
    srtSegments: [
      TranscriptionSegment(
        startTime: "00:00:00",
        endTime: "00:00:03",
        transcriptText: "General Hospital Discharge",
      ),
      TranscriptionSegment(
        startTime: "00:00:03",
        endTime: "00:00:06",
        transcriptText: "Creation and hospital details",
      ),
      TranscriptionSegment(
        startTime: "00:00:06",
        endTime: "00:00:07",
        transcriptText: "Question name John D.",
      ),
      TranscriptionSegment(
        startTime: "00:00:07",
        endTime: "00:00:10",
        transcriptText: "Data board 12th June 1952, 73 years old",
      ),
      TranscriptionSegment(
        startTime: "00:00:10",
        endTime: "00:00:13",
        transcriptText: "Medical record number NRM 123456",
      ),
      TranscriptionSegment(
        startTime: "00:00:13",
        endTime: "00:00:17",
        transcriptText: "Date of admission time January 2025",
      ),
      TranscriptionSegment(
        startTime: "00:00:17",
        endTime: "00:00:20",
        transcriptText: "Date of discharge 15th January 2025",
      ),
      TranscriptionSegment(
        startTime: "00:00:20",
        endTime: "00:00:22",
        transcriptText: "Hospital name and what",
      ),
      TranscriptionSegment(
        startTime: "00:00:22",
        endTime: "00:00:23",
        transcriptText: "City General Hospital",
      ),
      TranscriptionSegment(
        startTime: "00:00:23",
        endTime: "00:00:25",
        transcriptText: "Hospitality Unit",
      ),
      TranscriptionSegment(
        startTime: "00:00:25",
        endTime: "00:00:28",
        transcriptText: "Attending physician Dr. James Patterson",
      ),
      TranscriptionSegment(
        startTime: "00:00:28",
        endTime: "00:00:31",
        transcriptText: "Primary care provider Dr. Sara Mitchell",
      ),
      TranscriptionSegment(
        startTime: "00:00:31",
        endTime: "00:00:34",
        transcriptText: "and Dr. Edward Saad family clinic",
      ),
      TranscriptionSegment(
        startTime: "00:00:34",
        endTime: "00:00:37",
        transcriptText: "Diagnosis and clinical purpose",
      ),
      TranscriptionSegment(
        startTime: "00:00:37",
        endTime: "00:00:38",
        transcriptText: "Admission diagnosis",
      ),
      TranscriptionSegment(
        startTime: "00:00:38",
        endTime: "00:00:41",
        transcriptText: "Community acute pneumonia requiring oxygen therapy",
      ),
      TranscriptionSegment(
        startTime: "00:00:41",
        endTime: "00:00:42",
        transcriptText: "Discharge diagnosis",
      ),
      TranscriptionSegment(
        startTime: "00:00:42",
        endTime: "00:00:47",
        transcriptText: "Resorder pneumonia in good oxygen on home air",
      ),
      TranscriptionSegment(
        startTime: "00:00:47",
        endTime: "00:00:48",
        transcriptText: "Secondary diagnosis",
      ),
      TranscriptionSegment(
        startTime: "00:00:48",
        endTime: "00:00:49",
        transcriptText: "Hypertension",
      ),
      TranscriptionSegment(
        startTime: "00:00:49",
        endTime: "00:00:50",
        transcriptText: "Type 2 Diabetics",
      ),
      TranscriptionSegment(
        startTime: "00:00:50",
        endTime: "00:00:53",
        transcriptText: "Traumatic picnic disease stage 3",
      ),
      TranscriptionSegment(
        startTime: "00:00:53",
        endTime: "00:00:55",
        transcriptText: "Hospital and stage summary",
      ),
      TranscriptionSegment(
        startTime: "00:00:55",
        endTime: "00:00:56",
        transcriptText: "Consultation",
      ),
      TranscriptionSegment(
        startTime: "00:00:56",
        endTime: "00:01:02",
        transcriptText: "Infectious disease for antibiotic selection and duration guidance",
      ),
      TranscriptionSegment(
        startTime: "00:01:02",
        endTime: "00:01:08",
        transcriptText: "Polymerally for persistent hypoxia and weaning procedure",
      ),
      TranscriptionSegment(
        startTime: "00:01:08",
        endTime: "00:01:09",
        transcriptText: "Procedure number",
      ),
      TranscriptionSegment(
        startTime: "00:01:09",
        endTime: "00:01:12",
        transcriptText: "History of person illness",
      ),
      TranscriptionSegment(
        startTime: "00:01:12",
        endTime: "00:01:20",
        transcriptText: "70 years old male person with worsening dyspnea productive cough and fever",
      ),
      TranscriptionSegment(
        startTime: "00:01:20",
        endTime: "00:01:27",
        transcriptText: "Just extra shower, night, lower blood, consolidation consistent with pneumonia",
      ),
      TranscriptionSegment(
        startTime: "00:01:27",
        endTime: "00:01:33",
        transcriptText: "Embryic treatment started with IV, Cif-Triaxone and Aziromazole",
      ),
      TranscriptionSegment(
        startTime: "00:01:33",
        endTime: "00:01:37",
        transcriptText: "Required supplement of oxygen at 2 LNC",
      ),
      TranscriptionSegment(
        startTime: "00:01:37",
        endTime: "00:01:39",
        transcriptText: "Brief hospital close",
      ),
    ],
  );
}






Future<List<AudioFileEntity>> getAudioFolders() async {
  await Future.delayed(const Duration(milliseconds: 300));

  // Return the original list (no file‑picker logic)
  return [
    AudioFileEntity(
      guid: "003",
      fileName: "subfolder_audio_01.mp3",
      transcription: "General Hospital Discharge Creation and hospital details Question name John D. Data board 12th June 1952, 73 years old Medical record number NRM 123456 Date of admission time January 2025 Date of discharge 15th January 2025 Hospital name and what City General Hospital Hospitality Unit Attending physician Dr. James Patterson Primary care provider Dr. Sara Mitchell and Dr. Edward Saad family, clinic Diagnosis and clinical purpose Admission diagnosis Community acute pneumonia requirin oxygen therapy Discharge diagnosis Resorder pneumonia in good oxygen on home air Secondary diagnosisHypertension Type 2 Diabetics Traumatic picnic disease stage 3 Hospital and stage summary Consultation Infectious disease for antibiotic selection and duration guidance Polymerally for persistent hypoxia and weaning procedure Procedure number History of person illness 70 years old male person with worsening dyspnea productive cough and fever Just extra shower, night, lower blood, consolidation consistent with pneumonia Embryic treatment started with IV, Cif-Triaxone and Aziromazole Required supplement of oxygen at 2 LNC Brief hospital close",
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



Future<List<AudioFileEntity>> getAudioFilesBySubFolder() async {
  await Future.delayed(const Duration(milliseconds: 300));

  // Return the original list (no file‑picker logic)
  return [
    AudioFileEntity(
      guid: "003",
      fileName: "subfolder_audio_01.mp3",
      transcription: "General Hospital Discharge Creation and hospital details Question name John D. Data board 12th June 1952, 73 years old Medical record number NRM 123456 Date of admission time January 2025 Date of discharge 15th January 2025 Hospital name and what City General Hospital Hospitality Unit Attending physician Dr. James Patterson Primary care provider Dr. Sara Mitchell and Dr. Edward Saad family, clinic Diagnosis and clinical purpose Admission diagnosis Community acute pneumonia requirin oxygen therapy Discharge diagnosis Resorder pneumonia in good oxygen on home air Secondary diagnosisHypertension Type 2 Diabetics Traumatic picnic disease stage 3 Hospital and stage summary Consultation Infectious disease for antibiotic selection and duration guidance Polymerally for persistent hypoxia and weaning procedure Procedure number History of person illness 70 years old male person with worsening dyspnea productive cough and fever Just extra shower, night, lower blood, consolidation consistent with pneumonia Embryic treatment started with IV, Cif-Triaxone and Aziromazole Required supplement of oxygen at 2 LNC Brief hospital close",
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


