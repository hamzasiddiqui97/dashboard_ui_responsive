import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.30,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Container(
      height: screenHeight * 0.30,
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