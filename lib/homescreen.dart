import 'package:firebase_auth/firebase_auth.dart';

import 'signinscreen.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child:
     ElevatedButton(onPressed: (){
       FirebaseAuth.instance.signOut().then((value) {
         print("signed out");
         Navigator.push(context,MaterialPageRoute(builder: (context)=>signinscreen()));

       });


       },
       child: (Text("logout ")),)),
    );
  }
}
