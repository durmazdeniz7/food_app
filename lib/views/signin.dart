import 'package:flutter/material.dart';
import 'package:food_app/repo/auth_service.dart';
import 'package:provider/provider.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  var controller1=TextEditingController();
  var controller2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myAuth=Provider.of<AuthService2>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller1,
                decoration:const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    )),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: controller2,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Şifre",
                    labelText: "Şifre",
                    border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(25)
                       )
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                 myAuth.signInWithEmailAndPassword(controller1.text, controller2.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Text(
                    "Giriş Yap",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  myAuth.signInWithGoogle();
                  
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: 250,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children: [
                    SizedBox(height: 40,width: 40, child: Image.asset("assets/google.png")),
                    const Text(
                      "Google ile Giriş Yap",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}