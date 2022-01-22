import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/contant.dart';
import 'package:food_app/cubit/detail_page_cubit.dart';

import 'package:food_app/entity/food.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
       appBar: AppBar(title: const Text("Detay"),),
       body: Column(
         children: [
           Image.network(Constant.imgUrl+widget.food.yemek_resim_adi),
           Text(widget.food.yemek_adi),
           Text(widget.food.yemek_fiyat),
           ElevatedButton(onPressed: (){
             context.read<DetailPageCubit>().addToCart(widget.food, "2");
             
           }, child: const Text("Sepete Ekle"))
         ],
       ),
        
    
        );
  }
}