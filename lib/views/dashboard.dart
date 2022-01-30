import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/contant.dart';
import 'package:food_app/cubit/dashboard_cubit.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/repo/auth_service.dart';
import 'package:food_app/views/cart_views.dart';
import 'package:food_app/views/detail_page.dart';
import 'package:food_app/widgets/my_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    context.read<DashBoardCubit>().getFood();
  }

  @override
  Widget build(BuildContext context) {
    var myAuth=Provider.of<AuthService2>(context);
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.person,color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline1,
                children: [
              TextSpan(
                  text: "Flutter",
                  style:
                      GoogleFonts.prompt(color: Colors.yellow, fontSize: 24)),
              TextSpan(
                  text: "Dishhes",
                  style: GoogleFonts.prompt(
                      color: Colors.grey[800], fontSize: 24)),
            ])),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartViews()));
              },
              icon: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.grey[800],
              ))
        ],
      ),
      body: BlocBuilder<DashBoardCubit, List<Food>>(
        builder: (context, food) {
          if (food.isNotEmpty) {
            return GridView.builder(
              itemCount: food.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 2.5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(
                              food: food[index],
                            )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Column(
                      children: [
                        // const Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Align(
                        //     child: Icon(Icons.favorite_border),
                        //     alignment: Alignment.topRight,
                        //   ),
                        // ),
                        Hero(
                          tag: food[index].yemek_resim_adi,
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(Constant.imgUrl +
                                        food[index].yemek_resim_adi))),
                          ),
                        ),
                        Text(
                          food[index].yemek_adi,
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 18),
                        ),
                        Text(
                          food[index].yemek_fiyat + " ₺",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
