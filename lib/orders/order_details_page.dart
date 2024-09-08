import 'package:dipl_admin/common/row_description_widget.dart';
import 'package:dipl_admin/orders/order_model.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        RowDescriptionWidget(
          title: "ID:",
          description: order.id,
        ),
        RowDescriptionWidget(
          title: "Details:",
          description: order.details,
        ),
        RowDescriptionWidget(
          title: "Status:",
          description: order.status,
        ),
        RowDescriptionWidget(
          title: "Total:",
          description:
              "${order.totalCost.toStringAsFixed(2)} ${order.totalCostCurrency}",
        ),
        RowDescriptionWidget(
          title: "Payment type:",
          description: order.paymentType,
        ),
        RowDescriptionWidget(
          title: "Courier earnings:",
          description:
              "${order.courierEarnings.toStringAsFixed(2)} ${order.courierEarningsCurrency}",
        ),
        RowDescriptionWidget(
          title: "Time created:",
          description: order.timeCreated.toString(),
        ),
        RowDescriptionWidget(
          title: "Time delivered:",
          description: order.timeDelivered?.toString() ?? "Not delivered",
        ),
        RowDescriptionWidget(
          title: "Courier:",
          description: order.courier?.username ?? "Not assigned",
        ),
        RowDescriptionWidget(
          title: "User:",
          description: order.user?.username ?? "Not assigned",
        ),
        RowDescriptionWidget(
          title: "Warehouse:",
          description: order.warehouse?.address ?? "Not applicable.",
        ),
        RowDescriptionWidget(
          title: "Delivery location ID:",
          description: order.deliveryLocationId ?? "Not applicable.",
        ),
        if (order.timeDelivered == null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () {},
                child: const Text("Cancel order"),
              ),
            ),
          ),
      ],
    );
  }
}
