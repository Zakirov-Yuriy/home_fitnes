import 'package:flutter/material.dart';
import 'package:home_fitness/generated/l10n.dart';

import '../../../../divider_your_body_widget.dart';
import '../../../exercise_widget.dart';

class YourBodyContent extends StatelessWidget {
  const YourBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: 'Разделитель',
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Semantics(
          label: 'Упражнение Бег',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102883/Running_vfvzxy.gif',
            exerciseText: S.of(context).Running, // Заголовок упражнения Бег
            setText: S.of(context).Duration, // Длительность
            durationText:
                S.of(context).three_repeat_60s, // Повторения упражнения
            subtitleText: S.of(context).bug_description, //Описание упражнения
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Running',
            semanticLabel:
                'Упражнение Бег. Отличная кардионагрузка, укрепляющая ноги и ягодицы. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Сумо приседания прыжки',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102884/sumo_squat_jumps_ei9lzc.gif',
            exerciseText: S.of(context).Sumo_squats_jumping,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Sumo_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/sumo squat jumps',
            semanticLabel:
                'Упражнение Сумо приседания прыжки. Приседания с широким расставлением ног с прыжками вверх. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Горные альпинисты',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102882/MOUNTAIN_CLIMBER_kb0qvf.gif',
            exerciseText: S.of(context).Mountain_climbers,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Mountain_climbers_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/MOUNTAIN CLIMBER',
            semanticLabel:
                'Упражнение Горные альпинисты. Подтягивание колена к груди в планке. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Звездный прыжок',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102880/Touch_ground_star_jump_bllqys.gif',
            exerciseText: S.of(context).Star_Leap,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Star_Leap_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Touch ground star jump',
            semanticLabel:
                'Упражнение Звездный прыжок. Выпрыгивание вверх с расправленными руками и ногами. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Боксерские джебы',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102880/boxing_jabs_lckxyh.gif',
            exerciseText: S.of(context).Boxing_Jabs,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).Boxing_Jabs_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/boxing_jabs',
            semanticLabel:
                'Упражнение Боксерские джебы. Быстрые короткие удары левой и правой рукой. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Высокие колени',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102881/higt_knees_dhiqkp.gif',
            exerciseText: S.of(context).High_Knees,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_repeat_60s,
            subtitleText: S.of(context).High_Knees_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/higt_knees',
            semanticLabel:
                'Упражнение Высокие колени. Бег на месте с поднятием колен выше. Длительность: 3 повторения по 60 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Прыжки с выпадом',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102882/Lunge_jumps_tdtthg.gif',
            exerciseText: S.of(context).Lunge_jumping,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Lunge_jumping_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/Lunge jumps',
            semanticLabel:
                'Упражнение Прыжки с выпадом. Шаг вперед в выпад и прыжок с заменой ног. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        const CustomDivider(),
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
                'Упражнение Боковые выпады. Шаг вбок с согнутым коленом. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        const CustomDivider(),
        Semantics(
          label: 'Упражнение Боковые подъемы бедер',
          child: ExerciseWidget(
            imagePath:
                'https://res.cloudinary.com/dccyuxqzj/image/upload/v1779102883/On_side_hip_raises_qkwdg0.gif',
            exerciseText: S.of(context).Lateral_hip_raises,
            setText: S.of(context).Duration,
            durationText: S.of(context).three_rep_30s,
            subtitleText: S.of(context).Lateral_hip_raises_description,
            videoUrl:
                'https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/Your body/On side hip raises',
            semanticLabel:
                'Упражнение Боковые подъемы бедер. Подъем верхней ноги, лежа на боку. Длительность: 3 повторения по 30 секунд.',
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
