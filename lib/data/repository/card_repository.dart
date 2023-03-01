import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/my_utils.dart';
import '../model/cart_model/cartModel.dart';

class CardRepository {
  final FirebaseFirestore _firestore;

  CardRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream getCards() => _firestore.collection("cards").snapshots().map(
        (event) =>
            event.docs.map((doc) => CardModel.fromJson(doc.data())).toList(),
      );

  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
          await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore.collection("cards").doc(newCard.id).update({
        "card_id": newCard.id,
      });
      print("good Card add!");
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }

  Future<void> updateCard({required CardModel cardModel}) async {
    try {
      await _firestore
          .collection("cards")
          .doc(cardModel.cardId)
          .update(cardModel.toJson());

      MyUtils.getMyToast(message: "good Card Update!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteCard({required String docId}) async {
    try {
      await _firestore.collection("cards").doc(docId).delete();
      MyUtils.getMyToast(message: " good  Card delete!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }
}
