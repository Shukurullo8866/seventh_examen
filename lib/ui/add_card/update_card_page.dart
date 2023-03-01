import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../bloc/card_cubit/card_cubit.dart';
import '../../bloc/card_cubit/card_states.dart';
import '../../data/model/cart_model/cartModel.dart';
import '../../data/model/color_model/colors_model.dart';
import '../../service/widgets/add_card_textfield.dart';

class UpdateCardPage extends StatefulWidget {
  final CardModel cardModel;
  const UpdateCardPage({Key? key,required this.cardModel}) : super(key: key);

  @override
  State<UpdateCardPage> createState() => _UpdateCardPageState();
}

class _UpdateCardPageState extends State<UpdateCardPage> {
  int colorIndex = 0;

  String cardName = "";
  String owner = "";
  String number = "";
  String expireDate = "";
  String dropdownvalue = 'UzCard';
  Color gradientSecond = Colors.transparent;
  Color gradientFirst = Colors.deepPurpleAccent;
  Color gradientNew = Colors.transparent;

  void changeColor(Color color) {
    setState(() => gradientNew = color);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit,CardStates>(
      builder:(context, state) =>
      Scaffold(
        appBar: AppBar(
           title: Text("Update Card"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    gradientSecond,
                                    gradientFirst,
                                    gradientSecond,
                                  ],
                                ),),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Shaxsiy",
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      widget.cardModel.cardNumber,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      widget.cardModel.expireDate,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      cardName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      owner,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Image.asset(widget.cardModel.iconImage,width: 70,)
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: gradientNew,
                                          onColorChanged: changeColor,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Container(
                                            height: 10,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                                color: Colors.deepPurple),
                                          ),
                                          onPressed: () {
                                            setState(
                                                  () {
                                                if (gradientFirst ==
                                                    Colors.deepPurpleAccent) {
                                                  gradientFirst = gradientNew;
                                                } else {
                                                  gradientSecond = gradientNew;
                                                }
                                              },
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: const Icon(Icons.color_lens_outlined),
                          ),
                          AddCardTextfield(
                            txtType: TextInputType.number,
                            name: "Karta raqami",
                            hintText: "0000 0000 0000 0000",
                            onChanged: (value) {
                              setState(() {
                                if (value.toString().length % 4 == 0) {
                                  number = number + " ";
                                }
                                number = value;
                              });
                            },
                          ),
                          AddCardTextfield(
                            txtType: TextInputType.number,
                            name: "Amal qilish muddati",
                            hintText: "00/00",
                            onChanged: (value) {
                              expireDate = value;
                              setState(() {});
                            },
                          ),
                          AddCardTextfield(
                            initialvalue: widget.cardModel.cardName,
                            txtType: TextInputType.text,
                            name: "Karta nomi",
                            hintText: "My Card",
                            onChanged: (value) {
                              cardName = value;
                              setState(() {});
                            },
                          ),
                          AddCardTextfield(
                            initialvalue: widget.cardModel.owner,
                            txtType: TextInputType.text,
                            name: "Karta egasi to'liq ism sharifi",
                            hintText: "Palonchiyev Pistonchi",
                            onChanged: (value) {
                              owner = value;
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),

                        ]
                    ),
                  ),
                )),
            InkWell(
              onTap: () {
                context.read<CardsCubit>().updateCard(CardModel(
                    cardName: cardName,
                    cardNumber: widget.cardModel.cardNumber,
                    cardId: widget.cardModel.cardId,
                    owner: owner,
                    expireDate: widget.cardModel.expireDate,
                    userId: "shoptoli",
                    moneyAmount: 0,
                    // gradient: [
                    //   gradientFirst.toString().substring(10, 16),
                    //   gradientSecond.toString().substring(10, 16),
                    // ],
                    //
                    gradient2: gradientFirst.toString().substring(10, 16),
                    gradient1: gradientSecond.toString().substring(10, 16),
                    iconImage:widget.cardModel.iconImage

                ),

                );
                Future.delayed(const Duration(milliseconds:1000));
                Navigator.pop(context);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                margin:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24)),
                child: const Center(
                  child: Text(
                    "Update Card",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
