import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'signupscreen.dart';
import 'homescreen.dart';
import 'google.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

facebooklogin()
{
print("hello");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
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
          ElevatedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>signupscreen()));
    },
            child: (Text("SignUp")),),
          ElevatedButton(onPressed: (){


              FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text)
                .then((value) => {


              Navigator.push(context,MaterialPageRoute(builder: (context)=>homescreen()))


            });


          }, child: (Text("SignIn")),)
          ,
          ElevatedButton(onPressed: (){
            FirebaseAuth.instance.sendPasswordResetEmail(email: email.text)
                .then((value) => Navigator.of(context).pop());


          }, child: (Text("Forgot Password")),),

          ElevatedButton(onPressed: googleLogin, child: (Text("Google Login")),),
          TextButton(onPressed: logout, child: Text("Google logout")),

          ElevatedButton(onPressed: facebooklogin, child: (Text("Facebook Login")),)


        ] ,
      ),
    );
  }
}
