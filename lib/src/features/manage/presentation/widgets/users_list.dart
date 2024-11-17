import 'package:drivado_test/src/features/manage/data/users_repository.dart';
import 'package:drivado_test/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final usersRepository = context.watch<UsersRepository>();

    switch (usersRepository.isLoading) {
      case true:
        return Column(
          children: [
            LinearProgressIndicator(),
          ],
        );
      case false:
        switch (usersRepository.users.isEmpty) {
          case true:
            return Center(
              child: Text('No Users Found!'),
            );
          case false:
            return ListView.builder(
              shrinkWrap: true,
              itemCount: usersRepository.users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = usersRepository.users[index];
                return ListTile(
                  onTap: () {
                    GoRouter.of(context).pushNamed(
                      Routes.user.name,
                      extra: user,
                    );
                  },
                  leading: const Icon(Icons.person_outline_outlined),
                  title: Text(user.name ?? 'Unknown Name !'),
                );
              },
            );
        }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
