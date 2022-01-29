import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/repo/auth_service.dart';

import 'package:provider/provider.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<KayitOl> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var sifreKontrol = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var myAuth = Provider.of<AuthService2>(context);
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  validator: (String? email) {
                    if (!EmailValidator.validate(email!)) {
                      return "Geçerli Bir Email Giriniz";
                    }
                  },
                  controller: controller1,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (sifre) {
                    if (sifre!.length < 6) {
                      return "Şifre 6 karakterden az olamaz";
                    }
                  },
                  controller: controller2,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Şifre",
                      labelText: "Şifre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  onSaved: (newValue) {
                    sifreKontrol = newValue!;
                  },
                  validator: (sifreTekrar) {
                    if (sifreTekrar != controller2.text) {
                      return "Girdiğiniz Şifreler uyuşmamaktatır";
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Şifre Tekrar",
                      labelText: "Şifre Şifre Tekrar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      myAuth.createUserWithEmailAndPassword(
                          controller1.text, controller2.text);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const Text(
                      "Kayıt Ol",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    myAuth.signInWithGoogle();
                  },
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 250,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/google.png")),
                          const Text(
                            "Google ile Kayıt Ol",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}