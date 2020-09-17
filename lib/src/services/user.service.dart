import '../models.dart';
import 'preferences.dart';

class UserService {
  UserService._();

  static UserService _instance;

  static UserService get instance => _instance ??= UserService._();

  List<User> _users;

  Future<void> _load() async {
    if (_users == null) {
      _users = User.fromJsonList(Preferences.instance.getUsers());
    }
  }

  Future<void> _save() async {
    Preferences.instance.setUsers(User.toJsonList(_users));
  }

  int _getNextId() {
    var ids = (_users ?? []).map((x) => x.id).toList();
    if (ids.length == 0) return 1;
    ids.sort();
    return ids.last + 1;
  }

  Future<List<User>> getAll() async {
    await _load();
    return _users;
  }

  Future<User> _find(bool Function(User) predicate) async {
    await _load();
    return _users.firstWhere(predicate, orElse: () => null);
  }

  Future<User> find(bool Function(User) predicate) async {
    final user = await _find(predicate);
    return user?.copyWith();
  }

  Future<User> findById(int id) async {
    final user = await _find((x) => x.id == id);
    return user?.copyWith();
  }

  Future<User> create(User user) async {
    User _user = await _find((x) => x.email == user.email);
    if (_user != null) {
      throw Exception('User already exists');
    }

    _user = User(
      id: _getNextId(),
      fullName: user.fullName,
      email: user.email,
      password: user.password,
    );

    _users.add(_user);

    await _save();

    return _user;
  }

  Future<User> update(bool Function(User) predicate, User user) async {
    await _load();
    final index = _users.indexWhere(predicate);
    if (index < 0) {
      throw Exception('User not found');
    }

    user = _users[index].copyWith(
      fullName: user.fullName,
      password: user.password,
    );

    await _save();

    return user;
  }
}
