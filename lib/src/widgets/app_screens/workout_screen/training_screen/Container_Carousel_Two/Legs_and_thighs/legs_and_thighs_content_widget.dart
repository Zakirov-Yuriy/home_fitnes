import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';

import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class LegsAndThighsContent extends StatelessWidget {
  const LegsAndThighsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        ExerciseWidget(
          imagePath:
              'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102881/higt_knees_dhiqkp.gif',
          exerciseText: S.of(context).High_Knees,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_repeat_60s,
          subtitleText: S.of(context).High_Knees_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/higt_knees',
          semanticLabel:
              'Упражнение Высокие колени, длительность 60 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102881/Lateral_lunges_mwhstd.gif',
          exerciseText: S.of(context).Side_lunges,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_rep_30s,
          subtitleText: S.of(context).Side_lunges_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Lateral_lunges',
          semanticLabel:
              'Упражнение Боковые выпады, длительность 30 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/Kettlebell goblet squat.gif',
          exerciseText: S.of(context).Kettlebell_Squat,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_repeat_60s,
          subtitleText: S.of(context).Kettlebell_Squat_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Kettlebell goblet squat',
          semanticLabel:
              'Упражнение Приседание с гирей, длительность 60 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/one leg row.gif',
          exerciseText: S.of(context).Rowing_on_one_leg,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_repeat_60s,
          subtitleText: S.of(context).Rowing_on_one_leg_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/one leg row',
          semanticLabel:
              'Упражнение Гребля на одной ноге, длительность 60 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/bulgarian split squats.gif',
          exerciseText: S.of(context).Bulgarian_squats,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_repeat_60s,
          subtitleText: S.of(context).Bulgarian_squats_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/bulgarian split squats',
          semanticLabel:
              'Упражнение Болгарские приседания, длительность 60 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102883/Running_vfvzxy.gif',
          exerciseText: S.of(context).Running,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_repeat_60s,
          subtitleText: S.of(context).bug_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Running',
          semanticLabel:
              'Упражнение Бег, длительность 60 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/Donkey kicks.gif',
          exerciseText: S.of(context).Donkey_Kicks,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_rep_30s,
          subtitleText: S.of(context).Donkey_Kicks_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Donkey kicks',
          semanticLabel:
              'Упражнение Ослиные удары, длительность 30 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/Dumbbell squat and press.gif',
          exerciseText: S.of(context).Squats_and_dumbbell_press,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_rep_30s,
          subtitleText: S.of(context).Squats_and_dumbbell_press_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Dumbbell squat and press',
          semanticLabel:
              'Упражнение Приседания и жим гантелей, длительность 30 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/one leg deadlift.gif',
          exerciseText: S.of(context).Single_Leg_Raise,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_rep_30s,
          subtitleText: S.of(context).Single_Leg_Raise_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/one leg deadlift',
          semanticLabel:
              'Упражнение Подъем одной ноги, длительность 30 секунд, 3 повторения.',
        ),
        const CustomDivider(),
        ExerciseWidget(
          imagePath:
              'assets/images/training_image/workout_image/legs_and_thighs/Wall squats.gif',
          exerciseText: S.of(context).Wall_Squats,
          setText: S.of(context).Duration,
          durationText: S.of(context).three_rep_30s,
          subtitleText: S.of(context).Wall_Squats_description,
          videoUrl:
              'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/Wall squats',
          semanticLabel:
              'Упражнение Приседания у стены, длительность 30 секунд, 3 повторения.',
        ),
        const CustomDivider(),
      ],
    );
  }
}
