import 'package:flutter/material.dart';
import 'package:food_app/repo/auth_service.dart';
import 'package:food_app/views/dashboard.dart';
import 'package:food_app/views/register.dart';
import 'package:food_app/views/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    var myAuth = Provider.of<AuthService2>(context);


  switch (myAuth.getKullaniciDurumu) {
    case KullaniciDurumu.OturumAcilmamis:return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.headline1,
                  children: [
                TextSpan(
                  
                    text: "Flutter",
                    style:
                        GoogleFonts.prompt(color: Colors.yellow, fontSize: 24)),
                TextSpan(
                    text: "Dishhes",
                    style: GoogleFonts.prompt(
                        color: Colors.grey[800], fontSize: 24)),
              ])),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
            Tab(
              icon: Icon(Icons.app_registration,color: Colors.black,),
              text: "Giriş Yap",
            ),
            Tab(
              icon: Icon(Icons.settings_applications_rounded),
              text: "Kayıt Ol",
            ),
          ]),
        ),
        body: const TabBarView(children: [GirisYap(), KayitOl()]),
      ),
    );

    case KullaniciDurumu.OturumAcilmis:return const DashBoard();
    case KullaniciDurumu.OturumAciliyor: return Center(child: CircularProgressIndicator(),);
      
      
  }


    
  }
}