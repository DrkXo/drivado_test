import 'package:drivado_test/src/features/manage/domain/model/sub_company/company_model.dart';
import 'package:drivado_test/src/services/dio_service.dart';
import 'package:drivado_test/src/utils/logger.dart';
import 'package:flutter/material.dart';

class CompanyRepository with ChangeNotifier {
  DioService _dioService;

  CompanyRepository({
    required DioService dioService,
  }) : _dioService = dioService;

  final List<CompanyModel> _companies = [];
  List<CompanyModel> get companies => _companies;

  bool isLoading = false;

  Future<void> fetchCompanies() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _dioService.get('/company');
      if (response.statusCode == 200) {
        final parshedData = List.from(response.data)
            .map((json) => CompanyModel.fromJson(json))
            .toList();
        _companies.clear();
        _companies.addAll(parshedData);
        logger.i('Companies : ${_companies.length}');
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
