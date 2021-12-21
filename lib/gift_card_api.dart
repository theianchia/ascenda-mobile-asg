import 'package:http/http.dart';
import 'dart:convert';
import 'gift_card.dart';

class GiftCardApi {
  static Future<List<GiftCard>> getGiftCards() async {
    String url = 'https://interview-api.vercel.app/api/giftcard';

    final res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      List data = await jsonDecode(res.body);
      return GiftCard.giftCardsFromSnapshot(data);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
