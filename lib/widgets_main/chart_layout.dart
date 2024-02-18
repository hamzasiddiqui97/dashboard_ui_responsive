import 'package:flutter/material.dart';
import 'package:dashboard/widgets_main/charts_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';



class ChartsLayout extends StatelessWidget {
  const ChartsLayout({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          // For desktop view, use a Row layout
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const BarChartWidget(),
                ),
              ),
              SizedBox(width: screenWidth * 0.01,),
              Container(
                // padding: EdgeInsets.all(screenWidth*0.02),
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(4),
                ),
                width:screenWidth * 0.30 ,
                child: const PieChartWidget(),
              ),
            ],
          );
        } else {
          // For mobile and tablet view, use a Column layout
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BarChartWidget(),
              SizedBox(height: 20),
              PieChartWidget(),
            ],
          );
        }
      },
    );
  }
}

