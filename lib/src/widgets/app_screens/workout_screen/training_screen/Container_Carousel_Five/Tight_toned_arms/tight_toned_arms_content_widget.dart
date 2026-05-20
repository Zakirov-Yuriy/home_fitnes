import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';
import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class TightTonedArmsThighsContent extends StatelessWidget {
  const TightTonedArmsThighsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Semantics(
          label:
              'Упражнение: Подъем гантелей вперед. Длительность 3 повторение по 60 секунд. Подъем гантелей вперед: Возьмите гантели в каждую руку, станьте прямо. Поднимите гантели вперед, сохраняя прямые руки и контролируя движение. Вернитесь в исходное положение с контролем.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/Front dumbbel raise.gif',
            exerciseText: S.of(context).Dumbbell_Forward_Raise,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Dumbbell_Forward_Raise_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/Front dumbbel raise',
            semanticLabel:
                'Упражнение Подъем гантелей вперед. Длительность: 3 повторения по 60 секунд. Возьмите гантели в каждую руку, станьте прямо. Поднимите гантели вперед, сохраняя прямые руки и контролируя движение.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Верхний жим трицепса. Длительность 3 повторение по 30 секунд. Верхний жим трицепса: Лягте на скамью или пол, возьмите гантели в руки над грудью с прямыми руками. Согните руки в локтях, опуская гантели к голове. Вернитесь в исходное положение, поднимая гантели вверх.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/tricep overhead press.gif',
            exerciseText: S.of(context).Upper_triceps_press,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Upper_triceps_press_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/tricep overhead press',
            semanticLabel:
                'Упражнение Верхний жим трицепса. Длительность: 3 повторения по 30 секунд. Лягте на скамью или пол, возьмите гантели в руки над грудью с прямыми руками. Согните руки в локтях, опуская гантели к голове. Вернитесь в исходное положение, поднимая гантели вверх.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Приседания и жим гантелей. Длительность 3 повторение по 60 секунд. Приседания и жим гантелей: Возьмите гантели в каждую руку, станьте прямо. Сделайте приседание, затем поднимите гантели к плечам. Отталкивайтесь от пят, выполняя жим гантелей вверх.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/dumbbell squat and press.gif',
            exerciseText: S.of(context).Squats_and_dumbbell_press,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Squats_and_dumbbell_press_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/dumbbell squat and press',
            semanticLabel:
                'Упражнение Приседания и жим гантелей. Длительность: 3 повторения по 60 секунд. Возьмите гантели в каждую руку, станьте прямо. Сделайте приседание, затем поднимите гантели к плечам. Отталкивайтесь от пят, выполняя жим гантелей вверх.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Гантельный ряд с наклоном. Длительность 3 повторение по 60 секунд. Гантельный ряд с наклоном: Возьмите гантели в каждую руку, станьте прямо. Наклонитесь вперед, держа гантели перед собой. Поднимите гантели к телу, сокращая лопатки. Спускайте гантели обратно и повторите.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/dumbbell bent over row.gif',
            exerciseText: S.of(context).Dumbbell_row_with_slope,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Dumbbell_row_with_slope_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/dumbbell bent over row',
            semanticLabel:
                'Упражнение Гантельный ряд с наклоном. Длительность: 3 повторения по 60 секунд. Возьмите гантели в каждую руку, станьте прямо. Наклонитесь вперед, держа гантели перед собой. Поднимите гантели к телу, сокращая лопатки.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Подъем гантелей. Длительность 3 повторение по 60 секунд. Подъем гантелей: Возьмите гантели в каждую руку, станьте прямо. Поднимите гантели к плечам, сохраняя прямые руки и контролируя движение. Спустите гантели обратно и повторите.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/dumbbell step up.gif',
            exerciseText: S.of(context).Dumbbell_Raise,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Dumbbell_Raise_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/dumbbell step up',
            semanticLabel:
                'Упражнение Подъем гантелей. Длительность: 3 повторения по 60 секунд. Возьмите гантели в каждую руку, станьте прямо. Поднимите гантели к плечам, сохраняя прямые руки и контролируя движение.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Махи с гантелями. Длительность 3 повторение по 60 секунд. Махи с гантелями: Возьмите гантели в руки, станьте прямо. Разведите руки в стороны, поднимая гантели до уровня плеч. Медленно опустите гантели обратно и повторите движение.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/dumbbell peck fly.gif',
            exerciseText: S.of(context).Swings_with_dumbbells,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Swings_with_dumbbells_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/dumbbell peck fly',
            semanticLabel:
                'Упражнение Махи с гантелями. Длительность: 3 повторения по 60 секунд. Возьмите гантели в руки, станьте прямо. Разведите руки в стороны, поднимая гантели до уровня плеч. Медленно опустите гантели обратно и повторите движение.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Скручивание молота стоя. Длительность 3 повторение по 30 секунд. Скручивание молота стоя: Возьмите гантель в руку, станьте прямо. Поднимите гантель перед собой на уровень плеч. Поворачивайте торс в сторону противоположной руке, скручивая корпус. Вернитесь в исходное положение и повторите на другой стороне.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/Standing hammer curl.gif',
            exerciseText: S.of(context).Standing_hammer_curl,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Standing_hammer_curl_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/Standing hammer curl',
            semanticLabel:
                'Упражнение Скручивание молота стоя. Длительность: 3 повторения по 30 секунд. Возьмите гантель в руку, станьте прямо. Поднимите гантель перед собой на уровень плеч. Поворачивайте торс в сторону противоположной руке, скручивая корпус.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Военный жим гантелей в положении сидя. Длительность 3 повторение по 30 секунд. Военный жим гантелей в положении сидя: Сядьте на скамью с поддержкой спины. Возьмите гантели в руки и поднимите их к плечам. Выпрямите руки вверх, поднимая гантели над головой. Опустите гантели обратно к плечам и повторите движение.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/Seated dumbbell military press.gif',
            exerciseText:
                S.of(context).Military_dumbbell_press_in_a_seated_position,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S
                .of(context)
                .Military_dumbbell_press_in_a_seated_position_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/Seated dumbbell military press',
            semanticLabel:
                'Упражнение Военный жим гантелей в положении сидя. Длительность: 3 повторения по 30 секунд. Сядьте на скамью с поддержкой спины. Возьмите гантели в руки и поднимите их к плечам. Выпрямите руки вверх, поднимая гантели над головой.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Отжимания на одном колене. Длительность 3 повторение по 30 секунд. Отжимания на одном колене: Встаньте на колени и руки, поддерживая верхнее тело. Опустите верхнее тело, согнув руки в локтях. Вернитесь в исходное положение, выпрямив руки. Повторите упражнение на одном колене, затем переключитесь на другое.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/tight_toned_arms/One knee push ups.gif',
            exerciseText: S.of(context).Push_ups_on_one_knee,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Push_ups_on_one_knee_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/tight_toned_arms/One knee push ups',
            semanticLabel:
                'Упражнение Отжимания на одном колене. Длительность: 3 повторения по 30 секунд. Встаньте на колени и руки, поддерживая верхнее тело. Опустите верхнее тело, согнув руки в локтях. Вернитесь в исходное положение, выпрямив руки.',
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
