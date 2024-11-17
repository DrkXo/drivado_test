import 'package:drivado_test/src/features/manage/data/company_repository.dart';
import 'package:drivado_test/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CompanyListWidget extends StatefulWidget {
  const CompanyListWidget({super.key});

  @override
  State<CompanyListWidget> createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final companyRepository = context.watch<CompanyRepository>();

    switch (companyRepository.isLoading) {
      case true:
        return Column(
          children: [
            LinearProgressIndicator(),
          ],
        );
      case false:
        switch (companyRepository.companies.isEmpty) {
          case true:
            return Center(
              child: Text('No Companies Found!'),
            );
          case false:
            return ListView.builder(
              shrinkWrap: true,
              itemCount: companyRepository.companies.length,
              itemBuilder: (BuildContext context, int index) {
                final company = companyRepository.companies[index];
                return ExpansionTile(
                  leading: const Icon(Icons.apartment),
                  title: InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        Routes.company.name,
                        extra: company,
                      );
                    },
                    child: Text(
                      company.companyName ?? 'Unknown Company Name !',
                    ),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.person_add),
                          label: Text('Add User'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
        }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
