import 'package:dipl_admin/common/row_description_widget.dart';
import 'package:dipl_admin/users/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        RowDescriptionWidget(
          title: "Username:",
          description: user.username,
        ),
        RowDescriptionWidget(
          title: "Phone:",
          description: user.phoneNumber,
        ),
        RowDescriptionWidget(
          title: "Address:",
          description: user.address,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Deactivate user"),
            ),
          ),
        ),
      ],
    );
  }
}
