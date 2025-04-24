import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_widget/audio/presentation/view_model/widgets/audio_info.dart';

class FileItem extends StatelessWidget {
  final String filename;
  final DateTime receivedTime;
  final DateTime convertedTime;
  final String transcriptText;

  const FileItem({
    super.key,
    required this.filename,
    required this.receivedTime,
    required this.convertedTime,
    required this.transcriptText,
  });

  @override
  Widget build(BuildContext context) {
    final receivedAt = (receivedTime);
    final convertedAt = (convertedTime);

    final formattedReceived = DateFormat(
      'hh:mm a  dd MMM yyyy',
    ).format(receivedAt);
    final formattedConverted = DateFormat(
      'hh:mm a  dd MMM yyyy',
    ).format(convertedAt);

    return InkWell(
      onTap: () => navigate(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.audio_file_rounded),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            filename,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: Text(
                      'Received at: $formattedReceived\nConverted at: $formattedConverted',
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Text(transcriptText, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AudioInfo(
              fileName: filename,
              file: 'assets/audio/sample.wav',
              transcriptText: '',
            ),
      ),
    );
  }
}
