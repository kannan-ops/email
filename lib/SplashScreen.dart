import 'package:flutter/material.dart';
import 'package:kings/login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:3),()
    {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bird.png"))
        ),
      ),
    );
  }
}
