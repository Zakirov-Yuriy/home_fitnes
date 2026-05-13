import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  /// Вход через Email и пароль
  static Future<UserCredential?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print('Ошибка входа: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  /// Регистрация через Email и пароль
  static Future<UserCredential?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print('Ошибка регистрации: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  /// Вход через Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Попробуем выйти, если пользователь уже авторизирован
      await _googleSignIn.signOut();

      // Запускаем диалог выбора аккаунта
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('Пользователь отменил вход через Google');
        return null;
      }

      // Получаем учетные данные
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Создаем credential для Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Входим в Firebase
      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print('Ошибка Google входа: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Неизвестная ошибка: $e');
      rethrow;
    }
  }

  /// Отправить ссылку для восстановления пароля
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      print('Ошибка отправки письма: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  /// Выход из приложения
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Ошибка выхода: $e');
      rethrow;
    }
  }

  /// Получить текущего пользователя
  static User? get currentUser => _firebaseAuth.currentUser;

  /// Поток изменений состояния пользователя
  static Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();
}
