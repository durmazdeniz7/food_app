
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/cart_cubit.dart';

import 'package:food_app/entity/cart.dart';

class CartViews extends StatefulWidget {
  
  const CartViews({
    Key? key,
  }) : super(key: key);

  @override
  _CartViewsState createState() => _CartViewsState();
}

class _CartViewsState extends State<CartViews> {
@override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepet"),),
      body: BlocBuilder<CartCubit,List<Cart>>(
         builder:(context, state) {
           if(state.isNotEmpty){
           return ListView.builder(
             itemCount: state.length,
             itemBuilder:(context, index) {
            return   Row(
              children: [
                Text(state[index].yemek_adi),
                IconButton(onPressed: (){
                  context.read<CartCubit>().deleteToCard(state[index].sepet_yemek_id);
                  context.read<CartCubit>().getCard();
                }, icon: const Icon(Icons.delete))
              ],
            );
             },
           );}
           else{
             return const Center(child: CircularProgressIndicator(),);
           }
         },
      ),
      
    );
  }
}