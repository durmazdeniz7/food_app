import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/entity/kisi.dart';
import 'package:food_app/repo/kisi_dao.dart';

class KisiCubit extends Cubit<void> {
  KisiCubit() : super(0);
  KisiDao kisiDao=KisiDao();
  var refKisi=FirebaseDatabase.instance.reference().child("kisi");

  Future<void> add(Kisi kisi)async{
await kisiDao.add(kisi);
  }
  
}