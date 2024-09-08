import 'package:dipl_admin/couriers/courier_model.dart';
import 'package:dipl_admin/couriers/courier_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CouriersPage extends StatefulWidget {
  const CouriersPage({super.key});

  @override
  State<CouriersPage> createState() => _CouriersPageState();
}

class _CouriersPageState extends State<CouriersPage> {
  List<CourierModel>? couriers;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    CourierService().getCouriers().then(
      (value) {
        setState(() {
          couriers = value;
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

    if (couriers == null || couriers!.isEmpty) {
      return const Center(child: Text("No couriers."));
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
              child: Text("Couriers"),
            ),
            Text(
              "Earnings today",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: couriers!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(couriers![index].username),
            subtitle: Text(couriers![index].fullName),
            leading: const Icon(Icons.local_shipping),
            trailing: Text(couriers![index].earningsToday.toStringAsFixed(2)),
            onTap: () {
              GoRouter.of(context).push(
                "/couriers/details",
                extra: couriers![index],
              );
            },
          );
        },
      ),
    );
  }
}
