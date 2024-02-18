import 'package:dashboard/desktop_view/desktop_view.dart';
import 'package:dashboard/desktop_view/desktop_widgets/sidebar_widget.dart';
import 'package:dashboard/mobile_view/mobile_view.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey.shade100,
      drawer: const SidebarDesktop(),
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

