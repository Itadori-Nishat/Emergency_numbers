import 'package:flutter/material.dart';

import 'Fire service/Fire Service emergency number.dart';
import 'Medical/Medical emergency number.dart';
import 'Police/Police emergency number.dart';

class DefaultTabBarPage extends StatelessWidget {
  const DefaultTabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.more_vert)],
          centerTitle: true,
          title: Text("Emergency Numbers"),
          bottom: TabBar(
              tabs: [
            Tab(
              text: "Police",
            ),
            Tab(
              text: "Fire Service",
            ),
            Tab(
              text: "Medical",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            PoliceEmergencyNumber(),
            FireSeviceEmergencyNumber(),
            MedicalEmergencyNumber()
          ],
        ),
      ),
    );
  }
}
