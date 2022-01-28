import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/contant.dart';
import 'package:food_app/cubit/cart_cubit.dart';
import 'package:food_app/entity/cart.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/repo/food_dao_repo.dart';

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Sepet",
          style: TextStyle(fontSize: 24, color: Colors.yellowAccent),
        ),
      ),
      body: BlocBuilder<CartCubit, List<Cart>>(builder: (context, state) {
        if (state.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                  
                    return Card(
                      // color: Colors.lightBlue,
                      elevation: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () async {
                                await context
                                    .read<CartCubit>()
                                    .deleteToCard(state[index].sepet_yemek_id);
                                context.read<CartCubit>().getCard();
                              },
                              child: const Icon(Icons.cancel)),
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(Constant.imgUrl +
                                  state[index].yemek_resim_adi)),
                          Column(
                            children: [
                              Text(
                                state[index].yemek_adi,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(state[index].yemek_siparis_adet,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.grey)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(
                              (int.parse(state[index].yemek_fiyat) *
                                          int.parse(
                                              state[index].yemek_siparis_adet))
                                      .toString() +
                                  " ₺",
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.grey)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(Constant.sepetTutarHesapla(state).toString()),
                      SizedBox(
                          child: Chip(
                        label: const Text("Siparişi Tamamla"),
                        backgroundColor: Colors.orange,
                      ))
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center();
        }
      }),
    );
  }

  int toplam(List<Cart> num) {
    int toplam = 0;
    for (var item in num) {
      toplam = int.parse(item.yemek_fiyat) + int.parse(item.yemek_siparis_adet);
    }
    return toplam;
  }
}
