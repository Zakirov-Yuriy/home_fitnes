// Документация: Интеграция Cloudinary вместо Firebase Storage

/*
## ✅ Что было сделано

Все Firebase Storage URL заменены на Cloudinary URL. Приложение теперь готово использовать
более экономный вариант хранения видео через Cloudinary вместо платного Firebase Storage.

Cloud Name: dccyuxqzj
Базовый URL: https://res.cloudinary.com/dccyuxqzj

## 📂 Структура папок на Cloudinary

Вам нужно создать на Cloudinary следующую структуру папок (matching Firebase):

video/
├── melts_fat/
├── Your body/
├── glutes and legs/
├── belly fat burner/
├── Bigger booty/
├── tight_toned_arms/
├── trim butt and legs/
├── Legs and thighs/
└── Face_exercises/

## 📤 Как загрузить видео на Cloudinary

### Способ 1: Веб-интерфейс (Простой)
1. Откройте https://cloudinary.com/console
2. Перейдите в Media Library (слева)
3. Создайте папки согласно структуре выше
4. Загрузите видео в соответствующие папки

### Способ 2: API (Автоматизированный)
```dart
// Можно расширить CloudinaryService для загрузки файлов
// Это потребует:
// - flutter_dotenv для хранения API_KEY и API_SECRET
// - http пакет для PUT запросов на Cloudinary API
// - файловый пикер для выбора видео
```

### Способ 3: Cloudinary CLI
```bash
npm install -g cloudinary-cli
cloudinary auth set <cloud_name> <api_key> <api_secret>
cloudinary upload -r video/ <path_to_videos>
```

## 🎬 Примеры URL после миграции

Firebase Storage старый формат:
https://firebasestorage.googleapis.com/v0/b/fitnes-live-db.appspot.com/o/video%2Fmelts_fat%2FRenegade%20rows.mp4?alt=media&token=xxx

Cloudinary новый формат:
https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Renegade rows

## 💰 Экономия

Firebase Storage: 0.18 USD за 1 GB в месяц
Cloudinary Free Plan: 25 GB пропускной способности/месяц + 10 GB хранилища

Для нашего приложения (видео тренировок) это огромная экономия!

## 🔧 Использование CloudinaryService в коде

Сервис находится в: lib/services/cloudinary_service.dart

```dart
// Получить URL видео
String videoUrl = CloudinaryService.getVideoUrl('video/melts_fat/Renegade rows');
// Result: https://res.cloudinary.com/dccyuxqzj/video/upload/f_auto,q_auto/video/melts_fat/Renegade rows

// Преобразовать Firebase URL в Cloudinary
String cloudinaryUrl = CloudinaryService.convertFromFirebaseUrl(firebaseUrl, isVideo: true);
```

## ✨ Дополнительные возможности Cloudinary

После загрузки видео вы можете использовать трансформации:

```
f_auto,q_auto    - Автоматическая оптимизация формата и качества
w_640            - Изменить ширину
h_480            - Изменить высоту
g_auto           - Умный кроп
fl_progressive   - Progressive JPEG (для изображений)
```

Пример с трансформациями:
https://res.cloudinary.com/dccyuxqzj/video/upload/q_80,w_800/video/melts_fat/Renegade rows

## 📋 Чек-лист

- [ ] Загрузить все видео на Cloudinary в правильную структуру папок
- [ ] Проверить работу загрузки видео в приложении
- [ ] Удалить старые видео из Firebase Storage (опционально)
- [ ] Мониторить использование Cloudinary bandwidth

## 🚀 Что дальше?

1. Загрузите видео на Cloudinary
2. Тестируйте приложение
3. При необходимости можно добавить функционал загрузки видео прямо из приложения

*/
