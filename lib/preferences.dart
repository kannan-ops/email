import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool shoe = true;

  void bol()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('repeat', shoe);
    setState(() {
      shoe;
    });
  }

 Future<void> boi()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   shoe = (await prefs.getBool('repeat')! ?? true);
   setState(() {

   });
 }
 @override
  void initState() {
   boi();
   super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: shoe?ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(

          actions: [
            Switch(value: shoe,onChanged: (value)
            {
              setState(() {
                shoe=value;
                bol();
              });
            } )

            ],

        ),
      ),
    );
  }
}
