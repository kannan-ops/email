import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Center(child: Text("MY HOME",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text("Hello",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Kannan",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      );


  }
}
