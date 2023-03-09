import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/card_cubit/card_cubit.dart';
import '../../../bloc/card_cubit/card_states.dart';
import '../../../data/model/cart_model/cartModel.dart';
import '../../add_card/add_card_page.dart';
import '../../add_card/update_card_page.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Info"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<CardsCubit, CardStates>(
        builder: (context, state) {
          if (state is LoadCardinProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadCardInSucces) {
            List<CardModel> item = state.cards;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          ConvertToHex.hexColor(item[index].gradient1),
                        ),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.deepPurple,
                    gradient: LinearGradient(
                      colors: [
                        Color(
                          ConvertToHex.hexColor(item[index].gradient2),
                        ),
                        Color(
                          ConvertToHex.hexColor(item[index].gradient1),
                        ),
                        Color(
                          ConvertToHex.hexColor(item[index].gradient2),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Shaxsiy",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            item[index].cardNumber,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item[index].expireDate,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item[index].cardName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 7),
                          Text(item[index].owner,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item[index].iconImage,
                            width: 65,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text(
                                          "Are you sure you want to delete it ?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Noo",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              //context.read<UsersCubit>().deleteUser(userModel.id);
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Yes",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 21,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateCardPage(
                                              cardModel: item[index]),
                                        ));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ConvertToHex {
  static hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    int colorint = int.parse(colornew);
    return colorint;
  }
}
