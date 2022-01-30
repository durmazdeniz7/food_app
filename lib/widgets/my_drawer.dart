import 'package:flutter/material.dart';
import 'package:food_app/repo/auth_service.dart';
import 'package:food_app/views/kisi_bigi_sayfa.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var myAuth=Provider.of<AuthService2>(context);
    return Drawer(
      
      child: ListView(
        children: [
         const UserAccountsDrawerHeader(accountName: Text("Deniz"), accountEmail: Text("durmazdeniz7@gmail.com")),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const KisiBilgi()));
            },
            title: Text("Adres Bilgisi Ekle"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
         
          ListTile(
            title: Text("Çıkış Yap"),
            trailing: Icon(Icons.arrow_forward_ios),

            onTap: (){
              myAuth.signOut();
            },
          )
        ],
      ),

      
      
    );
  }
}