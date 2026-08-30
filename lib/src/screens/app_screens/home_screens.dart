import 'package:flutter/material.dart';
import 'dart:ui';
import '../../data/workout_days_data.dart';
import '../../theme/app_colors.dart';
import '../../../services/cloudinary_service.dart';
import 'workout_day_screen.dart';

/// Цветовая палитра нового UI
class AppColors {
  static const bg            = Color(0xFF161D25);
  static const card          = Color(0xFF173140);
  static const cardSoft      = Color(0xFF1E3A4A);
  static const accent        = Color(0xFF1FD89A);   // основной зелёный
  static const accentLight   = Color(0xFF5EE5A0);   // светлый для градиента кнопки
  static const accentDark    = Color(0xFF12B883);
  static const textPrimary   = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF8FA3B0);
  static const textMuted     = Color(0xFF5D7280);
  static const fireInactive  = Color(0xFF3E5260);
  static const lineDots      = Color(0xFF3E5260);
  static const promoBg       = Color(0xFFFAF1E2);
  static const promoText     = Color(0xFFE85A2A);
}

/// Описание этапа программы
class _Stage {
  final int number;
  final String title;
  final int days;
  final int startDay;
  const _Stage({
    required this.number,
    required this.title,
    required this.days,
    required this.startDay,
  });
  int get endDay => startDay + days - 1;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ─── состояние программы ────────────────────────────────────────────────
  // (потом подключим к Firebase / провайдеру)
  int _currentDay = 1;                  // активный день
  final Set<int> _completedDays = {};   // завершённые дни
  int _navIndex = 0;                    // выбранный таб

  // Этапы программы (4 этапа, 28 дней суммарно)
  static const List<_Stage> _stages = [
    _Stage(number: 1, title: 'Быстрая активация', days: 4,  startDay: 1),
    _Stage(number: 2, title: 'Контроль корпуса',  days: 6,  startDay: 5),
    _Stage(number: 3, title: 'Улучшить осанку',   days: 8,  startDay: 11),
    _Stage(number: 4, title: 'Форма и энергия',   days: 10, startDay: 19),
  ];

  // Тестовая Cloudinary картинка (потом подменим на массив из конфигов дня)
  static const String _placeholderImage = CloudinaryService.testImageUrl;

  // ScrollController для FAB «Назад ко дню N»
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _activeDayKey = GlobalKey();
  bool _showBackFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final ctx = _activeDayKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    final position = box.localToGlobal(Offset.zero).dy;
    final size = MediaQuery.of(context).size;
    // FAB показываем, если активный день не в зоне видимости
    final visible = position > 80 && position < size.height - 200;
    if (visible == _showBackFab) {
      setState(() => _showBackFab = !visible);
    }
  }

  // ─── метрики дня (мин/ккал) по скриншотам ───────────────────────────────
  ({int minutes, int kcal}) _dayMetrics(int day) {
    if (day <= 4)  return (minutes: 5, kcal: 69);
    if (day <= 10) return (minutes: 6, kcal: 80);
    if (day <= 12) return (minutes: 7, kcal: 91);
    if (day <= 18) return (minutes: 8, kcal: 112);
    if (day <= 25) return (minutes: 8, kcal: 126);
    return (minutes: 9, kcal: 144);
  }

  void _scrollToActiveDay() {
    final ctx = _activeDayKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.3,
    );
  }

  // void _onStartPressed() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => const LegsAndThighsWorkoutScreen(),
  //     ),
  //   );
  // }

  void _onStartPressed() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => WorkoutDayScreen(
        config: WorkoutDaysData.getDay(_currentDay),
      ),
    ),
  );
}

  // ═══════════════════════════════════════════════════════════════════════
  // BUILD
  // ═══════════════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 180),
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                _buildFilterChips(),
                const SizedBox(height: 20),
                if (_currentDay > 1) ...[
                  _buildPromoBanner(),
                  const SizedBox(height: 16),
                ],
                for (final stage in _stages) _buildStageSection(stage),
              ],
            ),
            // FAB «Назад ко дню N»
            Positioned(
              left: 0, right: 0, bottom: 96,
              child: AnimatedOpacity(
                opacity: _showBackFab ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(
                  ignoring: !_showBackFab,
                  child: Center(child: _buildBackToDayFab()),
                ),
              ),
            ),
            // Bottom navigation
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: _buildBottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  // ─── HEADER ─────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Text(
              'НИЖНЯЯ ЧАСТЬ ТЕЛА\nБЫТЬ В ФОРМЕ',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                height: 1.15,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Container(
            width: 44, height: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                // child: Container(
                //   width: 44,
                //   height: 44,
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(0.1),
                //     shape: BoxShape.circle,
                //   ),
                //   alignment: Alignment.center,
                //   child: const Icon(Icons.tune_rounded,
                //       color: AppColors.textSecondary, size: 22),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── FILTER CHIPS ───────────────────────────────────────────────────────
  Widget _buildFilterChips() {
    const items = ['Щадит Плечи', 'Щадит Запястья', 'Улучшить Осанку'];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) => _FilterChip(label: items[i]),
      ),
    );
  }

  // ─── PROMO BANNER ───────────────────────────────────────────────────────
  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.promoBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Text('🎁', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('-57%',
                  style: TextStyle(
                    color: AppColors.promoText,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  )),
              Text('Акция Для Новичков',
                  style: TextStyle(
                    color: Color(0xFF6B5A40),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  // ─── STAGE SECTION ──────────────────────────────────────────────────────
  Widget _buildStageSection(_Stage stage) {
    final completedInStage = _completedDays
        .where((d) => d >= stage.startDay && d <= stage.endDay)
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Этап ${stage.number}',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                    Text(stage.title,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
              _StageFires(active: completedInStage > 0 ? stage.number : 0),
              const SizedBox(width: 8),
              Text('$completedInStage/${stage.days}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  )),
            ],
          ),
        ),
        for (int day = stage.startDay; day <= stage.endDay; day++)
          _buildDayRow(day),
      ],
    );
  }

  // ─── DAY ROW (точка таймлайна + карточка) ───────────────────────────────
  Widget _buildDayRow(int day) {
  final isActive = day == _currentDay;
  final isCompleted = _completedDays.contains(day);
  final prevCompleted = _completedDays.contains(day - 1);
  final isFirst = day == _stages.first.startDay;
  final isLast  = day == _stages.last.endDay;

  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 64,
          child: _TimelineDot(
            isActive: isActive,
            isCompleted: isCompleted,
            prevCompleted: prevCompleted,
            isFirst: isFirst,
            isLast: isLast,
          ),
        ),
          // Карточка
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 12),
              child: isActive
                  ? Container(
                      key: _activeDayKey,
                      child: _ActiveDayCard(
                        day: day,
                        imagePath: _placeholderImage,
                        metrics: _dayMetrics(day),
                        onStart: _onStartPressed,
                      ),
                    )
                  : _DayCard(
                      day: day,
                      imagePath: _placeholderImage,
                      metrics: _dayMetrics(day),
                      isCompleted: isCompleted,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── BACK TO DAY FAB ────────────────────────────────────────────────────
  Widget _buildBackToDayFab() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: _scrollToActiveDay,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentLight],
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(.35),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_upward_rounded,
                  color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text('Назад ко дню $_currentDay',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // ─── BOTTOM NAVIGATION ──────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 50),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.view_list_rounded,
                  label: 'Мой План',
                  active: _navIndex == 0,
                  onTap: () => setState(() => _navIndex = 0),
                ),
                _NavItem(
                  customIcon: _NumberBadge(text: '30', active: _navIndex == 1),
                  label: 'Тренировки',
                  active: _navIndex == 1,
                  onTap: () => setState(() => _navIndex = 1),
                ),
                _NavItem(
                  icon: Icons.bar_chart_rounded,
                  label: 'Записи',
                  active: _navIndex == 2,
                  onTap: () => setState(() => _navIndex = 2),
                ),
                _NavItem(
                  icon: Icons.person_rounded,
                  label: 'Я',
                  active: _navIndex == 3,
                  onTap: () => setState(() => _navIndex = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// ВСПОМОГАТЕЛЬНЫЕ ВИДЖЕТЫ
// ════════════════════════════════════════════════════════════════════════

/// Чип-фильтр с зелёной обводкой
class _FilterChip extends StatelessWidget {
  final String label;
  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent, width: 1.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.accent,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// 4 огонька-индикатора у заголовка этапа
class _StageFires extends StatelessWidget {
  /// сколько огоньков «горят» зелёным (0..4)
  final int active;
  const _StageFires({required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (i) {
        final on = i < active;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Icon(
            Icons.local_fire_department_rounded,
            size: 18,
            color: on ? AppColors.accent : AppColors.fireInactive,
          ),
        );
      }),
    );
  }
}

/// Точка на таймлайне слева + вертикальная пунктирная линия
class _TimelineDot extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;
  final bool prevCompleted;   // ← новое: завершён ли предыдущий день
  final bool isFirst;
  final bool isLast;
  const _TimelineDot({
    required this.isActive,
    required this.isCompleted,
    this.prevCompleted = false,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor =
        (isActive || isCompleted) ? AppColors.accent : AppColors.lineDots;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _DottedLinePainter(
              // Сегмент сверху = соединяет предыдущую точку с текущей.
              // Зелёный, если предыдущая точка завершена.
              colorAbove: prevCompleted ? AppColors.accent : AppColors.lineDots,
              // Сегмент снизу = соединяет текущую точку со следующей.
              // Зелёный, если текущая точка завершена.
              colorBelow: isCompleted ? AppColors.accent : AppColors.lineDots,
              drawAbove: !isFirst,
              drawBelow: !isLast,
            ),
          ),
        ),
        Container(
          width: 16, height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.accent : Colors.transparent,
            border: Border.all(color: dotColor, width: 2),
          ),
        ),
      ],
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color colorAbove;
  final Color colorBelow;
  final double dotRadius;
  final bool drawAbove;
  final bool drawBelow;

  _DottedLinePainter({
    required this.colorAbove,
    required this.colorBelow,
    this.dotRadius = 10,
    this.drawAbove = true,
    this.drawBelow = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 3.0;
    const dashSpace = 4.0;
    final cx = size.width / 2;
    final cy = size.height / 2;

    if (drawAbove) {
      final paint = Paint()..color = colorAbove..strokeWidth = 2;
      final topEnd = cy - dotRadius;
      double y = 0;
      while (y < topEnd) {
        final endY = (y + dashHeight) > topEnd ? topEnd : (y + dashHeight);
        canvas.drawLine(Offset(cx, y), Offset(cx, endY), paint);
        y += dashHeight + dashSpace;
      }
    }

    if (drawBelow) {
      final paint = Paint()..color = colorBelow..strokeWidth = 2;
      double y = cy + dotRadius;
      while (y < size.height) {
        final endY = (y + dashHeight) > size.height ? size.height : (y + dashHeight);
        canvas.drawLine(Offset(cx, y), Offset(cx, endY), paint);
        y += dashHeight + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DottedLinePainter old) =>
      old.colorAbove != colorAbove ||
      old.colorBelow != colorBelow ||
      old.dotRadius != dotRadius ||
      old.drawAbove != drawAbove ||
      old.drawBelow != drawBelow;
}

/// Обычная карточка дня (компактная)
class _DayCard extends StatelessWidget {
  final int day;
  final String imagePath;
  final ({int minutes, int kcal}) metrics;
  final bool isCompleted;

  const _DayCard({
    required this.day,
    required this.imagePath,
    required this.metrics,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F262E),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // картинка
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: _SafeImage(
                  imagePath: imagePath,
                  width: 110, height: 80,
                ),
              ),
              if (isCompleted)
                const Positioned.fill(
                  child: Center(child: _CompletedBadge()),
                ),
            ],
          ),
          const SizedBox(width: 14),
          // текст
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isCompleted)
                  Row(
                    children: const [
                      Icon(Icons.check, color: AppColors.textSecondary, size: 16),
                      SizedBox(width: 4),
                      Text('Закончить',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          )),
                    ],
                  ),
                Text('День $day',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 2),
                Text('${metrics.minutes} мин. | ${metrics.kcal} ккал',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Активная карточка дня (раскрытая, с фото на всю ширину и кнопкой НАЧАТЬ)
class _ActiveDayCard extends StatelessWidget {
  final int day;
  final String imagePath;
  final ({int minutes, int kcal}) metrics;
  final VoidCallback onStart;

  const _ActiveDayCard({
    required this.day,
    required this.imagePath,
    required this.metrics,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F262E),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: _SafeImage(imagePath: imagePath, height: 160),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('День $day',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('${metrics.minutes} мин. | ${metrics.kcal} ккал',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _PulsingStartButton(onTap: onStart),
        ],
      ),
    );
  }
}

/// Бейдж «выполнено» — зелёная звезда с галочкой
class _CompletedBadge extends StatelessWidget {
  const _CompletedBadge();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44, height: 44,
      decoration: BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 26),
    );
  }
}

/// Безопасный Image — сам выбирает между AssetImage и NetworkImage
class _SafeImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  const _SafeImage({required this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final isNetwork = imagePath.startsWith('http');
    return Image(
      image: isNetwork
          ? NetworkImage(imagePath)
          : AssetImage(imagePath) as ImageProvider,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        width: width, height: height,
        color: AppColors.cardSoft,
        alignment: Alignment.center,
        child: const Icon(Icons.fitness_center, color: AppColors.textMuted),
      ),
    );
  }
}

/// Элемент нижней навигации
class _NavItem extends StatelessWidget {
  final IconData? icon;
  final Widget? customIcon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    this.icon,
    this.customIcon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (customIcon != null)
          customIcon!
        else
          Icon(icon,
              size: 20,
              color: active ? AppColors.accent : AppColors.textSecondary),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              color: active ? AppColors.accent : AppColors.textSecondary,
            )),
      ],
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: active
          ? ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: content,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: content,
            ),
    );
  }
}

/// Иконка-цифра «30» для таба «Тренировки»
class _NumberBadge extends StatelessWidget {
  final String text;
  final bool active;
  const _NumberBadge({required this.text, required this.active});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: active ? AppColors.accent : AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ));
  }
}

/// Пульсирующая кнопка "НАЧАТЬ" с эффектом масштабирования
class _PulsingStartButton extends StatefulWidget {
  final VoidCallback onTap;
  const _PulsingStartButton({required this.onTap});

  @override
  State<_PulsingStartButton> createState() => _PulsingStartButtonState();
}

class _PulsingStartButtonState extends State<_PulsingStartButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentLight],
            ),
            borderRadius: BorderRadius.circular(28),
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
            'НАЧАТЬ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}