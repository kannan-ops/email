import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kings/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
final ThemeData lightheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    cardColor: Colors.blue,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orange,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black,fontSize:18),
        bodyMedium: TextStyle(color: Colors.white)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black
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
        backgroundColor: Colors.pink,
        titleTextStyle: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white,fontSize: 18),
        bodyMedium: TextStyle(color: Colors.white)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        )
    )
);
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final the = GlobalKey<FormState>();

  bool dark = false;
  void bol()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('repeat', dark);
    setState(() {
      dark;
    });
  }

  Future<void> boi()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dark = (await prefs.getBool('repeat')! ?? true);
    setState(() {

    });
  }
  @override
  void initState() {
    boi();
    super.initState();

  }

  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId : "841967297444-h00uv65g2dm5t09eqruh102q0jmd31u7.apps.googleusercontent.com"
  );

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

    } catch (e) {
      print(e.toString());
    }
  }
  Log_in(BuildContext context) async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>home()));

  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'THEME ',
      debugShowCheckedModeBanner: false,
      theme: dark ?ThemeData( brightness: Brightness.light,
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          secondaryHeaderColor: Colors.black,
          cardColor: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.orange,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.black)
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black,fontSize:18),
              bodyMedium: TextStyle(color: Colors.white)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black
              )
          )):ThemeData( brightness: Brightness.dark,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          secondaryHeaderColor: Colors.white,
          cardColor: Colors.green,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.pink,
              titleTextStyle: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.white)
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white,fontSize: 18),
              bodyMedium: TextStyle(color: Colors.white)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              )
          )),
      home:
      Scaffold(
          appBar: AppBar(
            title: Text("THEME DEMO"),


            actions: [
              IconButton(
                icon:Icon(dark ? Icons.light_mode:Icons.dark_mode),
                onPressed:(){
                  setState(() {
                    dark = !dark;
                  });
                }, ),
              Switch(value: dark,onChanged: (value)
              {
                setState(() {
                  dark=value;
                  bol();
                });
              } )
            ],
          ),
          body:Form(
            key: the,
            child:
            Column(
                    children: [
                      Column(
                        children: [SizedBox(height: 150,),
                          Text("Login",style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Column(
                        children: [SizedBox(height: 30,),

                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: "ENTER YOUR EMAIL",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            validator: (input){
                              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!))
                              {
                                return "enter valid e-mail";
                              }
                              return null;
                            },
                            onChanged: (h){
                              email.text.isNotEmpty && password.text.isNotEmpty ? dark=true:dark=false;
                            },


                          ),
                          SizedBox(height: 40,),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                                icon: Icon(Icons.password),
                                hintText: "ENTER YOUR password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            validator: (input){
                              if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$').hasMatch(input!))
                              {
                                return "enter valid password";
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [SizedBox(height: 100,),
                              SizedBox(width: 70,),
                              ElevatedButton(onPressed: () async {
                                if(the.currentState!.validate()){
                                  await login();
                                  Navigator.pushReplacement
                                    (context,
                                      MaterialPageRoute(builder: (builder)=>home()));

                                }
                              }, child:Text("login",style: TextStyle(color: Colors.white,fontSize: 15),),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent
                                ),
                              ),
                              SizedBox(width: 50,),
                              ElevatedButton(onPressed: (){
                                signInWithGoogle();
                              }, child:Text("Google signin",style: TextStyle(color: Colors.white,fontSize: 15),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent
                                  )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("If you don't have  the account?",style: TextStyle(color: Colors.red,fontSize:15,fontWeight: FontWeight.bold),),
                              SizedBox(width: 20,),
                              ElevatedButton(onPressed: (){
                                Navigator.push
                                  (context,
                                    MaterialPageRoute(builder: (context)=>signin()));
                              }, child:Text("signup",style: TextStyle(color: Colors.pink,fontSize: 20),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.cyan
                                  )
                              )],
                          ),
                          Column(
                            children: [SizedBox(height:30,),
                              Center(
                                child: ElevatedButton(onPressed: (){
                                  setState(() {
                                    dark = !dark;
                                  });
                                }, child:Text(dark ? 'Switch to light mode' : 'Switch to dark mode') ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                )


            ),


    );

  }
}
