/// Одно упражнение в дне тренировки
class Exercise {
  final String name;
  final String imagePath;
  final int durationSeconds;
  final String? gifUrl;
  final String? tutorialImagePath;
  final String? description;
  final List<String> targetMuscles;     // <- НОВОЕ: группы мышц для чипов
  final String? anatomyImagePath;       // <- НОВОЕ: схема анатомии

  const Exercise({
    required this.name,
    required this.imagePath,
    this.durationSeconds = 30,
    this.gifUrl,
    this.tutorialImagePath,
    this.description,
    this.targetMuscles = const [],
    this.anatomyImagePath,
  });
}

/// Конфигурация одного дня тренировки
class WorkoutDayConfig {
  final int dayNumber;
  final String heroImagePath; // главная картинка сверху
  final int workoutMinutes; // активное время (мин)
  final int restMinutes; // отдых (мин), для строки "5+1 мин."
  final int kcal; // ккал
  final String focusArea; // "Ноги", "Пресс" и т.п.
  final List<Exercise> exercises;

  const WorkoutDayConfig({
    required this.dayNumber,
    required this.heroImagePath,
    required this.workoutMinutes,
    required this.restMinutes,
    required this.kcal,
    required this.focusArea,
    required this.exercises,
  });
}
