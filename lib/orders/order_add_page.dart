import 'package:dipl_admin/common/validators.dart';
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
              onFieldSubmitted: (value) => map["details"] = value,
              validator: Validators.required,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Payment type",
                hintText: "e.g. cash, card, etc.",
              ),
              onFieldSubmitted: (value) => map["paymentType"] = value,
              validator: Validators.required,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Total cost",
              ),
              onFieldSubmitted: (value) => map["totalCost"] = value,
              validator: Validators.required,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Courier earnings",
              ),
              onFieldSubmitted: (value) => map["courierEarnings"] = value,
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
              validator: Validators.required,
              onChanged: (value) => map["userID"] = value?.id,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () {
                  // TODO: extract method
                  formKey.currentState!.validate();

                  map['status'] = 'created';
                  map['timeCreated'] = DateTime.now().toIso8601String();
                  map['totalCostCurrency'] = 'BAM';
                  map['courierEarningsCurrency'] = 'BAM';
                  map['status'] = 'created';
                  map['deliveryLocationId'] = users
                      ?.where((e) => e.id == map['userID'])
                      .first
                      .defaultLocation
                      ?.id;
                  map['warehouseID'] = "12343b46-8516-4149-963f-6571ca6f1234";
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
