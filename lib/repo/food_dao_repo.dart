import 'dart:convert';
import 'package:food_app/core/contant.dart';
import 'package:food_app/entity/cart.dart';
import 'package:food_app/entity/cart_response.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/entity/food.dart';
import 'package:food_app/entity/food_response.dart';

class FoodDaoRepo {
  List<Food> parseResponseFood(String body) {
    return FoodResponse.fromJson(jsonDecode(body)).yemekler;
  }

  List<Cart> parseResponseCart(String body) {
    try {
    return CartResponse.fromJson(jsonDecode(body)).sepet;
      
    } catch (e) {
      return <Cart>[];
    }
  }

  Future<List<Food>> getFood() async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var response = await http.get(url);
    return parseResponseFood(response.body);
  }

  Future<void> addToCart(Food food, String adet) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {
      "yemek_adi": food.yemek_adi,
      "yemek_resim_adi": food.yemek_resim_adi,
      "yemek_fiyat": food.yemek_fiyat,
      "yemek_siparis_adet": adet,
      "kullanici_adi": Constant.kullaniciAdi
    };
    var cevap = await http.post(url, body: veri);

    print(cevap.body);
  }

  Future<List<Cart>> getCart() async {
    var url = Uri.parse(
        "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi": Constant.kullaniciAdi};
    var response = await http.post(url, body: veri);

    return  parseResponseCart(response.body);
  }

  Future<void> deleteToCard(String id) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {"sepet_yemek_id": id, "kullanici_adi": Constant.kullaniciAdi};
    var cevap = await http.post(url, body: veri);
    print(cevap.body);
  }
}
