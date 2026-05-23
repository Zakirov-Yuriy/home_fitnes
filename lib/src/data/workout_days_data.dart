import '../models/workout_models.dart';

class WorkoutDaysData {
  static const _heroImg =
      'assets/images/training_image/workout_image/legs_and_thighs/Legs and thighs.jpg';

  // Пути к существующим гифкам (потом заменим на правильные по упражнениям)
  static const _exImg1 =
      'assets/images/training_image/workout_image/legs_and_thighs/Wall squats.gif';
  static const _exImg2 =
      'assets/images/training_image/workout_image/legs_and_thighs/Kettlebell goblet squat.gif';
  static const _exImg3 =
      'assets/images/training_image/workout_image/legs_and_thighs/Donkey kicks.gif';
  static const _exImg4 =
      'assets/images/training_image/workout_image/legs_and_thighs/one leg deadlift.gif';
  static const _exImg5 =
      'assets/images/training_image/workout_image/legs_and_thighs/one leg row.gif';
  static const _exImg6 =
      'assets/images/training_image/workout_image/legs_and_thighs/bulgarian split squats.gif';
  static const _exImg7 =
      'assets/images/training_image/workout_image/legs_and_thighs/Dumbbell squat and press.gif';

  /// Получить конфиг дня по номеру.
  /// Сейчас все дни возвращают одинаковый набор упражнений как заглушку.
  static WorkoutDayConfig getDay(int dayNumber) {
    final metrics = _metricsForDay(dayNumber);

    return WorkoutDayConfig(
      dayNumber: dayNumber,
      heroImagePath: _heroImg,
      workoutMinutes: metrics.workMin,
      restMinutes: metrics.restMin,
      kcal: metrics.kcal,
      focusArea: 'Ноги',
      exercises: const [
        // СТАЛО:
        Exercise(
          name: 'Приседания',
          imagePath: _exImg1,
          targetMuscles: const [
            'Ягодичные',
            'Четырехглавые',
            'Задние Мышцы Бедра',
            'Икроножные',
          ],
          anatomyImagePath: 'assets/images/anatomy/squat.svg',
        ),
        Exercise(name: 'Вприсядку', imagePath: _exImg2),
        Exercise(name: 'Захлест Голени', imagePath: _exImg3),
        Exercise(
          name: 'Подъем На Носки С Разворотом Ступней Внутрь',
          imagePath: _exImg4,
        ),
        Exercise(name: 'Подъемы На Носки У Стены', imagePath: _exImg1),
        Exercise(
          name: 'Поза Сумоиста/Отведение Ноги В Сторону',
          imagePath: _exImg5,
        ),
        Exercise(name: 'Прыжки-Приседания', imagePath: _exImg6),
        Exercise(name: 'Подъемы Ног Лежа На Животе', imagePath: _exImg7),
      ],
    );
  }

  static ({int workMin, int restMin, int kcal}) _metricsForDay(int day) {
    if (day <= 4) return (workMin: 5, restMin: 1, kcal: 69);
    if (day <= 10) return (workMin: 6, restMin: 1, kcal: 80);
    if (day <= 12) return (workMin: 7, restMin: 1, kcal: 91);
    if (day <= 18) return (workMin: 8, restMin: 1, kcal: 112);
    if (day <= 25) return (workMin: 8, restMin: 2, kcal: 126);
    return (workMin: 9, restMin: 2, kcal: 144);
  }
}
