class Food {
  String? yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  Food({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
  });

  Food.withOutID(this.yemek_adi,this.yemek_resim_adi,this.yemek_fiyat);

  factory Food.fromJson(Map<String, dynamic> map) => Food(
      yemek_id: map["yemek_id"],
      yemek_adi: map["yemek_adi"],
      yemek_resim_adi: map["yemek_resim_adi"],
      yemek_fiyat: map["yemek_fiyat"]);
}
