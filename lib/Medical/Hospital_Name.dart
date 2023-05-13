import 'package:emergency_numbers/Medical/About%20Hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DataXmedical.dart';

class Hospital_Name extends StatelessWidget {
  String? zillaName;
  Hospital_Name({Key? key,this.zillaName}) : super(key: key);


  DATAxMEDICAL medicalData = DATAxMEDICAL();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(zillaName.toString()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalSeachResult()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  ),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search hospital in ${zillaName}",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicalData.hospital_names.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutHospitalPage(
                      hospitalName: medicalData.hospital_names[index],
                      hospitalAddress: medicalData.hospital_addres[index],
                      hospitalNumber: medicalData.hospital_phones[index],
                    )));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(medicalData.hospital_names[index],style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(medicalData.hospital_addres[index]),
                          ),
                          GestureDetector(
                            onLongPress: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.teal,
                                content: Text("Number has been copied"),
                                duration: Duration(seconds: 2),  ),);
                            Clipboard.setData(ClipboardData(text:medicalData.hospital_phones[index]));
                            },
                              child: Text(medicalData.hospital_phones[index]))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



///Search Result Scaffold
class HospitalSeachResult extends StatefulWidget {
  HospitalSeachResult({Key? key}) : super(key: key);

  @override
  State<HospitalSeachResult> createState() => _HospitalSeachResultState();
}

class _HospitalSeachResultState extends State<HospitalSeachResult> {
  DATAxMEDICAL medicalData = DATAxMEDICAL();

  String? userSearched;

  @override
  Widget build(BuildContext context) {
    List searchFilter = [];
    if(userSearched == null || userSearched!.isEmpty) {
    } else {
      for (int i = 0; i < medicalData.hospital_names.length; i++) {
        if(medicalData.hospital_names[i].toLowerCase().contains(userSearched!.toLowerCase())){
          searchFilter.add(medicalData.hospital_names[i]);
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.teal.shade50),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black.withOpacity(0.6),
                  )),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 4,
        title: TextFormField(
          onChanged: (value) {
            setState(() {
              userSearched = value;
            });
          },
          style: const TextStyle(fontSize: 16.0,color: Colors.black),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search hospital',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 19),
            border: InputBorder.none,
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchFilter.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(searchFilter[index],style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
          );
        },),
    );
  }
}

