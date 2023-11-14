import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4fa),
      body: SwipeTo(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"))),
          width: screenwidth*0.8,height: screenheight,),
        ),
        onLeftSwipe: () {
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return const LoginScreen();
          }));
        },
    onRightSwipe: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }
      )
      );
    }),
    );
  }
}
