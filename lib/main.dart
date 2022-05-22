import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tuni_rand/pages/auth/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tuni_rand/pages/offres/offre_detail_page.dart';
import 'package:tuni_rand/pages/offres/offres_overview_page.dart';
import 'package:tuni_rand/pages/splachScreen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import './providers/offers_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: SignUpPage(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) =>  Offers(),
      child: MaterialApp(
        title:'TUNI RAND',
        theme: ThemeData(
          fontFamily: 'lato'
        ),
        home: OffresOveriew(),
        routes:{
          OffreDetail.routeName:(ctx) => OffreDetail(),
        },
      ),
    );
  }
  }



/*final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
print(user);
if(user != null){
return SplachScreen();
}
return SignInPage();

 */

