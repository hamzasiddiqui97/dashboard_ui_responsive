import 'package:flutter/material.dart';


class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600; // Adjust the threshold according to your needs
    final crossAxisCount = isMobile ? 3 : 5;


    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      children: const [
        GridItem(title: 'Revenue', iconData: Icons.attach_money, value: '500K', iconColor: Colors.blue,),
        GridItem(title: 'Profit', iconData: Icons.trending_up, value: '200K', iconColor: Colors.purple,),
        GridItem(title: 'Orders', iconData: Icons.shopping_cart, value: '100', iconColor: Colors.red,),
        GridItem(title: 'Customers', iconData: Icons.people, value: '1000', iconColor: Colors.cyanAccent,),
        GridItem(title: 'Quantity', iconData: Icons.layers, value: '5000',iconColor: Colors.yellow,),
      ],
    );
  }
}
class GridItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String value;
  final Color iconColor; // New parameter for icon container color

  const GridItem({Key? key, required this.title, required this.iconData, required this.value, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  color: iconColor.withOpacity(0.2), // Use the provided color for the icon container
                  child: Icon(
                    iconData,
                    color: iconColor.withOpacity(0.8), // Set the color of the icon
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: screenWidth * 0.01,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
