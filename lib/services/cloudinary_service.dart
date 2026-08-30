/// Сервис для работы с Cloudinary CDN
/// Облегчает преобразование Firebase Storage URL в Cloudinary URL
class CloudinaryService {
  static const String cloudName = 'dccyuxqzj';
  static const String baseUrl = 'https://res.cloudinary.com/$cloudName';

  // ─────────────────────────────────────────────────────────────────────
  // ТЕСТОВЫЕ URL (используются для проверки интеграции до загрузки всего
  // контента на Cloudinary). После заливки реальных файлов эти константы
  // можно удалить или поменять на реальные publicId.
  // ─────────────────────────────────────────────────────────────────────

  /// Тестовая картинка (используется как hero для дня и как заглушка карточки).
  static const String testImageUrl =
      '$baseUrl/image/upload/v1779103922/whole_body_krtjwf.png';

  /// Тестовое видео (используется в карточке упражнения вместо gif).
  static const String testVideoUrl =
      '$baseUrl/video/upload/v1779539683/'
      'How_to_Do__REVERSE_CRUNCHES_1080p_online-video-cutter.com_pira3r.mp4';

  /// Постер (первый кадр) из тестового видео — для миниатюр.
  /// Cloudinary позволяет на лету выдернуть кадр из видео:
  /// - меняем расширение .mp4 -> .jpg
  /// - добавляем трансформацию so_0 (start offset = 0 секунд)
  static const String testVideoThumbnailUrl =
      '$baseUrl/video/upload/so_0/v1779539683/'
      'How_to_Do__REVERSE_CRUNCHES_1080p_online-video-cutter.com_pira3r.jpg';

  // ─────────────────────────────────────────────────────────────────────
  // ОБЩИЕ ХЕЛПЕРЫ
  // ─────────────────────────────────────────────────────────────────────

  /// Генерирует URL для видео в Cloudinary
  /// Параметры качества и оптимизации применяются автоматически
  static String getVideoUrl(
    String publicId, {
    String quality = 'auto',
    String format = 'auto',
  }) {
    return '$baseUrl/video/upload/f_$format,q_$quality/$publicId';
  }

  /// Генерирует URL для изображения в Cloudinary
  static String getImageUrl(
    String publicId, {
    String quality = 'auto',
    String format = 'auto',
  }) {
    return '$baseUrl/image/upload/f_$format,q_$quality/$publicId';
  }

  /// Получить постер (стоп-кадр) из видео Cloudinary URL.
  /// Если на вход подать обычное видео-URL Cloudinary, на выходе получим
  /// JPG-картинку первого кадра.
  ///
  /// [startOffsetSec] — секунда, с которой берётся кадр (по умолчанию 0).
  static String getVideoThumbnailFromUrl(
    String videoUrl, {
    int startOffsetSec = 0,
  }) {
    if (!videoUrl.contains('/video/upload/')) return videoUrl;

    // Меняем расширение видео на .jpg
    final withJpg = videoUrl.replaceFirst(
      RegExp(r'\.(mp4|mov|webm|avi|mkv)$', caseSensitive: false),
      '.jpg',
    );

    // Вставляем трансформацию so_X сразу после /video/upload/
    return withJpg.replaceFirst(
      '/video/upload/',
      '/video/upload/so_$startOffsetSec/',
    );
  }

  /// Специализированный метод для изображений тренировок
  /// Пример: getTrainingImageUrl('your_body', 'boxing jabs.gif')
  static String getTrainingImageUrl(String folder, String filename) {
    return getImageUrl('video/$folder/$filename');
  }

  /// Преобразует путь Firebase Storage в public_id Cloudinary
  /// Пример: "video/melts_fat/Bent over row.mp4" -> "video/melts_fat/Bent over row"
  static String getPublicIdFromPath(String path) {
    return path.replaceAll(RegExp(r'\.[^.]+$'), '');
  }

  /// Преобразует URL Firebase Storage в Cloudinary URL
  static String convertFromFirebaseUrl(
    String firebaseUrl, {
    bool isVideo = true,
  }) {
    try {
      final uri = Uri.parse(firebaseUrl);
      final encodedPath = uri.pathSegments.isNotEmpty
          ? uri.pathSegments.last
          : '';
      final decodedPath = Uri.decodeComponent(encodedPath);
      final publicId = getPublicIdFromPath(decodedPath);
      return isVideo ? getVideoUrl(publicId) : getImageUrl(publicId);
    } catch (e) {
      return firebaseUrl;
    }
  }
}