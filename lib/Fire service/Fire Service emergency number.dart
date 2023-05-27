import 'package:emergency_numbers/Fire%20service/DataXfire.dart';
import 'package:flutter/material.dart';

import '../UI /AboutPage.dart';

class FireSeviceEmergencyNumber extends StatefulWidget {
  FireSeviceEmergencyNumber({Key? key}) : super(key: key);

  @override
  State<FireSeviceEmergencyNumber> createState() =>
      _FireSeviceEmergencyNumberState();
}

class _FireSeviceEmergencyNumberState extends State<FireSeviceEmergencyNumber> {
  DATAxFIRESERVICE dataTable = DATAxFIRESERVICE();
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FireServiceSearchResultShow()));
              },
              icon: Icon(Icons.search))
        ],
        title: Text("ফায়ার সার্ভিস"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: dataTable.NameDataFire.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage(
                                          name: dataTable.NameDataFire[index],
                                          number:
                                              dataTable.NumberDataFire[index],
                                        )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataTable.NameDataFire[index],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(dataTable.NumberDataFire[index]),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _isFav = !_isFav;
                              });
                            },
                            icon: Icon(
                              _isFav ? Icons.favorite : Icons.favorite_border,
                              color: _isFav ? Colors.red : Colors.black54,
                            )),
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class FireServiceSearchResultShow extends StatefulWidget {
  const FireServiceSearchResultShow({Key? key}) : super(key: key);

  @override
  State<FireServiceSearchResultShow> createState() =>
      _FireServiceSearchResultShowState();
}

class _FireServiceSearchResultShowState
    extends State<FireServiceSearchResultShow> {
  DATAxFIRESERVICE dataTable = DATAxFIRESERVICE();
  String? userSearched;
  @override
  Widget build(BuildContext context) {
    List searchFilter = [];
    List searchedFilterNumber = [];
    if (userSearched == null || userSearched!.isEmpty) {
    } else {
      for (int i = 0; i < dataTable.NameDataFire.length; i++) {
        if (dataTable.NameDataFire[i]
            .toLowerCase()
            .contains(userSearched!.toLowerCase())) {
          searchFilter.add(dataTable.NameDataFire[i]);
          searchedFilterNumber.add(dataTable.NumberDataFire[i]);
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
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'ফায়ার সার্ভিস খুঁজুন',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutPage(
                                    name: searchFilter[index],
                                    number: searchedFilterNumber[index],
                                  )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchFilter[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(searchedFilterNumber[index]),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
