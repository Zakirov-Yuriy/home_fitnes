import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';
import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class BellyFatBurnerThighsContent extends StatelessWidget {
  const BellyFatBurnerThighsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Semantics(
          label:
              'Упражнение: Подтягивание бедра. Длительность: 3 повторение 60 секунд. Подтягивание бедра: сядьте на тренажер для подтягивания бедра, настройте вес и выберите желаемый уровень нагрузки. Разместите подкладку на нужном уровне, чтобы верхняя часть бедра была определенно поддержана. Согните бедро и поднимите его, затем медленно опустите. Повторите для другой ноги.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Hip thruster.gif',
            exerciseText: S.of(context).Thigh_Tuck,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Thigh_Tuck_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Hip thruster',
            semanticLabel:
                'Упражнение Подтягивание бедра, длительность 60 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Отжимания с хлопками. Длительность: 3 повторение 30 секунд. Отжимания с хлопками: Встаньте в позу отжимания на полу, руки на ширине плеч. Опустите тело вниз, затем с силой оттолкнитесь от пола и сделайте хлопок руками под собой, вернитесь в исходное положение. Это упражнение развивает силу в верхней части тела и улучшает выносливость.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Clapping push ups.gif',
            exerciseText: S.of(context).Push_ups_with_clapping,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Push_ups_with_clapping_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Clapping push ups',
            semanticLabel:
                'Упражнение Отжимания с хлопками, длительность 30 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Подъем Гархаммер. Длительность: 3 повторение 60 секунд. Подъем Гархаммер: Лягте на пол на животе, руки вытянуты вдоль тела. Согните колени и поднимите стопы к бедрам. Напрягите мышцы ягодиц и нижней части спины, затем поднимите верхнюю часть тела, пытаясь дотянуться плечами до ягодиц. Замедленно опустите верхнюю часть тела обратно на пол. Повторите для укрепления и развития мышц ягодиц и спины.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Gar hammer raise.gif',
            exerciseText: S.of(context).Rise_of_Garhammer,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Rise_of_Garhammer_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Gar hammer raise',
            semanticLabel:
                'Упражнение Подъем Гархаммер, длительность 60 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Ягодичный мостик. Длительность: 3 повторение 60 секунд. Ягодичный мостик: лягте на спину, согните ноги и поставьте стопы на полу. Медленно поднимите бедра вверх, сжимая ягодицы. Задержитесь на верхней точке, затем медленно опуститесь обратно. Укрепляйте ягодицы и спину. Повторяйте для силы и тонуса.',
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
                'Упражнение Ягодичный мостик, длительность 60 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Crunch. Длительность: 3 повторение 60 секунд. Crunch - упражнение для пресса, лежа на спине. Лягте с согнутыми в коленях ногами и руками за головой. Сделайте упор на живот, поднимите плечи от пола, не тяните шею. Поднимитесь до угла 30°, задержитесь и медленно опуститесь. Повторите для силы и контроля.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/crunch.gif',
            exerciseText: S.of(context).Crunch,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Crunch_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/crunch',
            semanticLabel:
                'Упражнение Crunch, длительность 60 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Пловцы. Длительность: 3 повторение 60 секунд. Пловцы - это упражнение, при котором человек находится в положении лежа на животе в воде, руки вытянуты вперед, а ноги плывут на поверхности воды. Плавание - это отличное кардиоупражнение, которое укрепляет мышцы спины, плеч и рук, а также улучшает выносливость и координацию.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/melts_fat/swimmers.gif',
            exerciseText: S.of(context).Swimmers,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Swimmers_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/swimmers',
            semanticLabel:
                'Упражнение Пловцы, длительность 60 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Нож из положения лежа. Длительность: 3 повторение 30 секунд. Нож из положения лежа: Начните с положения лежа на спине с вытянутыми руками и ногами. Поднимите одновременно верхнюю часть тела и ноги с пола, пытаясь их соприкоснуться, образуя изогнутую форму тела, напоминающую нож. Задержитесь в этом положении на мгновение, затем медленно вернитесь в исходное положение. Повторите для укрепления кора и пресса.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Jackknife from lying flat.gif',
            exerciseText: S.of(context).Knife_from_a_prone_position,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Knife_from_a_prone_position_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Jackknife from lying flat',
            semanticLabel:
                'Упражнение Нож из положения лежа, длительность 30 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label:
              'Упражнение: Ягодичный мостик и подъем ног. Длительность: 3 повторение 30 секунд. Ягодичный мостик и подъем ног: Лягте на спину, согните ноги. Поднимите бедра, напрягая ягодицы. Поднимите ногу вверх, затем медленно опустите. Повторите с другой ногой.',
          child: ExerciseWidget(
            imagePath:
                'assets/images/training_image/workout_image/belly_fat_burner/Glute bridge to leg raise.gif',
            exerciseText: S.of(context).Glute_bridge_and_leg_lifts,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Glute_bridge_and_leg_lifts_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/belly fat burner/Glute bridge to leg raise',
            semanticLabel:
                'Упражнение Ягодичный мостик и подъем ног, длительность 30 секунд, 3 повторения.',
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
