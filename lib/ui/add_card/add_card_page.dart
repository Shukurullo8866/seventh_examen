import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../bloc/card_cubit/card_cubit.dart';
import '../../bloc/card_cubit/card_states.dart';
import '../../data/model/cart_model/cartModel.dart';
import '../../service/widgets/add_card_textfield.dart';
import '../../service/widgets/add_card_txtString.dart';
import '../../utils/my_utils.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  int colorIndex = 0;
  String number = "";
  String expireDate = "";
  String cardName = "";
  String owner = "";
  String dropdownvalue = 'UzCard';
  Color gradientSecond = Colors.transparent;
  Color gradientFirst = Colors.deepPurpleAccent;
  Color gradientNew = Colors.transparent;

  void changeColor(Color color) {
    setState(() => gradientNew = color);
  }

  var items = [
    'UzCard',
    'Humo',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit, CardStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Add Card Page")),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
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
                            ),
                          ),
//
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Shaxsiy",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    number,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    expireDate,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    cardName,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
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
                              Image.asset(
                                dropdownvalue == "UzCard"
                                    ? "assets/images/uzcard.png"
                                    : "assets/images/humo.png",
                                width: 70,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
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
                                          decoration: BoxDecoration(
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
                          lenth: 19,
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
                        AddCardTextfieldString(
                          txtType: TextInputType.text,
                          name: "Karta nomi",
                          hintText: "My Card",
                          onChanged: (value) {
                            cardName = value;
                            setState(() {});
                          },
                        ),
                        AddCardTextfieldString(
                          txtType: TextInputType.text,
                          name: "Karta egasi to'liq ism sharifi",
                          hintText: "Palonchiyev Pistonchi",
                          onChanged: (value) {
                            owner = value;
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 60,
                          width: double.infinity,
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(24),
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ]),
                ),
              )),
              InkWell(
                onTap: () {
                  context.read<CardsCubit>().addCard(
                        CardModel(
                            cardName: cardName,
                            cardNumber: number,
                            cardId: "cardId",
                            owner: owner,
                            expireDate: expireDate,
                            userId: "shoptoli",
                            moneyAmount: 0,
                            gradient1: gradientFirst.toString().substring(10,16),
                            gradient2: gradientSecond.toString().substring(10,16),

                            iconImage: dropdownvalue == "UzCard"
                                ? "assets/images/uzcard.png"
                                : "assets/images/humo.png"),
                      );
                  MyUtils.getMyToast(message: " Card qo'shildi");
                  Future.delayed(Duration(milliseconds: 800));
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
                      "Add Card",
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
        );
      },
    );
  }
}
