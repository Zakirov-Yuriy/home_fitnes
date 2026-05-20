import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';
import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class BiggerBootyContent extends StatelessWidget {
  const BiggerBootyContent({super.key});

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
          label: 'Приседания с весом тела',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Bigger booty/Bodyweight squats.gif',
            exerciseText: S.of(context).Body_weight_squats,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Body_weight_squats_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Bigger booty/Bodyweight squats',
            semanticLabel:
                'Упражнение Приседания с весом тела. Станьте прямо, ноги на ширине плеч. Распределите вес тела на пятки и поднимите грудь. Согните колени и опуститесь вниз, как будто садитесь на стул. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Боковые скрещивания ног',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Bigger booty/on side leg crossovers.gif',
            exerciseText: S.of(context).Side_Leg_Crosses,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Side_Leg_Crosses_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Bigger booty/on side leg crossovers',
            semanticLabel:
                'Упражнение Боковые скрещивания ног. Лягте на бок, упритесь на предплечья и локти. Согните верхнюю ногу и положите ее на пол перед нижней ногой. Напрягите боковые мышцы пресса и поднимите нижнюю ногу, скрестив ее над верхней ногой. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Прыжки с выпадом',
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
                'Упражнение Прыжки с выпадом. Сделайте шаг вперед, выпадая на одну ногу, затем прыгайте вверх и меняйте ноги в воздухе. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Обратный выпад с поднятой передней ногой',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/Bigger booty/Reverse lunge with elevated front leg.gif',
            exerciseText: S.of(context).Reverse_lunge_with_front_leg_raised,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText:
                S.of(context).Reverse_lunge_with_front_leg_raised_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Bigger booty/Reverse lunge with elevated front leg',
            semanticLabel:
                'Упражнение Обратный выпад с поднятой передней ногой. Станьте прямо, поднимите одну ногу назад, согнув ее в колене. Опустите таз, согнув другую ногу в колене. Поднимите таз обратно. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Подтягивание бедра',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Hip thruster.gif',
            exerciseText: S.of(context).Thigh_Tuck,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Thigh_Tuck_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Hip thruster',
            semanticLabel:
                'Упражнение Подтягивание бедра. Сядьте на тренажер для подтягивания бедра, настройте вес и выберите желаемый уровень нагрузки. Разместите подкладку на нужном уровне, чтобы верхняя часть бедра была поддержана. Согните бедро и поднимите его, затем медленно опустите. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Гребля на одной ноге',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/one leg row.gif',
            exerciseText: S.of(context).Rowing_on_one_leg,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Rowing_on_one_leg_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/one leg row',
            semanticLabel:
                'Упражнение Гребля на одной ноге. Сидя на тренажере, удерживая рукоятку, двигайте ногу вперед и назад, эмулируя движение гребли. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Ягодичный мостик и подъем ног',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Glute bridge to leg raise.gif',
            exerciseText: S.of(context).Glute_bridge_and_leg_lifts,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Glute_bridge_and_leg_lift_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Glute bridge to leg raise',
            semanticLabel:
                'Упражнение Ягодичный мостик и подъем ног. Лягте на спину, согните ноги. Поднимите бедра, напрягая ягодицы. Поднимите ногу вверх, затем медленно опустите. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Ослиные удары',
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
                'Упражнение Ослиные удары. Начните в положении стойки на четвереньках. Отклоняйте одну ногу назад и поднимайте ее высоко наверх. Повторите с другой ногой. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        Semantics(
          label: 'Разделитель',
          child: const CustomDivider(),
        ),
        Semantics(
          label: 'Болгарские приседания',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/legs_and_thighs/bulgarian split squats.gif',
            exerciseText: S.of(context).Bulgarian_squats,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Bulgarian_squats_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Legs and thighs/bulgarian split squats',
            semanticLabel:
                'Упражнение Болгарские приседания. Станьте спиной к скамье, поставьте одну ногу на нее, другая нога впереди. Опуститесь в присед, сгибая переднюю ногу, затем поднимитесь. Длительность: 3 повторения по 60 секунд.',
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
