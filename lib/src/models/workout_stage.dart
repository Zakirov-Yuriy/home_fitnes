/// Модель этапа тренировочной программы
class WorkoutStage {
  final int id;
  final String name; // "Этап 1", "Этап 4"
  final String title; // "Быстрая активизация", "Форма и энергия"
  final String description;
  final int totalDays;
  final List<WorkoutDay> days;
  final int completedDays;

  WorkoutStage({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.totalDays,
    required this.days,
    this.completedDays = 0,
  });

  double get progress => completedDays / totalDays;
  bool get isCompleted => completedDays == totalDays;
}

/// Модель дня тренировки
class WorkoutDay {
  final int id;
  final int dayNumber; // 1, 2, 3...
  final String name; // "День 1", "День 27"
  final String imageUrl; // URL или путь до картинки
  final int duration; // в минутах
  final int calories;
  final int difficulty; // 1-4 (активные огоньки)
  final bool isCompleted;
  final List<String> exerciseIds; // ID упражнений для этого дня

  WorkoutDay({
    required this.id,
    required this.dayNumber,
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.calories,
    required this.difficulty,
    this.isCompleted = false,
    this.exerciseIds = const [],
  });
}

/// Модель для кэширования текущего этапа пользователя
class UserStageProgress {
  final int currentStageId;
  final int currentDayId;
  int completedDays;

  UserStageProgress({
    required this.currentStageId,
    required this.currentDayId,
    this.completedDays = 0,
  });
}
