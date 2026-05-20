import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';
import '../../../../divider_your_body_widget.dart'; // Убедитесь, что путь к импорту корректен
import '../../../exercise_widget.dart'; // Убедитесь, что путь к импорту корректен

class FaceExercisesThighsContent extends StatelessWidget {
  const FaceExercisesThighsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Разделитель',
          child:
              const CustomDivider(), // Предположительно, CustomDivider - это стилизованная версия Divider
        ),
        Semantics(
          label: 'Упражнение AEIOU',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/_AEIOU_.png',
            exerciseText: S.of(context).AEIOU,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).AEIOU_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/_AEIOU_',
            semanticLabel:
                'Упражнение AEIOU, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение CHEEK FIRMER',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/CHEEK_FIRMER.png',
            exerciseText: S.of(context).CHEEK_FIRMER,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).CHEEK_FIRMER_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/CHEEK FIRMER',
            semanticLabel:
                'Упражнение CHEEK FIRMER, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение DRAWN CHEEKS',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/DRAWN_CHEEKS.png',
            exerciseText: S.of(context).DRAWN_CHEEKS,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).DRAWN_CHEEKS_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/DRAWN CHEEKS',
            semanticLabel:
                'Упражнение DRAWN CHEEKS, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение EYE LIFT',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/EYE_LIFT.png',
            exerciseText: S.of(context).EYE_LIFT,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).EYE_LIFT_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/EYE LIFT',
            semanticLabel:
                'Упражнение EYE LIFT, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение EYES CIRCLES',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/EYES_CIRCLES.png',
            exerciseText: S.of(context).EYES_CIRCLES,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).EYES_CIRCLES_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/EYES CIRCLES',
            semanticLabel:
                'Упражнение EYES CIRCLES, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение JAW LINE',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/JAW_LINE.png',
            exerciseText: S.of(context).JAW_LINE,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).AW_LINE_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/JAW LINE',
            semanticLabel:
                'Упражнение JAW LINE, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение LION',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/LION.png',
            exerciseText: S.of(context).LION,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).LION_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/LION',
            semanticLabel:
                'Упражнение LION, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение NOSE TOUCHING',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/NOSE_TOUCHING.png',
            exerciseText: S.of(context).NOSE_TOUCHING,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).NOSE_TOUCHING_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/NOSE TOUCHING',
            semanticLabel:
                'Упражнение NOSE TOUCHING, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение PUFFY CHEEKS',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/PUFFY_CHEEKS.png',
            exerciseText: S.of(context).PUFFY_CHEEKS,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).PUFFY_CHEEKS_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/PUFFY CHEEKS',
            semanticLabel:
                'Упражнение PUFFY CHEEKS, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение SMILE',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/SMILE.png',
            exerciseText: S.of(context).SMILE,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).SMILE_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/SMILE',
            semanticLabel:
                'Упражнение SMILE, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение UNDERCHIN DUCK',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/UNDERCHIN_DUCK.png',
            exerciseText: S.of(context).UNDERCHIN_DUCK,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).UNDERCHIN_DUCK_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/UNDERCHIN DUCK',
            semanticLabel:
                'Упражнение UNDERCHIN DUCK, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение SMILING FISH FACE',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Face exercises/SMILING_FISH_FACE.png',
            exerciseText: S.of(context).SMILING_FISH_FACE,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).SMILING_FISH_FACE_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Face_exercises/SMILING FISH FACE',
            semanticLabel:
                'Упражнение SMILING FISH FACE, длительность 30 секунд, 3 повторения.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
      ],
    );
  }
}
