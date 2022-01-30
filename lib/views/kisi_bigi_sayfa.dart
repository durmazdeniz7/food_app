import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/kisi_cubit.dart';
import 'package:food_app/entity/kisi.dart';

class KisiBilgi extends StatefulWidget {
  const KisiBilgi({Key? key}) : super(key: key);

  @override
  _KisiBilgiState createState() => _KisiBilgiState();
}

class _KisiBilgiState extends State<KisiBilgi> {
  var tfAd = TextEditingController();
  var tfSoyad = TextEditingController();
  var tTelNo = TextEditingController();
  var tfAdres = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Bilgi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            builtText(tfAd, "Ad", "Adınızı Giriniz"),
            builtText(tfSoyad, "Soyad", "Soyadınızı Giriniz"),
            builtText(tTelNo, "Telefon Numarası", "Telefon Numaranızı Giriniz"),
            builtText(tfAd, "Adres", "Adresinizi Giriniz"),
            ElevatedButton(
                onPressed: () {
                  context.read<KisiCubit>().add(Kisi(
                      id: "",
                      ad: tfAd.text,
                      soyad: tfSoyad.text,
                      telNo: tTelNo.text,
                      adres: tfAdres.text));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Eklendi")));
                },
                child: const Text("Ekle"))
          ],
        ),
      ),
    );
  }

  Widget builtText(
      TextEditingController controller, String labelT, String hinT) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hinT,
            labelText: labelT,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)))),
      ),
    );
  }
}
