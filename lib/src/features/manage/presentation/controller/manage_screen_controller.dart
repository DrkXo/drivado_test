import 'package:drivado_test/src/features/manage/presentation/widgets/company_list.dart';
import 'package:drivado_test/src/features/manage/presentation/widgets/users_list.dart';
import 'package:flutter/material.dart';

class ManageScreenController extends ChangeNotifier {
  final List<Tab> tabBars = <Tab>[
    const Tab(text: 'Users'),
    const Tab(text: 'Sub-Company'),
  ];

  final List<Widget> tabViews = [
    UsersListWidget(),
    CompanyListWidget(),
  ];

  late final FocusNode searchFocusNode;

  ManageScreenController() {
    searchFocusNode = FocusNode();
  }
}
