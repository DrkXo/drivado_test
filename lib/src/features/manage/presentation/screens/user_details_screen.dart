import 'package:drivado_test/src/common/widgets/custom_app_bar.dart';
import 'package:drivado_test/src/features/manage/domain/model/users/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({
    super.key,
    required this.user,
  });

  final UserModel user;

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
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'User Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(user.isActive == false ? 'Active' : 'Deactive'),
                      Transform.scale(
                        scale: .6,
                        child: Switch.adaptive(
                          activeColor: Colors.green,
                          value: user.isActive ?? false,
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
                    user.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text('User : ${user.email}'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Name : ',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${user.name}',
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
                                Icons.email_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email ID : ',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${user.email}',
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
                                Icons.phone_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Mob. Number : ',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${user.mobileNumber}',
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
                                Icons.language_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Language : ',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'English',
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
                                Icons.currency_bitcoin_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Currency : ',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${user.currency}',
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
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 1,
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
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                              '${user.currency} ${user.totalUnpaidBooking}',
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
                              '${user.currency} ${user.availableLimit}',
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
        ],
      ),
    );
  }
}
