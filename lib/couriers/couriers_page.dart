import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CouriersPage extends StatefulWidget {
  const CouriersPage({super.key});

  @override
  State<CouriersPage> createState() => _CouriersPageState();
}

class _CouriersPageState extends State<CouriersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Couriers"),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push("/couriers/details");
          },
          child: const Text("Go to courier details"),
        ),
      ],
    );
  }
}
