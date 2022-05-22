import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuni_rand/pages/offres/offres_overview_page.dart';
import 'package:tuni_rand/providers/auth.dart';

import 'auth/sign_in_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OffresOveriew();

    /*return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Admin Page"),
            RaisedButton(child:Text("log out"),onPressed: (){
              Auth.logOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
            })
          ],
        ),
      ),
    );
  }

     */


  }

}
