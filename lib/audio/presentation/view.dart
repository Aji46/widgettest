import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_widget/audio/data/repository/audio_repo_imp.dart';
import 'package:test_widget/audio/domain/usecase/audio_usecase.dart';
import 'package:test_widget/audio/presentation/view_model/audio_cubit.dart';
import 'package:test_widget/audio/presentation/view_model/audio_state.dart';



class FileExploreScreen extends StatelessWidget {
  const FileExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    final repository = AudioRepositoryImpl(http.Client());

    return BlocProvider(
      create: (_) => AudioExplorerCubit(
        getFoldersUseCase: GetAudioFoldersUseCase(repository),
        getFilesUseCase: GetAudioFilesUseCase(repository),
      )..loadFolders(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocBuilder<AudioExplorerCubit, AudioExplorerState>(
          builder: (context, state) {
            final cubit = context.read<AudioExplorerCubit>();
            return Row(
              children: [
                // Sidebar
                Container(
                  width: 250,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("FILE EXPLORE", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: cubit.toggleFolderVisibility,
                        child: Row(
                          children: const [
                            Icon(Icons.folder, color: Colors.amber),
                            SizedBox(width: 8),
                            Text("Audio", style: TextStyle(fontSize: 16))
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (state.showFolders)
                        ...state.dateFolders.map((date) => GestureDetector(
                              onTap: () => cubit.loadAudioFiles(date),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0, bottom: 10),
                                child: Row(
                                  children: [
                                    const Icon(Icons.folder, color: Colors.amber),
                                    const SizedBox(width: 8),
                                    Text(date, style: const TextStyle(fontSize: 16))
                                  ],
                                ),
                              ),
                            ))
                    ],
                  ),
                ),

                // Content Area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: state.loadingAudio
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: state.audioFiles.length,
                            itemBuilder: (context, index) {
                              final audio = state.audioFiles[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.audio_file, size: 40, color: Colors.grey[700]),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(audio.fileName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            const SizedBox(height: 8),
                                        Text(
  audio.transcription.isNotEmpty ? audio.transcription : "hallo",
  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
)

                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("Received at : ${audio.receivedAt}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                          const SizedBox(height: 4),
                                          Text("Converted at : ${audio.convertedAt}", style: const TextStyle(fontSize: 12, color: Colors.grey))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
