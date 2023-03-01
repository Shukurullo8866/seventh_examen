import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/cart_model/cartModel.dart';
import '../../data/repository/card_repository.dart';
import 'card_states.dart';

class CardsCubit extends Cubit<CardStates> {
  final CardRepository cardRepository;

  CardsCubit(this.cardRepository) : super(LoadCardinProgress()) {
    _fetchCardsInfo();
  }

  _fetchCardsInfo() async {
    emit(LoadCardinProgress());
    cardRepository.getCards().listen((cards) {
      emit(LoadCardInSucces(cards: cards));
    });
  }

  addCard(CardModel cardModel) async {
    cardRepository.addCard(cardModel: cardModel);
  }
  deleteCard(String docId) {
    cardRepository.deleteCard(docId: docId);
  }
  updateCard(CardModel cardModel) {
    cardRepository.updateCard(cardModel: cardModel);
  }
}
