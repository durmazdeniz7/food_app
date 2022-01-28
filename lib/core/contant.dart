import 'package:food_app/entity/cart.dart';

class Constant {
static const String kullaniciAdi="denizdurmaz";
static const String imgUrl="http://kasimadalan.pe.hu/yemekler/resimler/";

static int sepetTutarHesapla(List<Cart> list){
  int toplam=0;
  for (var i = 0; i < list.length; i++) {
  toplam+=int.parse(list[i].yemek_fiyat)*int.parse(list[i].yemek_siparis_adet);
  }
  return toplam;

}


}