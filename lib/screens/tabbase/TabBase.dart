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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(),
        ),
        bottomNavigationBar: SizedBox(
          height: 40,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            OutlinedButton(
              onPressed: () {
                onClickTab(1);
              },
              child: const Text("1"),
            ),
            OutlinedButton(
              onPressed: () {
                onClickTab(2);
              },
              child: const Text("2"),
            ),
            OutlinedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const WritePage()));
              },
              child: const Text("Write"),
            ),
            OutlinedButton(
              onPressed: () {
                onClickTab(4);
              },
              child: const Text("4"),
            ),
            OutlinedButton(
              onPressed: () {
                onClickTab(5);
              },
              child: const Text("5"),
            )
          ]),
        ));
  }

  onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
