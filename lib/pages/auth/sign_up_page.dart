import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/auth/sign_in_page.dart';
import 'package:tuni_rand/utils/colors.dart';
import 'package:tuni_rand/widgets/app_text_field.dart';
import 'package:tuni_rand/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../providers/auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = new  TextEditingController();
  final TextEditingController _confirmPasswordController = new  TextEditingController();
  final TextEditingController _passwordController = new  TextEditingController();
  final TextEditingController _nameController = new  TextEditingController();
  final TextEditingController _phoneController = new  TextEditingController();
  final TextEditingController _genreController = new  TextEditingController();
  final TextEditingController _villeController = new  TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var signupImages = [
      "t.png",
      "f.png",
      "g.png"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 195,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/logo.jpg"),
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.only(left: 20,right:20 ),
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: TextField(
              controller: _emailController,
              obscureText: false,
              decoration: InputDecoration(
               hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.yellow,
                  ),
                  //focus border
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      )),
                  //enabled Border
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right:20 ),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 10),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ]),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.password_sharp,
                      color: Colors.yellow,
                    ),
                    //focus border
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    //enabled Border
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right:20 ),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 10),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ]),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(
                      Icons.password_sharp,
                      color: Colors.yellow,
                    ),
                    //focus border
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    //enabled Border
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ),
            SizedBox(height: 20,),

            //sign up button
        InkWell(
         child: Container(
            width: width/2,
            height: height/13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:AppColors.mainColor
            ),
            child: Center(
              child: BigText(
                text: "Sign up",
                size: 30,
                color: Colors.white,
              ),
            ),

          ),
          onTap: (){
            if (_emailController.text.isEmpty || _passwordController.text.isEmpty){
              print("email and password cannot be empty");
              return;
            }
            if (_confirmPasswordController.text.isEmpty || _confirmPasswordController.text != _passwordController.text)    {
              print("confirm password does not empty");
              return ;
            }

             Auth.signUpWithEmail(email: _emailController.text, password: _passwordController.text,role:"user").then((value) async{
               User? user = FirebaseAuth.instance.currentUser;
               await FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
                 'uid': user?.uid,
                 'email': _emailController.text,
                 'password':  _passwordController.text,
                 'role': 'user',
               });
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));});


    },
        ),

            SizedBox(height:height/84.4 ,),
            //tag line
            RichText(
              text:TextSpan(
                recognizer:TapGestureRecognizer()..onTap=()=>Get.back() ,
                text:"Have an account already ?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: height/42.2,
                )
              )
            ),
            SizedBox(height:height*0.05 ,),
            //sign up options
            RichText(
                text:TextSpan(
                    text:"Sign up using one of the following methods",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: height/50,
                    )
                )
            ),
            Wrap(
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: height/28.13,
                  backgroundImage: AssetImage(
                    "assets/images/"+signupImages[index],
                  ),

                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
