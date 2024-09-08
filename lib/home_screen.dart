import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tracker Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: const Text('Welcome, Admin!'),
            ),
            ListTile(
              title: const Text('Couriers'),
              onTap: () {
                context.pop();

                context.go("/couriers");
              },
            ),
            ListTile(
              title: const Text('Users'),
              onTap: () {
                context.pop();

                context.go("/users");
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                context.pop();

                context.go("/orders");
              },
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
