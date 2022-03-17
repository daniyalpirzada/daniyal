import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void abc() async{
    try {
 await _auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text
      );

if(user!= null && !user!.emailVerified)
  {
     await user!.sendEmailVerification();
print("email sent");
  }
else
  {
  Navigator.push(context,MaterialPageRoute(builder: (context)=>homescreen()));
  }





    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>homescreen()));
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(hintText: "Enter Username", labelText: "Email"),
            controller: username,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter Email", labelText: "Email"),
            controller: email,
          ),

          TextField(
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
            controller: password,
          ),

          ElevatedButton(onPressed: abc












            , child: (Text("SignUp")),),



        ] ,
      ),
    );
  }
}
