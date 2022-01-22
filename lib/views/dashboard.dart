
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/dashboard_cubit.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/views/cart_views.dart';
import 'package:food_app/views/detail_page.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({ Key? key }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashBoardCubit>().getFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartViews()));
          }, icon: const Icon(Icons.card_travel))
        ],
      ),
      
      body: BlocBuilder<DashBoardCubit,List<Food>>(
        builder:(context, food) {
          if (food.isNotEmpty) {
            return ListView.builder(
              itemCount: food.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(title: Text(food[index].yemek_adi),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(food: food[index],)));
                  },
                  ),
                );
              }, 
              );
          }
          else{
            return const Center();
          }
          
        },
      ),
      
    );
  }
}