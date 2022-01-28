import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/contant.dart';
import 'package:food_app/cubit/cart_cubit.dart';
import 'package:food_app/cubit/detail_page_cubit.dart';
import 'package:food_app/entity/cart.dart';
import 'package:food_app/entity/food.dart';

class DetailPage extends StatefulWidget {
  final Food food;

  const DetailPage({required this.food, Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
var myList=<Cart>[];



  int adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("DetailPage"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 100,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                    ),
                  )),
              Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 130,
                child: Hero(
                    tag: widget.food.yemek_resim_adi,
                    child: Image.network(
                        Constant.imgUrl + widget.food.yemek_resim_adi)),
              ),
              Positioned(
                  top: 250,
                  left: 15,
                  child: Text(
                    widget.food.yemek_fiyat + " ₺",
                    style: TextStyle(fontSize: 24, color: Colors.grey[900]),
                  )),
              Positioned(
                top: 275,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.yemek_adi,
                      style: const TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (adet == 1) {
                                  adet = 1;
                                } else {
                                  adet--;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(adet.toString(),
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white))),
                          InkWell(
                            onTap: () {
                              setState(() {
                                adet++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 335,
                child: SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      myCont(),
                      myCont(),
                      myCont(),
                      myCont(),
                      myCont(),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            height: 80,
            child: const Text("Sepete ekle"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
          context
              .read<DetailPageCubit>()
              .addToCart(widget.food, adet.toString(),);
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }

  Widget myCont() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 180,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(),
          image: DecorationImage(
              image:
                  NetworkImage(Constant.imgUrl + widget.food.yemek_resim_adi))),
    );
  }
}
