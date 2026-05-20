/// Сервис для работы с Cloudinary CDN
/// Облегчает преобразование Firebase Storage URL в Cloudinary URL
class CloudinaryService {
  static const String cloudName = 'dccyuxqzj';
  static const String baseUrl = 'https://res.cloudinary.com/$cloudName';

  /// Генерирует URL для видео в Cloudinary
  /// Параметры качества и оптимизации применяются автоматически
  static String getVideoUrl(String publicId, {
    String quality = 'auto',
    String format = 'auto',
  }) {
    return '$baseUrl/video/upload/f_$format,q_$quality/$publicId';
  }

  /// Генерирует URL для изображения в Cloudinary
  static String getImageUrl(String publicId, {
    String quality = 'auto',
    String format = 'auto',
  }) {
    return '$baseUrl/image/upload/f_$format,q_$quality/$publicId';
  }

  /// Специализированный метод для изображений тренировок
  /// Пример: getTrainingImageUrl('your_body', 'boxing jabs.gif')
  static String getTrainingImageUrl(String folder, String filename) {
    return getImageUrl('video/$folder/$filename');
  }

  /// Преобразует путь Firebase Storage в public_id Cloudinary
  /// Пример: "video/melts_fat/Bent over row.mp4" -> "video/melts_fat/Bent over row"
  static String getPublicIdFromPath(String path) {
    // Удаляем расширение файла
    return path.replaceAll(RegExp(r'\.[^.]+$'), '');
  }

  /// Преобразует URL Firebase Storage в Cloudinary URL
  /// Работает, если public_id построен из пути в Firebase Storage
  static String convertFromFirebaseUrl(String firebaseUrl, {bool isVideo = true}) {
    // Извлекаем путь из Firebase Storage URL
    // Формат: https://firebasestorage.googleapis.com/v0/b/{bucket}/o/{path}?alt=media&token={token}
    try {
      final uri = Uri.parse(firebaseUrl);
      final encodedPath = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
      
      // Декодируем путь
      final decodedPath = Uri.decodeComponent(encodedPath);
      
      // Получаем public_id
      final publicId = getPublicIdFromPath(decodedPath);
      
      // Возвращаем Cloudinary URL
      return isVideo 
          ? getVideoUrl(publicId)
          : getImageUrl(publicId);
    } catch (e) {
      // Если что-то пошло не так, возвращаем оригинальный URL
      return firebaseUrl;
    }
  }
}
