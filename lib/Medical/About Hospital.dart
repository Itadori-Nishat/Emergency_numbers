import 'package:emergency_numbers/Fire%20service/DataXfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutHospitalPage extends StatelessWidget {
  String? hospitalName, hospitalAddress, hospitalNumber;
  String? doctorName, qualifi, speciality, chamber;
  AboutHospitalPage(
      {Key? key,
      this.hospitalName,
      this.hospitalAddress,
      this.hospitalNumber,
      this.doctorName,
      this.qualifi,
      this.speciality,
      this.chamber})
      : super(key: key);

  DATAxFIRESERVICE dt = DATAxFIRESERVICE();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalName.toString()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Doctors Name:",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                itemCount: dt.NameDataFire.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dt.NameDataFire[index],style: TextStyle(
                                fontSize: 22
                            ),),
                            Text(doctorName.toString(),style: TextStyle(
                              fontSize: 18
                            ),),
                            Text(qualifi.toString(),style: TextStyle(
                                fontSize: 18
                            ),),
                            Text(speciality.toString(),style: TextStyle(
                                fontSize: 18
                            ),),
                            Text(chamber.toString(),style: TextStyle(
                                fontSize: 18,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },))
        ],
      ),
    );
  }
}
