class CardModel {
  String cardName;
  String cardNumber;
  String gradient1;
  String gradient2;
  int moneyAmount;
  String owner;
  String expireDate;
  String cardId;
  String userId;
  String iconImage;

  CardModel({
    required this.cardName,
    required this.cardNumber,
    required this.cardId,
    required this.owner,
    required this.expireDate,
    required this.userId,
    required this.moneyAmount,
    required this.gradient1,
    required this.gradient2,
    required this.iconImage,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        cardName: json['card_name'] as String? ?? "",
        cardNumber: json['card_number'] as String? ?? "",
        cardId: json['card_id'] as String? ?? "",
        owner: json['owner'] as String? ?? "",
        expireDate: json['expire_date'] as String? ?? "",
        userId: json['user_id'] as String? ?? "",
        moneyAmount: json['money_amount'] as int? ?? 0,
        gradient1: json['gradient1'] as String? ?? "",
        gradient2: json['gradient2'] as String? ?? "",
        iconImage: json['icon_image'] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'card_name': cardName,
      'card_number': cardNumber,
      'card_id': cardId,
      'user_id': userId,
      'icon_image': iconImage,
      'owner': owner,
      'money_amount': moneyAmount,
      'gradient1': gradient1,
      'gradient2': gradient2,
      'expire_date': expireDate,
    };
  }
}
