import 'package:dipl_admin/common/validators.dart';
import 'package:dipl_admin/orders/order_service.dart';
import 'package:dipl_admin/users/user_model.dart';
import 'package:dipl_admin/users/user_service.dart';
import 'package:flutter/material.dart';

class OrderAddPage extends StatefulWidget {
  const OrderAddPage({super.key});

  @override
  State<OrderAddPage> createState() => _OrderAddPageState();
}

class _OrderAddPageState extends State<OrderAddPage> {
  final formKey = GlobalKey<FormState>();
  final map = <String, dynamic>{};
  List<UserModel>? users;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    UserService.getUsers().then((value) {
      setState(() {
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Order"),
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
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Payment type",
                hintText: "e.g. cash, card, etc.",
              ),
              onChanged: (value) => map["paymentType"] = value,
              validator: Validators.required,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Total cost",
              ),
              onChanged: (value) => map["totalCost"] = value,
              validator: Validators.required,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Courier earnings",
              ),
              onChanged: (value) => map["courierEarnings"] = value,
              validator: Validators.required,
            ),
            DropdownButtonFormField<UserModel>(
              items: (users ?? [])
                  .map(
                    (e) => DropdownMenuItem<UserModel>(
                      value: e,
                      child: Text(e.username),
                    ),
                  )
                  .toList(),
              decoration: const InputDecoration(
                labelText: "User",
              ),
              validator: (value) =>
                  value == null ? "This field is required." : null,
              onChanged: (value) => map["userID"] = value?.id,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () => submitOrder(),
                child: const Text("Submit"),
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

    setState(() {
      loading = true;
    });

    map['status'] = 'created';
    map['timeCreated'] = DateTime.now().toIso8601String();
    map['totalCostCurrency'] = 'BAM';
    map['courierEarningsCurrency'] = 'BAM';
    map['status'] = 'created';
    map['deliveryLocationId'] =
        users?.where((e) => e.id == map['userID']).first.defaultLocation?.id;
    map['warehouseID'] = "12343b46-8516-4149-963f-6571ca6f1234";
    // map['User']

    final (response, error) = await OrderService.addOrder(map);

    setState(() {
      loading = false;
    });

    if (response != null) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order created successfully"),
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
