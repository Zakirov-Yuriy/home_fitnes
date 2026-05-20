import 'package:flutter/material.dart';

import 'exercise_details_bottom_sheet.dart';

class ExerciseWidget extends StatelessWidget {
  final String imagePath;
  final String exerciseText;
  final String subtitleText;
  final String setText;
  final String durationText;
  final String videoUrl;

  ExerciseWidget({
    super.key,
    required this.imagePath,
    required this.exerciseText,
    required this.subtitleText,
    required this.setText,
    required this.durationText,
    required this.videoUrl,
    required String semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showExerciseDetails(context);
      },
      child: Semantics(
        label: '$exerciseText. $subtitleText',
        hint: 'Нажмите для просмотра деталей упражнения.',
        child: Row(
          children: [
            Semantics(
              label: 'Изображение упражнения',
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imagePath.startsWith('http')
                    ? Image.network(
                        imagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('❌ Error loading image: $error');
                          debugPrint('URL: $imagePath');
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                    : Image(
                        width: 100,
                        height: 100,
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      label: 'Название упражнения: $exerciseText',
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          exerciseText,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Semantics(
                      label: 'Подзаголовок: $subtitleText',
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            150, // Ширина экрана минус ширина изображения и отступа
                        child: Text(
                          subtitleText,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Максимальное количество строк
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExerciseDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Установка параметра isScrollControlled в true
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Semantics(
            label: 'Детали упражнения: $exerciseText',
            child: ExerciseDetailsBottomSheet(
              imagePath: imagePath,
              exerciseText: exerciseText,
              subtitleText: subtitleText,
              setText: setText,
              durationText: durationText,
              videoUrl: videoUrl,
            ),
          ),
        );
      },
    );
  }
}
