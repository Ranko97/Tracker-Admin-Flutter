import 'package:dipl_admin/common/validators.dart';
import 'package:dipl_admin/orders/order_model.dart';
import 'package:dipl_admin/orders/order_service.dart';
import 'package:dipl_admin/orders/order_statuses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderEditPage extends StatefulWidget {
  const OrderEditPage({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  State<OrderEditPage> createState() => _OrderEditPageState();
}

class _OrderEditPageState extends State<OrderEditPage> {
  final formKey = GlobalKey<FormState>();
  late final Map<String, dynamic> map;

  bool loading = false;

  @override
  void initState() {
    super.initState();

    map = widget.order.toMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Order"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Details",
              ),
              onChanged: (value) => map["details"] = value,
              validator: Validators.required,
              initialValue: map["details"],
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Payment type",
                hintText: "e.g. cash, card, etc.",
              ),
              onChanged: (value) => map["paymentType"] = value,
              validator: Validators.required,
              initialValue: map["paymentType"],
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Total cost",
              ),
              onChanged: (value) => map["totalCost"] = value,
              validator: Validators.required,
              initialValue: map["totalCost"],
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Courier earnings",
              ),
              onChanged: (value) => map["courierEarnings"] = value,
              validator: Validators.required,
              initialValue: map["courierEarnings"],
            ),
            DropdownButtonFormField<String>(
              value: map["status"],
              items: orderStatuses
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              decoration: const InputDecoration(
                labelText: "Status",
              ),
              validator: (value) =>
                  value == null ? "This field is required." : null,
              onChanged: (value) => map["status"] = value,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () => submitOrder(),
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitOrder() async {
    if (formKey.currentState!.validate() == false) {
      return;
    }

    setState(() => loading = true);

    final (response, error) = await OrderService.updateOrder(map);

    setState(() => loading = false);

    if (response != null) {
      GoRouter.of(context).go("/orders");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order updated successfully"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? "Something went wrong"),
        ),
      );
    }
  }
}
