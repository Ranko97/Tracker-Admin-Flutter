import 'package:dipl_admin/users/user_model.dart';
import 'package:dipl_admin/users/user_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel>? users;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    UserService().getUsers().then(
      (value) {
        setState(() {
          users = value;
          loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: Text("Loading..."));
    }

    if (users == null || users!.isEmpty) {
      return const Center(child: Text("No users."));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 36.0),
              child: Text("Users"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users![index].username),
            subtitle: Text(users![index].phoneNumber),
            leading: const Icon(Icons.person),
            onTap: () {
              GoRouter.of(context).push(
                "/users/details",
                extra: users![index],
              );
            },
          );
        },
      ),
    );
  }
}
