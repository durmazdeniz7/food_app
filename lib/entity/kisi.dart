import 'dart:convert';

class Kisi {
  String id;
  String ad;
  String soyad;
  String telNo;
  String adres;
  Kisi({
    required this.id,
    required this.ad,
    required this.soyad,
    required this.telNo,
    required this.adres,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ad': ad,
      'soyad': soyad,
      'telNo': telNo,
      'adres': adres,
    };
  }

  factory Kisi.fromMap(String key, Map<String, dynamic> map) {
    return Kisi(
      id: key ,
      ad: map['ad'] ?? '',
      soyad: map['soyad'] ?? '',
      telNo: map['telNo'] ?? '',
      adres: map['adres'] ?? '',
    );
  }


}
