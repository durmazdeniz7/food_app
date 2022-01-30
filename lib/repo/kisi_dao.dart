
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/entity/kisi.dart';

class KisiDao {
  var refKisi=FirebaseDatabase.instance.reference().child("kisi");
  Future<void> add(Kisi kisi) async{
refKisi.push().set(kisi.toMap());
  }
}