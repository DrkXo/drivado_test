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
                          value: user.isActive ?? false,
                          onChanged: (v) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
