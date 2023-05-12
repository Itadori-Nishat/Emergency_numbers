import 'package:flutter/material.dart';

class MedicalEmergencyNumber extends StatelessWidget {
  const MedicalEmergencyNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital"),
      ),
      body: Center(
        child: Text("Medical"),
      ),
    );
  }
}
