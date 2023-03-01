import '../../data/model/cart_model/cartModel.dart';

abstract class CardStates {}

class LoadCardinProgress extends CardStates {}

class LoadCardInSucces extends CardStates {
  LoadCardInSucces({required this.cards});
  List<CardModel> cards;
}
