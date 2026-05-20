import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';

import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class MeltsFatContent extends StatelessWidget {
  const MeltsFatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Разделитель',
          child: const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Semantics(
          label: 'Ряды ренегатов',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Renegade rows.gif',
            exerciseText: S.of(context).Ranks_of_the_Renegades,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Ranks_of_the_Renegades_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Renegade rows',
            semanticLabel:
                'Упражнение Ряды ренегатов. Подъем гантелей к плечу в позе отжимания для укрепления ядра и рук. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Военный жим сидя',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Seated military press.gif',
            exerciseText: S.of(context).Military_Seated_Press,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Military_Seated_Press_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Seated military press',
            semanticLabel:
                'Упражнение Военный жим сидя. Подъем гантелей над головой, сидя на скамье. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Отжимание',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/push aps.gif',
            exerciseText: S.of(context).Push_up,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Push_up_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/push aps',
            semanticLabel:
                'Упражнение Отжимание. Опускание тела, согнув руки, и отжимание для укрепления груди и рук. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Подъем лат на одной руке',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Bent over one arm lat raise.gif',
            exerciseText: S.of(context).Lifting_armor_on_one_arm,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Lifting_armor_on_one_arm_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Bent over one arm lat raise',
            semanticLabel:
                'Упражнение Подъем лат на одной руке. Наклон вперед с подъемом гантели вверх. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Вращения дельт стоя',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Standing real delt rotations.gif',
            exerciseText: S.of(context).Standing_delt_rotations,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Standing_delt_rotations_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Standing real delt rotations',
            semanticLabel:
                'Упражнение Вращения дельт стоя. Подъем рук в стороны с вращением вперед и назад. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Передний подъем',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Front raise .gif',
            exerciseText: S.of(context).Front_lift,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Front_lift_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Front raise ',
            semanticLabel:
                'Упражнение Передний подъем. Подъем рук вперед от корпуса до уровня плеч. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Пловцы',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/swimmers.gif',
            exerciseText: S.of(context).Swimmers,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Swimmers_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/swimmers',
            semanticLabel:
                'Упражнение Пловцы. Лежа на животе, руки вытянуты вперед, ноги плавают. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Наклонный ряд',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/Bent over row.gif',
            exerciseText: S.of(context).Slant_row,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Slant_row_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Bent over row',
            semanticLabel:
                'Упражнение Наклонный ряд. Наклон вперед с поднятием гантелей к животу. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
