import 'package:flutter/material.dart';


final ThemeData lightheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  secondaryHeaderColor: Colors.black,
  cardColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.white)
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black,fontSize: 20),
    bodyMedium: TextStyle(color: Colors.white)
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white
    )
  )
);
final ThemeData darttheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  secondaryHeaderColor: Colors.white,
  cardColor: Colors.green,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.black)
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white,fontSize: 20),
    bodyMedium: TextStyle(color: Colors.white)
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    )
  )
);

class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  bool thedark = false;
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'THEME DEMO',
      debugShowCheckedModeBanner: false,
      theme: thedark ? darttheme : lightheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("THEME DEMO"),
          actions: [
            IconButton(
              icon:Icon(thedark ? Icons.light_mode:Icons.dark_mode),
              onPressed:(){
                setState(() {
                  thedark = !thedark;
                });
              }, )
          ],
        ),
        body:
       Column(
         children: [SizedBox(height: 100,),
           Center(
             child: ElevatedButton(onPressed: (){
               setState(() {
                 thedark = !thedark;
               });
             }, child:Text(thedark ? 'Switch to light mode' : 'Switch to darkmode') ),
           ),
           Text("data")
         ],
       )
        
      ),
    );



  }
}
