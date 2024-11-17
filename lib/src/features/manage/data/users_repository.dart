import 'package:drivado_test/src/features/manage/domain/model/users/user_model.dart';
import 'package:drivado_test/src/services/dio_service.dart';
import 'package:drivado_test/src/utils/logger.dart';
import 'package:flutter/material.dart';

class UsersRepository with ChangeNotifier {
  DioService _dioService;

  UsersRepository({
    required DioService dioService,
  }) : _dioService = dioService;

  final List<UserModel> _users = [];
  List<UserModel> get users => _users;

  bool isLoading = false;

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _dioService.get('/users');
      if (response.statusCode == 200) {
        final parshedData = List.from(response.data)
            .map((json) => UserModel.fromJson(json))
            .toList();
        _users.clear();
        _users.addAll(parshedData);
        logger.i('Users : ${_users.length}');
      } else {
        //TODO:
      }
    } catch (_) {}
    isLoading = false;
    notifyListeners();
  }

  void updateDependency({
    required DioService dioService,
  }) {
    _dioService = dioService;
  }
}
