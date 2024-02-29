import 'package:base_flutter/screens/home/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBase extends StatefulWidget {
  const TabBase({super.key});

  @override
  State<StatefulWidget> createState() {
    return TabBaseState();
  }
}

class TabBaseState extends State<TabBase> {
  var _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[const HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onClickTab(0);
                      },
                      child: const SizedBox.expand(
                        child: Icon(
                          Icons.home_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onClickTab(1);
                      },
                      child: const SizedBox.expand(
                        child: const Icon(
                          Icons.search_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => const WritePage()));
                      },
                      child: const SizedBox.expand(
                        child: const Icon(
                          Icons.post_add_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onClickTab(2);
                      },
                      child: const SizedBox.expand(
                        child: const Icon(
                          Icons.account_circle_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onClickTab(3);
                      },
                      child: const SizedBox.expand(
                        child: const Icon(
                          Icons.settings_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }

  onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
