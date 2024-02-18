import 'package:flutter/material.dart';

class SidebarDesktop extends StatefulWidget {
  const SidebarDesktop({Key? key}) : super(key: key);

  @override
  _SidebarDesktopState createState() => _SidebarDesktopState();
}

class _SidebarDesktopState extends State<SidebarDesktop> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (_) => setState(() => _isExpanded = true),
      onExit: (_) => setState(() => _isExpanded = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: _isExpanded ? 200 : 50,
        height: double.infinity,
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            Expanded(
              child: AnimatedCrossFade(
                firstChild: Container(

                ),
                secondChild: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // DrawerHeader(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Icon(Icons.supervised_user_circle_sharp),
                      //     ],
                      //   ),
                      // ),
                      ListTile(
                        title: Text('Menu Item 1'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Menu Item 2'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Menu Item 3'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Menu Item 4'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Menu Item 5'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Menu Item 6'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}