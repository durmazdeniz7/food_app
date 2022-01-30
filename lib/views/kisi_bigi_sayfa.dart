import 'package:flutter/material.dart';

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
