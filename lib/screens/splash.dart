import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/screens/home.dart';
import 'package:user/screens/login.dart';
import 'package:user/screens/signup.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = 'LogIn';

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    whereToGo();
  }
  // @override
  // void initState() {
  //   Timer(const Duration(seconds: 1), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const SignUp(),
  //       ),
  //     );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color.fromARGB(255, 91, 2, 113),
              Color.fromARGB(255, 219, 106, 7),
              Color.fromARGB(255, 112, 4, 81),
              Color.fromARGB(255, 13, 196, 220),
              Color.fromARGB(255, 46, 2, 55),
              Color.fromARGB(255, 213, 22, 92),
              Color.fromARGB(255, 13, 196, 220),
              Color.fromARGB(255, 219, 106, 7),
              Color.fromARGB(255, 104, 6, 97),
            ],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), (){
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return const HomeScreen();
          }));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return const LogIn();
          }));
        }
        
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return const SignUp();
        }));
      }
    });

  }
}
