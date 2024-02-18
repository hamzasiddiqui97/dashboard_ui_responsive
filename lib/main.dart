import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          // Adjust your UI based on the sizingInformation
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            // For desktop layout
            return _buildDashboardLayout();
          } else {
            // For mobile and tablet layout
            return SingleChildScrollView(
              child: _buildDashboardLayout(),
            );
          }
        },
      ),
    );
  }

  Widget _buildDashboardLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBarChart(),
          SizedBox(height: 20),
          _buildPieChart(),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(
            // Dummy titles for demonstration
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
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 30,
              color: Colors.blue,
              title: 'A', // Dummy title
            ),
            PieChartSectionData(
              value: 40,
              color: Colors.green,
              title: 'B', // Dummy title
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.orange,
              title: 'C', // Dummy title
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
