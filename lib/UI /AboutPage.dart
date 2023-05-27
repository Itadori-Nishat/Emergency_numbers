import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  final String? name, number, image,email,sector;
   AboutPage({Key? key, this.name,  this.number, this.image, this.email, this.sector}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      backgroundColor: Colors.teal.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ClipOval(
                 child: Center(
                   child: CachedNetworkImage(
                     filterQuality: FilterQuality.high,
                     imageUrl: image.toString(),fit: BoxFit.cover,),
                 ),
               ),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    name.toString(),
                    style: TextStyle(
                        fontFamily: "Serif",
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                // Doctor Type


                Center(
                  child: Text(
                    sector.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 10,
                ),
                Text(
                  "ঠিকানা এবং অন্যান্য তথ্য :",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 4,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.teal.shade300,

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,size: 25,),
                            SizedBox(width: 15,),
                            Text("S.S.K Road, Feni", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Icon(Icons.phone,),
                            SizedBox(width: 15,),
                            GestureDetector(
                              onLongPress: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.teal,
                                    content: Text("Number has been copied"),
                                    duration: Duration(seconds: 2),  ),);
                                Clipboard.setData(ClipboardData(text: number.toString()));
                              },
                              child: Text(number.toString(), style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                              ),),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Icon(Icons.email,),
                            SizedBox(width: 15,),
                            GestureDetector(
                              onLongPress: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.teal,
                                    content: Text("Email has been copied"),
                                    duration: Duration(seconds: 2),  ),);
                                Clipboard.setData(ClipboardData(text: email.toString()));
                              },
                              child: Text(email.toString(), style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                              ),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
