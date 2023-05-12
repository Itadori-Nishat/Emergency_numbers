import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  String? name;
  String? number;
  String? image;
  String? email;
  String? bp;
  String? sector;
   AboutPage({Key? key, this.name,  this.number, this.image, this.email, this.bp, this.sector}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                Text(
                  name.toString(),
                  style: TextStyle(
                      fontFamily: "Serif",
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                // Doctor Type


                Text(
                  sector.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10,
                ),
                Text(
                  "SP, Feni Police Station",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10,
                ),
                Text(
                  " Address & other information ",

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
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text("BP-",style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15
                            ),),
                            SizedBox(width: 15,),
                            Text(bp.toString(), style: TextStyle(
                                fontSize: 16,
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
                                Clipboard.setData(ClipboardData(text: number));
                              },
                              child: Text(number.toString(), style: TextStyle(
                                  fontSize: 16,
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
                                Clipboard.setData(ClipboardData(text: email));
                              },
                              child: Text(email.toString(), style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: height*.3,
                  child: Text("Deterring crimes and assure community through high-visibility policing."
                      "Patrolling assigned areas and monitor activities to protect people/property."
                      "Investigating crimes and apprehending suspected law violators",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(.6), fontWeight: FontWeight.w400),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
