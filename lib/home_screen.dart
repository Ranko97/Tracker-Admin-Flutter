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
              leading: const Icon(Icons.local_shipping),
              onTap: () {
                context.pop();

                context.go("/couriers");
              },
            ),
            ListTile(
              title: const Text('Users'),
              leading: const Icon(Icons.person),
              onTap: () {
                context.pop();

                context.go("/users");
              },
            ),
            ListTile(
              title: const Text('Orders'),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                context.pop();

                context.go("/orders");
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // TODO: settings
              },
            ),
            ListTile(
              title: const Text('Log out'),
              leading: const Icon(Icons.logout),
              onTap: () {
                // TODO: logout
              },
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
