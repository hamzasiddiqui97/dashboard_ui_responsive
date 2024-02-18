import 'package:dashboard/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderTableWidget extends StatelessWidget {
  const OrderTableWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    // Dummy order data for demonstration
    List<Order> orders = [
      Order(orderId: '001', customer: 'John Doe', product: 'Product A', quantity: 2, total: 200),
      Order(orderId: '002', customer: 'Jane Smith', product: 'Product B', quantity: 3, total: 300),
      // Add more dummy orders as needed
    ];

    // Create a ScrollController
    final scrollController = ScrollController();

    return SingleChildScrollView(
      controller: scrollController, // Assign the ScrollController
      scrollDirection: Axis.horizontal,
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController, // Assign the ScrollController to the Scrollbar
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Order ID')),
            DataColumn(label: Text('Customer')),
            DataColumn(label: Text('Product')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Total')),
          ],
          rows: orders.map((order) {
            return DataRow(cells: [
              DataCell(Text(order.orderId)),
              DataCell(Text(order.customer)),
              DataCell(Text(order.product)),
              DataCell(Text(order.quantity.toString())),
              DataCell(Text('\$${order.total.toString()}')),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
