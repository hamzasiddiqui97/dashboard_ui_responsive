import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return const DesktopLayout();
          } else {
            return const MobileTabletLayout();
          }
        },
      ),
    );
  }
}

class MobileTabletLayout extends StatelessWidget {
  const MobileTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileTabletLayoutWidget();
  }
}

class MobileTabletLayoutWidget extends StatelessWidget {
  const MobileTabletLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GridViewWidget(),
          SizedBox(height: 20),
          DashboardLayout(),
          SizedBox(height: 20),
          OrderTableWidget(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: const Text('Menu Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Menu Item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: const [
          GridItem(title: 'Revenue', iconData: Icons.attach_money, value: '500K'),
          GridItem(title: 'Profit', iconData: Icons.trending_up, value: '200K'),
          GridItem(title: 'Orders', iconData: Icons.shopping_cart, value: '100'),
          GridItem(title: 'Customers', iconData: Icons.people, value: '1000'),
          GridItem(title: 'Quantity', iconData: Icons.layers, value: '5000'),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String value;

  const GridItem({super.key, required this.title, required this.iconData, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(height: 8),
            Text(title),
            const SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Sidebar(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GridViewWidget(),
                  SizedBox(height: 20),
                  DashboardLayout(),
                  SizedBox(height: 20),
                  OrderTableWidget(),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BarChartWidget(),
        SizedBox(height: 20),
        PieChartWidget(),
      ],
    );
  }
}
class Order {
  final String orderId;
  final String customer;
  final String product;
  final int quantity;
  final double total;

  Order({
    required this.orderId,
    required this.customer,
    required this.product,
    required this.quantity,
    required this.total,
  });
}

class OrderTableWidget extends StatelessWidget {
  const OrderTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy order data for demonstration
    List<Order> orders = [
      Order(orderId: '001', customer: 'John Doe', product: 'Product A', quantity: 2, total: 200),
      Order(orderId: '002', customer: 'Jane Smith', product: 'Product B', quantity: 3, total: 300),
      // Add more dummy orders as needed
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
    );
  }
}




class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [BarChartRodData(y: 8, colors: [Colors.blue])],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [BarChartRodData(y: 10, colors: [Colors.green])],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(y: 14, colors: [Colors.orange])],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [BarChartRodData(y: 14, colors: [Colors.purple])],
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 30,
              color: Colors.blue,
              title: 'A',
            ),
            PieChartSectionData(
              value: 40,
              color: Colors.green,
              title: 'B',
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.orange,
              title: 'C',
            ),
          ],
        ),
      ),
    );
  }
}