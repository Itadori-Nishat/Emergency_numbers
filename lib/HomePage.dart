import 'package:emergency_numbers/Ambulance/Ambulance%20emergency.dart';
import 'package:emergency_numbers/Doctor/Doctor%20emergency%20number.dart';
import 'package:emergency_numbers/Fire%20service/Fire%20Service%20emergency%20number.dart';
import 'package:emergency_numbers/Medical/Medical%20emergency%20number.dart';
import 'package:emergency_numbers/Police/Police%20emergency%20number.dart';
import 'package:emergency_numbers/R.A.B/R.A.B%20emergency%20number.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.phone_android),
                  Text("Emergency Numbers", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PoliceEmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/pstation.png",height: 80,),
                                Text("Police",style: TextStyle(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FireSeviceEmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/fire.png",height: 80,),
                                Text("Fire service",style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Medical_EmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/hospt.png",height: 80,),
                                Text("Hospital",style: TextStyle(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RAB_EmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/rab.png",height: 80,),
                                Text("R.A.B",style: TextStyle(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AmbulanceEmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/ambulance.png",height: 80,),
                                Text("Ambulance",style: TextStyle(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorEmergencyNumber()));
                      },
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("Assets/doctor.png",height: 80,),
                                Text("Doctor",style: TextStyle(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}
