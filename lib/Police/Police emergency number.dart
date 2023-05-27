import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'DataXpolice.dart';
import '../UI/AboutPage.dart';

class PoliceEmergencyNumber extends StatefulWidget {
  PoliceEmergencyNumber({Key? key}) : super(key: key);

  @override
  State<PoliceEmergencyNumber> createState() => _PoliceEmergencyNumberState();
}

class _PoliceEmergencyNumberState extends State<PoliceEmergencyNumber> {
  DATAxPOLICE dataTable = DATAxPOLICE();
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
                        builder: (context) => PoliceSearchResultShow()));
              },
              icon: Icon(Icons.search))
        ],
        title: Text("পুলিশ"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataTable.name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage(
                                          name: dataTable.name[index],
                                          number: dataTable.number[index],
                                          image: dataTable.photo[index],
                                          email: dataTable.email[index],
                                          sector: dataTable.sector[index],
                                        )));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child:
                                        Image.network(dataTable.photo[index])),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataTable.name[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(dataTable.number[index]),
                                ],
                              ),
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
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Police searched result
class PoliceSearchResultShow extends StatefulWidget {
  PoliceSearchResultShow({Key? key}) : super(key: key);

  @override
  State<PoliceSearchResultShow> createState() => _PoliceSearchResultShowState();
}

class _PoliceSearchResultShowState extends State<PoliceSearchResultShow> {
  DATAxPOLICE dataTable = DATAxPOLICE();

  String? userSearchedName;

  @override
  Widget build(BuildContext context) {
    List<String> searchedFilter = [];
    List<String> searchednumberFilter = [];
    List<String> searchedImageFilter = [];
    List<String> searchedEmailFilter = [];
    List<String> searchedBP = [];
    List<String> sector = [];
    if (userSearchedName == null || userSearchedName!.isEmpty) {
    } else {
      for (int i = 0; i < dataTable.name.length; i++) {
        if (dataTable.name[i]
            .toLowerCase()
            .contains(userSearchedName!.toLowerCase())) {
          searchedFilter.add(dataTable.name[i]);
          searchednumberFilter.add(dataTable.number[i]);
          searchedImageFilter.add(dataTable.photo[i]);
          searchedEmailFilter.add(dataTable.email[i]);
          sector.add(dataTable.sector[i]);
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
              userSearchedName = value;
            });
          },
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'এখানে অনুসন্ধান করুন',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 19),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchedFilter.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutPage(
                                  name: searchedFilter[index],
                                  number: searchednumberFilter[index],
                                  image: searchedImageFilter[index],
                                  email: searchedEmailFilter[index],
                                  sector: sector[index],
                                )));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                                imageUrl: searchedImageFilter[index])),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            searchedFilter[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(searchednumberFilter[index]),
                          Text("Feni")
                        ],
                      ),
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
          ));
        },
      ),
    );
  }
}
