import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import '../models/workout_models.dart';
import '../theme/app_colors.dart';

/// Открыть bottom sheet с деталями упражнения.
/// [exercises] — весь список дня (для листания стрелками 1/N).
/// [initialIndex] — на каком упражнении открыться.
Future<void> showExerciseDetailsSheet(
  BuildContext context, {
  required List<Exercise> exercises,
  required int initialIndex,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(.55),
    builder: (_) =>
        ExerciseDetailsSheet(exercises: exercises, initialIndex: initialIndex),
  );
}

class ExerciseDetailsSheet extends StatefulWidget {
  final List<Exercise> exercises;
  final int initialIndex;
  const ExerciseDetailsSheet({
    super.key,
    required this.exercises,
    required this.initialIndex,
  });

  @override
  State<ExerciseDetailsSheet> createState() => _ExerciseDetailsSheetState();
}

class _ExerciseDetailsSheetState extends State<ExerciseDetailsSheet> {
  late int _index;
  bool _isHowToTab = false; // false = «Видео», true = «Как делать»

  // Временная заглушка для описания, пока нет данных в БД
  static const String _defaultDescription =
      'Ноги на ширине плеч, руки вытянуты перед собой. Опускайтесь до тех пор, пока бедра не будут параллельны полу.\n\nПри выполнении упражнения колени должны быть направлены туда же, куда направлены носки ног. Вернитесь в исходное положение.\n\nПовторите нужное количество раз. Упражнение нагружает мышцы передней и задней поверхности бедра, ягодицы, нижней части корпуса.';

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.exercises.length - 1);
  }

  Exercise get _current => widget.exercises[_index];
  bool get _hasPrev => _index > 0;
  bool get _hasNext => _index < widget.exercises.length - 1;

  void _prev() {
    if (_hasPrev) setState(() => _index--);
  }

  void _next() {
    if (_hasNext) setState(() => _index++);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      height: size.height * 0.92,
      decoration: const BoxDecoration(
        color: Color(0xFF161D25),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textMuted,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Заголовок упражнения + карандаш
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _current.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: AppColors.textSecondary,
                  size: 22,
                ),
              ],
            ),
          ),
          // Скроллируемая часть
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Превью (видео или туториал)
                  AspectRatio(
                    aspectRatio: 16 / 13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _MediaPreview(
                        exercise: _current,
                        isHowTo: _isHowToTab,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Переключатель табов
                  Center(
                    child: _TabSwitcher(
                      isHowTo: _isHowToTab,
                      onChange: (v) => setState(() => _isHowToTab = v),
                    ),
                  ),
                  const SizedBox(height: 22),
                  // ИНСТРУКЦИИ
                  const Text(
                    'ИНСТРУКЦИИ',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _current.description ?? _defaultDescription,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // ─── ОБЛАСТЬ ВНИМАНИЯ ──────────────────────────────────────
                  if (_current.targetMuscles.isNotEmpty) ...[
                    const Text(
                      'ОБЛАСТЬ ВНИМАНИЯ',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _current.targetMuscles
                          .map((m) => _MuscleChip(name: m))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                  // ─── АНАТОМИЯ ──────────────────────────────────────────────
                  if (_current.anatomyImagePath != null) ...[
                    Center(
                      child: SizedBox(
                        height: 280,
                        child: _current.anatomyImagePath!.endsWith('.svg')
                            ? SvgPicture.asset(
                                _current.anatomyImagePath!,
                                fit: BoxFit.contain,
                                placeholderBuilder: (_) => const Icon(
                                  Icons.accessibility_new_rounded,
                                  size: 80,
                                  color: AppColors.textMuted,
                                ),
                              )
                            : Image(
                                image: _current.anatomyImagePath!.startsWith('http')
                                    ? NetworkImage(_current.anatomyImagePath!)
                                    : AssetImage(_current.anatomyImagePath!)
                                          as ImageProvider,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.accessibility_new_rounded,
                                    size: 80,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 22),
                  ],
                  // Пагинация ◀ 1/8 ▶
                  _Pagination(
                    current: _index + 1,
                    total: widget.exercises.length,
                    onPrev: _hasPrev ? _prev : null,
                    onNext: _hasNext ? _next : null,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          // Кнопка ЗАКРЫТЬ — фиксирована снизу
          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              8,
              20,
              bottomInset > 0 ? bottomInset : 16,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.accent, AppColors.accentLight],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(.35),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'ЗАКРЫТЬ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// Внутренние виджеты
// ════════════════════════════════════════════════════════════════════════

class _MediaPreview extends StatelessWidget {
  final Exercise exercise;
  final bool isHowTo;
  const _MediaPreview({required this.exercise, required this.isHowTo});

  @override
  Widget build(BuildContext context) {
    // «Как делать» → tutorialImagePath, «Видео» → gifUrl, иначе fallback на imagePath
    final path = isHowTo
        ? (exercise.tutorialImagePath ?? exercise.imagePath)
        : (exercise.gifUrl ?? exercise.imagePath);
    final isNetwork = path.startsWith('http');

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Image(
        image: isNetwork
            ? NetworkImage(path)
            : AssetImage(path) as ImageProvider,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.cardSoft,
          alignment: Alignment.center,
          child: const Icon(
            Icons.fitness_center,
            color: AppColors.textMuted,
            size: 32,
          ),
        ),
      ),
    );
  }
}

class _TabSwitcher extends StatelessWidget {
  final bool isHowTo;
  final ValueChanged<bool> onChange;
  const _TabSwitcher({required this.isHowTo, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.bg.withOpacity(.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tab('Видео', !isHowTo, () => onChange(false)),
          _tab('Как делать', isHowTo, () => onChange(true)),
        ],
      ),
    );
  }

  Widget _tab(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : AppColors.textSecondary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  final int current;
  final int total;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  const _Pagination({
    required this.current,
    required this.total,
    this.onPrev,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _navIcon(Icons.skip_previous_rounded, onPrev),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$current',
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              ' / $total',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        _navIcon(Icons.skip_next_rounded, onNext),
      ],
    );
  }



  Widget _navIcon(IconData icon, VoidCallback? onTap) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 32,
        color: enabled ? AppColors.textPrimary : AppColors.textMuted,
      ),
    );
  }
}

class _MuscleChip extends StatelessWidget {
  final String name;
  const _MuscleChip({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 27, 28, 32).withOpacity(.55),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10, height: 10,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
