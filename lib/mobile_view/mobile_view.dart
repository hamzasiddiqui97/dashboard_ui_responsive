import 'package:dashboard/desktop_view/desktop_widgets/sidebar_widget.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/mobile_view/mobile_widgets/drawer_mobile_widget.dart';
import 'package:dashboard/widgets_main/chart_layout.dart';
import 'package:dashboard/widgets_main/gridview_widget.dart';
import 'package:dashboard/widgets_main/order_table_widget.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Dashboard'),

        // Conditionally show the leading icon based on the screen size
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
      ),
      drawer: const SidebarMobile(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GridViewWidget(),
            SizedBox(height: 20),
            ChartsLayout(),
            SizedBox(height: 20),
            OrderTableWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
