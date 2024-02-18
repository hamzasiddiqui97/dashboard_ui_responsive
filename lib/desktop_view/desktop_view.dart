import 'package:dashboard/desktop_view/desktop_widgets/sidebar_widget.dart';
import 'package:dashboard/main.dart';
import 'package:dashboard/widgets_main/chart_layout.dart';
import 'package:dashboard/widgets_main/gridview_widget.dart';
import 'package:dashboard/widgets_main/order_table_widget.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: const Text('Desktop Dashboard')),
      body:Row(
        children: [
          SidebarDesktop(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GridViewWidget(),
                    SizedBox(height: 20),
                    ChartsLayout(),
                    SizedBox(height: 20),
                    OrderTableWidget(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


