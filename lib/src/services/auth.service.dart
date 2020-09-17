import 'user.service.dart';

import '../models.dart';
import 'preferences.dart';

class AuthService {
  AuthService._();

  static AuthService _instance;

  static AuthService get instance => _instance ??= AuthService._();

  User _currentUser;

  User get currentUser {
    if (_currentUser == null) {
      _currentUser = User.fromJson(Preferences.instance.getCurrentUser());
    }
    return _currentUser;
  }

  bool get isAuth => currentUser != null;

  Future<User> signIn({String email, String password}) async {
    _currentUser = await UserService.instance.find((user) => user.email == email && user.password == password);

    await Preferences.instance.setCurrentUser(_currentUser?.toJson());

    return _currentUser;
  }

  Future<User> signUp({String email, String password, String fullName}) async {
    _currentUser = await UserService.instance.create(User(
      email: email,
      password: password,
      fullName: fullName,
    ));

    await Preferences.instance.setCurrentUser(_currentUser?.toJson());

    return _currentUser;
  }

  Future<void> signOut() async {
    _currentUser = null;
    await Preferences.instance.setCurrentUser(_currentUser?.toJson());
  }

  Future<bool> forgotPassword(String email) async {
    final user = await UserService.instance.update((x) => x.email == email, User(password: '1111'));
    return user != null;
  }
}
