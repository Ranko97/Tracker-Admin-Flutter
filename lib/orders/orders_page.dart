import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Orders"),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push("/orders/details");
          },
          child: const Text("Go to order details"),
        ),
      ],
    );
  }
}
