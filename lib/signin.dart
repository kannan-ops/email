import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {

  final valid = GlobalKey<FormState>();

  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();


  Sign_in() async
  {
    await FirebaseAuth.instance.createUserWithEmailAndPassword
      (email: email.text,
        password: pass.text);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => home()), (route) => false);
  }
    @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("SIGNIN"),
          backgroundColor: Colors.white,
          actions: [
            Icon(Icons.logout),

          ],
        ),
        body:
        Form(
          key: valid,
          child: Column(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.lightBlue
                ),
                child:
                Column(
                  children: [
                    Column(
                      children: [SizedBox(height: 150,),
                        Text("SIGNIN", style: TextStyle(color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      children: [SizedBox(height: 30,),

                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: "ENTER YOUR EMAIL",
                              border: OutlineInputBorder()
                          ),
                          validator: (input) {
                            if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(input!)) {
                              return "enter valid e-mail";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40,),
                        TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: "ENTER YOUR password",
                              border: OutlineInputBorder()
                          ),
                          validator: (input) {
                            if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$')
                                .hasMatch(input!)) {
                              return "enter valid password";
                            }
                            return null;
                          },
                        ),


                        Row(
                          children: [
                            SizedBox(height: 150, width: 130,),

                            ElevatedButton(onPressed: () async {
                              if (valid.currentState!.validate()) {
                                await Sign_in();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (builder) => home()));
                              }
                            }
                                ,
                                child: Text("SIGNIN", style: TextStyle(
                                    color: Colors.white, fontSize: 30),),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),

              )

            ],
          ),
        ),
      );
  }
}


