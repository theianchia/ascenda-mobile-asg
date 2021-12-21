class GiftCard {
  final String name;
  final String categories;
  final String logoUrl;
  final int price;

  GiftCard({required this.name, required this.categories, required this.logoUrl, required this.price});

  factory GiftCard.fromJson(dynamic json) {
    return GiftCard(
        name: json['name'] as String,
        categories: json['categories'][0] as String,
        logoUrl: json['logoUrl'] as String,
        price: json['price'] as int);
  }

  static List<GiftCard> giftCardsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return GiftCard.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'GiftCard {name: $name, categories: $categories, logoUrl: $logoUrl, price: $price}';
  }
}
