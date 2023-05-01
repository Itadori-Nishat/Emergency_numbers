import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'DataXpolice.dart';
import '../AboutPage.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PoliceSearchResultShow()));
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
                        "Search police by name",
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
                                    bp: dataTable.BP[index],
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
                                  child: Image.network(dataTable.photo[index])),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataTable.name[index],
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                Text(dataTable.number[index]),
                                Text("Location")
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
                          icon: Icon(_isFav?Icons.favorite: Icons.favorite_border,color: _isFav?Colors.red:Colors.black54,
                          )),
                    ],
                  ),
                ));
              },
            ),
          ),
        ],
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
    List<String> searchedFilter = [ ];
    List<String> searchednumberFilter = [ ];
    List<String> searchedImageFilter = [ ];
    List<String> searchedEmailFilter = [ ];
    List<String> searchedBP = [ ];
    List<String> sector = [ ];
    if(userSearchedName == null || userSearchedName!.isEmpty) {
    } else {
      for (int i = 0; i<dataTable.name.length; i++) {
        if(dataTable.name[i].toLowerCase().contains(userSearchedName!.toLowerCase())){
          searchedFilter.add(dataTable.name[i]);
          searchednumberFilter.add(dataTable.number[i]);
          searchedImageFilter.add(dataTable.photo[i]);
          searchedEmailFilter.add(dataTable.email[i]);
          searchedBP.add(dataTable.BP[i]);
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
          style: const TextStyle(fontSize: 16.0,color: Colors.black),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search police by name',
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
                                  bp: searchedBP[index],
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
                          SizedBox(width: 15,),
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
