import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/auth/sign_up_page.dart';
import 'package:tuni_rand/pages/home_page.dart';
import 'package:tuni_rand/providers/auth.dart';
import 'package:tuni_rand/utils/colors.dart';
import 'package:tuni_rand/widgets/app_text_field.dart';
import 'package:tuni_rand/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {

   SignInPage({Key? key}) : super(key: key);
  var _emailController = TextEditingController(text:"");
  var _passwordController = TextEditingController(text:"");
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: height*0.05,),
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
            //welcome
            Container(
              margin: EdgeInsets.only(left: height/42.2),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",
                    style: TextStyle(
                      fontSize:(height/42.2)*3+((height/42.2)/2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Sign in your account",
                    style: TextStyle(
                      fontSize:(height/42.2),
                     // fontWeight: FontWeight.bold,
                      color:Colors.grey[500]
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 20,),
            AppTextField(textController: _emailController, hintText: "Email", icon: Icons.email),
            SizedBox(height: 20,),
            AppTextField(textController: _passwordController, hintText: "Password", icon: Icons.password_sharp,obscureText: true,),
            SizedBox(height: 20,),
            SizedBox(height:height/84.4 ,),
            //tag line
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text:TextSpan(
                        recognizer:TapGestureRecognizer()..onTap=()=>Get.back() ,
                        text:"Sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: height/42.2,
                        )
                    )
                ),
                SizedBox(width: height/42.2,)
              ],
            ),
            SizedBox(height:height*0.05 ,),
        InkWell(
          child:  Container(
            width: width/2,
            height: height/13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:AppColors.mainColor
            ),
            child: Center(
              child: BigText(
                text: "Sign in",
                size: 30,
                color: Colors.white,
              ),
            ),

          ),
          onTap: ()async {
            if (_emailController.text.isEmpty || _passwordController.text.isEmpty){
              print("email and password cannot be empty");
              return;
            }
            try{
             final user = await Auth.signInWithEmail(email: _emailController.text, password: _passwordController.text);
             if (user != null) {
               print ("login successful");
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
             }
            }catch(e){
                    print (e);
            }
          },
        ),

            SizedBox(height:height*0.05 ,),
            //sign up options
            RichText(
                text:TextSpan(
                    text:"Don\'t have an account ? ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: height/42.2,
                    ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                    text:"Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: height/42.2,
                    )),
                  ]
                )
            ),

          ],
        ),
      ),
    );
  }
}
