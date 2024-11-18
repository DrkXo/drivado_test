import 'package:drivado_test/src/common/widgets/custom_app_bar.dart';
import 'package:drivado_test/src/features/manage/domain/model/sub_company/company_model.dart';
import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        reverse: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Company Details',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Text(company.isActive == false ? 'Active' : 'Deactive'),
                        Text('Deactivate'),
                        Transform.scale(
                          scale: .6,
                          child: Switch.adaptive(
                            activeColor: Colors.green,
                            value: true,
                            onChanged: (v) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text(
                      company.companyName ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text('${company.email}'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(4),
                      },
                      children: [
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scale: .8,
                                child: Icon(
                                  Icons.link_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Website : ',
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.companyName}',
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scale: .8,
                                child: Icon(
                                  Icons.call_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mob. number : ',
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.mobileNumber}',
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scale: .8,
                                child: Icon(
                                  Icons.local_atm_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'GST/VAT : ',
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.gstNum}',
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scale: .8,
                                child: Icon(
                                  Icons.pin_drop_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Adress : ',
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.address}',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Credit Limit',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total Unpaid Booking : ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.totalUnpaidBooking}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Available credit limit : ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${company.availableCreditLimit}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
