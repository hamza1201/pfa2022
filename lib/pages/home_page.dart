import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/auth/sign_in_page.dart';
import 'package:tuni_rand/providers/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Home Page"),
            RaisedButton(child:Text("log out"),onPressed: (){
              Auth.logOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
            })
          ],
        ),
      ),
    );
  }
}
