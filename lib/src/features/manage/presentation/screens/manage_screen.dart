import 'package:drivado_test/src/common/widgets/custom_app_bar.dart';
import 'package:drivado_test/src/features/manage/data/company_repository.dart';
import 'package:drivado_test/src/features/manage/data/users_repository.dart';
import 'package:drivado_test/src/features/manage/presentation/controller/manage_screen_controller.dart';
import 'package:drivado_test/src/features/manage/presentation/widgets/notification_widget.dart';
import 'package:drivado_test/src/features/manage/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<UsersRepository>().fetchUsers();
      context.read<CompanyRepository>().fetchCompanies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ManageScreenController>();

    return DefaultTabController(
      length: controller.tabBars.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          return Scaffold(
            appBar: CustomAppBar(
              bottomWidget: SearchBarWidget(),
              actions: [
                NotificationWidget(),
              ],
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: SearchBarWidget(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey.withOpacity(.5),
                            child: TabBar(
                              controller: tabController,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black54,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                color: Colors.white30,
                              ),
                              tabs: controller.tabBars,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: controller.tabViews,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
