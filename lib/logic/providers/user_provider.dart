import 'package:flutter/material.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  final UserRepository _repository = UserRepository();

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _repository.fetchUsers();
    } catch (e) {
      _users = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
