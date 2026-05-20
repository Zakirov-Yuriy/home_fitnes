import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';

import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class GlutesAndLegsContent extends StatelessWidget {
  const GlutesAndLegsContent({super.key});

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
          label: 'Упражнение Приседания с пистолетом',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/glutes_and_legs/Pistol squats.gif',
            exerciseText: S.of(context).Pistol_Squats,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Pistol_Squats_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/glutes and legs/Pistol squats',
            semanticLabel:
                'Упражнение Приседания с пистолетом. Приседания на одной ноге, другая нога вытянута вперед. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Боковые выпады',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102881/Lateral_lunges_mwhstd.gif',
            exerciseText: S.of(context).Side_lunges,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Side_lunges_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Lateral_lunges',
            semanticLabel:
                'Упражнение Боковые выпады. Шаг вбок с сгибанием одной ноги в колене. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Приседание с гирей',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/Kettlebell goblet squat.gif',
            exerciseText: S.of(context).Kettlebell_Squat,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Kettlebell_Squat_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Kettlebell goblet squat',
            semanticLabel:
                'Упражнение Приседание с гирей. Приседания с гирей на уровне груди. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Ослиные удары',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/Donkey kicks.gif',
            exerciseText: S.of(context).Donkey_Kicks,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Donkey_Kicks_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Donkey kicks',
            semanticLabel:
                'Упражнение Ослиные удары. Поднимание ноги назад в положении на четвереньках. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Подъем одной ноги',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/one leg deadlift.gif',
            exerciseText: S.of(context).Single_Leg_Raise,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Single_Leg_Raise_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/one leg deadlift',
            semanticLabel:
                'Упражнение Подъем одной ноги. Подъем ноги на скамейке с согнутым коленом. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Ягодичный мостик',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/glutes_and_legs/Glute bridge.gif',
            exerciseText: S.of(context).Gluteal_Bridge,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Gluteal_Bridge_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/glutes and legs/Glute bridge',
            semanticLabel:
                'Упражнение Ягодичный мостик. Подъем бедер с сжатием ягодиц в положении лежа. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Прыжки с выпадом',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102882/Lunge_jumps_tdtthg.gif',
            exerciseText: S.of(context).Lunge_jumping,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Lunge_jumping_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Lunge jumps',
            semanticLabel:
                'Упражнение Прыжки с выпадом. Шаг вперед в выпад и прыжок вверх, меняя ноги. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Подъемы ног на скамье',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/glutes_and_legs/Bench leg raises.gif',
            exerciseText: S.of(context).Leg_raises_on_a_bench,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Leg_raises_on_a_bench_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/glutes and legs/Bench leg raises',
            semanticLabel:
                'Упражнение Подъемы ног на скамье. Подъем ног в положении лежа с поддержкой рук под ягодицами. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Упражнение Приседания у стены',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/Wall squats.gif',
            exerciseText: S.of(context).Wall_Squats,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Wall_Squats_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Wall squats',
            semanticLabel:
                'Упражнение Приседания у стены. Приседания у стены с опорой спиной. Длительность: 3 повторения по 30 секунд.',
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
