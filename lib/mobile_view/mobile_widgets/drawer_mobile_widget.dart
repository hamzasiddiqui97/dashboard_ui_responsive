import 'package:flutter/material.dart';

class SidebarMobile extends StatelessWidget {
  const SidebarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.supervised_user_circle_sharp),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Menu Item 1'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Menu Item 2'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Menu Item 3'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Menu Item 4'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Menu Item 5'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Menu Item 6'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
