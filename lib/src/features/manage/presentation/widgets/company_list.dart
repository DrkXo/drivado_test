import 'package:drivado_test/src/features/manage/data/company_repository.dart';
import 'package:drivado_test/src/router/routes.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

var faker = Faker();

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
                          icon: Icon(
                            Icons.person_add_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: Text(
                            'Add User',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List<int>.generate(5, (i) => i + 1)
                              .map((x) => TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.grey,
                                    ),
                                    label: Text(
                                      faker.internet.email(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )),
                        ],
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
