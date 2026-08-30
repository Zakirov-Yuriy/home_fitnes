import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/workout_models.dart';
import '../../theme/app_colors.dart';
import '../../../services/cloudinary_service.dart';
import '../../widgets/exercise_details_sheet.dart';

class WorkoutDayScreen extends StatefulWidget {
  final WorkoutDayConfig config;
  const WorkoutDayScreen({super.key, required this.config});

  @override
  State<WorkoutDayScreen> createState() => _WorkoutDayScreenState();
}

class _WorkoutDayScreenState extends State<WorkoutDayScreen>
    with TickerProviderStateMixin {
  static const double _heroHeight = 360;

  final ScrollController _scrollController = ScrollController();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _isHeaderCompact = false;
  bool _showFloatingButton = false;
  bool _isFavorite = false;
  bool _warmupEnabled = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final compact = offset > (_heroHeight - kToolbarHeight - 40);
    final showFloat = offset > _heroHeight + 80;

    if (compact != _isHeaderCompact || showFloat != _showFloatingButton) {
      setState(() {
        _isHeaderCompact = compact;
        _showFloatingButton = showFloat;
      });
    }
  }

  void _onStartPressed() {
    // TODO: подключить экран выполнения упражнений
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Начало тренировки — следующий экран'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bg,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              _buildSliverAppBar(),
              SliverToBoxAdapter(child: _buildInfoSection()),
              _buildExerciseList(),
              SliverToBoxAdapter(child: SizedBox(height: 100 + bottomInset)),
            ],
          ),
          // Floating-кнопка «Начать» — появляется при скролле
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            left: 16,
            right: 16,
            bottom: _showFloatingButton ? 16 + bottomInset : -80,
            child: _buildStartButton(),
          ),
          // Фиксированные кнопки (стрелка назад и сердечко)
          Positioned(
            top: topInset + 6,
            left: 12,
            right: 12,
            child: Row(
              children: [
                _CircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                _CircleButton(
                  icon: _isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  iconColor: _isFavorite ? AppColors.accent : Colors.white,
                  onTap: () => setState(() => _isFavorite = !_isFavorite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── SLIVER APP BAR (hero + collapsing header) ──────────────────────────
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: false,
      stretch: true,
      expandedHeight: _heroHeight,
      backgroundColor: AppColors.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        // TEST: тестовая Cloudinary картинка вместо widget.config.heroImagePath
        background: const _SafeImage(imagePath: CloudinaryService.testImageUrl),
      ),
    );
  }

  // ─── ИНФО-БЛОК (заголовок, статы, кнопка, настройки) ────────────────────
  Widget _buildInfoSection() {
    final cfg = widget.config;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок + tune
          Row(
            children: [
              Expanded(
                child: Text(
                  'ДЕНЬ ${cfg.dayNumber}',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // Container(
              //   width: 40, height: 40,
              //   // decoration: BoxDecoration(
              //   //   color: AppColors.card,
              //   //   borderRadius: BorderRadius.circular(12),
              //   // ),
              //   child: const Icon(Icons.tune_rounded,
              //       color: AppColors.textSecondary, size: 25),
              // ),
            ],
          ),
          const SizedBox(height: 12),
          // Статистика
          Row(
            children: [
              const Icon(Icons.timer_outlined,
                  color: Color(0xFF79818E), size: 22),
              const SizedBox(width: 6),
              Text(
                _warmupEnabled
                    ? '${cfg.workoutMinutes} + ${cfg.restMinutes} мин.'
                    : '${cfg.workoutMinutes} мин.',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 28),
              const Icon(Icons.local_fire_department_rounded,
                  color: Color(0xFF79818E), size: 22),
              const SizedBox(width: 6),
              Text(
                '${cfg.kcal} ккал',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildStartButton(),
          const SizedBox(height: 28),
          // Область внимания
          _SettingRow(
            title: 'Область внимания',
            trailing: Container(
              padding: const EdgeInsets.fromLTRB(6, 6, 14, 6),
              decoration: BoxDecoration(
                color: const Color(0xFF3C3F48),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48, height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF475459),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/anatomy/squat3.svg',
                      width: 56,
                      height: 56,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cfg.focusArea,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Разминка
          _SettingRow(
            title: 'Разминка',
            trailing: Switch(
              value: _warmupEnabled,
              onChanged: (v) => setState(() => _warmupEnabled = v),
              activeColor: Colors.white,
              activeTrackColor: AppColors.accent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: AppColors.cardSoft,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
          const SizedBox(height: 20),
          // Упражнения (N) + edit
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Упражнения ',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '(${cfg.exercises.length})',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.edit_outlined,
                  color: AppColors.textSecondary, size: 20),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ─── СПИСОК УПРАЖНЕНИЙ ──────────────────────────────────────────────────
  Widget _buildExerciseList() {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _ExerciseRow(
          exercise: widget.config.exercises[index],
          onTap: () => showExerciseDetailsSheet(
            context,
            exercises: widget.config.exercises,
            initialIndex: index,
          ),
        ),
        childCount: widget.config.exercises.length,
      ),
    ),
  );
}

  // ─── КНОПКА «НАЧАТЬ» ────────────────────────────────────────────────────
  Widget _buildStartButton() {
    return ScaleTransition(
      scale: _pulseAnimation,
      child: GestureDetector(
        onTap: _onStartPressed,
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentLight],
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(.35),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Text(
            'Начать',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════════
// Вспомогательные виджеты
// ════════════════════════════════════════════════════════════════════════

class _SettingRow extends StatelessWidget {
  final String title;
  final Widget trailing;
  const _SettingRow({required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;
  const _ExerciseRow({required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final m = exercise.durationSeconds ~/ 60;
    final s = exercise.durationSeconds % 60;
    final duration =
        '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  color: Colors.white,
                  // Постер (стоп-кадр) из видео упражнения. Если у упражнения
                  // ещё нет своего видео — fallback на тестовое.
                  child: _SafeImage(
                    imagePath: exercise.videoUrl != null
                        ? CloudinaryService.getVideoThumbnailFromUrl(
                            exercise.videoUrl!,
                          )
                        : CloudinaryService.testVideoThumbnailUrl,
                    width: 76,
                    height: 76,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;
  const _CircleButton({
    required this.icon,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor ?? Colors.white, size: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class _SafeImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  const _SafeImage({
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final isNetwork = imagePath.startsWith('http');
    return Image(
      image: isNetwork
          ? NetworkImage(imagePath)
          : AssetImage(imagePath) as ImageProvider,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColors.cardSoft,
        alignment: Alignment.center,
        child: const Icon(Icons.fitness_center, color: AppColors.textMuted),
      ),
    );
  }
}