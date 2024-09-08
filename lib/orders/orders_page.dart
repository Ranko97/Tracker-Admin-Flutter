import 'package:dipl_admin/orders/order_model.dart';
import 'package:dipl_admin/orders/order_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<OrderModel>? orders;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    OrderService().getOrders().then(
      (value) {
        setState(() {
          orders = value;
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

    if (orders == null || orders!.isEmpty) {
      return const Center(child: Text("No orders."));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.go("/orders/add");
        },
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 36.0),
          child: Text("Orders"),
        ),
      ),
      body: ListView.builder(
        itemCount: orders!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders![index].details),
            subtitle: Text(
                "${orders![index].totalCost.toStringAsFixed(2)} ${orders![index].totalCostCurrency}"),
            leading: const Icon(Icons.shopping_cart),
            trailing: Text(orders![index].status),
            onTap: () {
              GoRouter.of(context).push(
                "/orders/details",
                extra: orders![index],
              );
            },
          );
        },
      ),
    );
  }
}
