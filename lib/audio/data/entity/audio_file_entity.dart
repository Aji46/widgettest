class AudioFileEntity {
  final String guid;
  final String fileName;
  final DateTime receivedAt;
  final DateTime convertedAt;
  final String transcription;
  final String folderPath;
  final String? type;

  AudioFileEntity({
    required this.guid,
    required this.fileName,
    required this.receivedAt,
    required this.convertedAt,
    required this.transcription,
    required this.folderPath,
    this.type,
  });

  factory AudioFileEntity.fromJson(Map<String, dynamic> json) {
    return AudioFileEntity(
      guid: json['guid'],
      fileName: json['fileName'],
      receivedAt: DateTime.parse(json['receivedAt']),
      convertedAt: DateTime.parse(json['convertedAt']),
      transcription: json['transcription'],
      folderPath: json['folderPath'],
      type: json['type'],
    );
  }
}
