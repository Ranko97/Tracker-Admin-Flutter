import 'package:dipl_admin/common/row_description_widget.dart';
import 'package:dipl_admin/couriers/courier_model.dart';
import 'package:flutter/material.dart';

class CourierDetailsPage extends StatelessWidget {
  const CourierDetailsPage({
    super.key,
    required this.courier,
  });

  final CourierModel courier;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        RowDescriptionWidget(
          title: "Username:",
          description: courier.username,
        ),
        RowDescriptionWidget(
          title: "Name:",
          description: courier.fullName,
        ),
        RowDescriptionWidget(
          title: "Phone:",
          description: courier.phoneNumber,
        ),
        RowDescriptionWidget(
          title: "Delivered orders:",
          description: courier.deliveredOrdersCount.toString(),
        ),
        RowDescriptionWidget(
          title: "Earnings today:",
          description:
              "${courier.earningsToday.toStringAsFixed(2)} ${courier.earningsCurrency}",
        ),
        RowDescriptionWidget(
          title: "Earnings total:",
          description:
              "${courier.earningsTotal.toStringAsFixed(2)} ${courier.earningsCurrency}",
        ),
        RowDescriptionWidget(
          title: "Rating:",
          description: courier.averageRating.toStringAsFixed(1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Deactivate courier"),
            ),
          ),
        ),
      ],
    );
  }
}
