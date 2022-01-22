class Cart {
  String sepet_yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String yemek_siparis_adet;

  String kullanici_adi;
  Cart({
    required this.sepet_yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
    required this.yemek_siparis_adet,
    required this.kullanici_adi,
  });

  factory Cart.fromJson(Map<String, dynamic> map) => Cart(
      sepet_yemek_id: map["sepet_yemek_id"],
      yemek_adi: map["yemek_adi"],
      yemek_resim_adi: map["yemek_resim_adi"],
      yemek_fiyat: map["yemek_fiyat"],
      yemek_siparis_adet: map["yemek_siparis_adet"],
      kullanici_adi: map["kullanici_adi"]);
}
