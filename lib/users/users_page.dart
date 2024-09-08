import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Users"),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push("/users/details");
          },
          child: const Text("Go to user details"),
        ),
      ],
    );
  }
}
