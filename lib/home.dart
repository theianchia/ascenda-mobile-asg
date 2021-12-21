import 'package:flutter/material.dart';
import 'package:gift_card_listing/gift_card_api.dart';
import 'gift_card.dart';
import 'gift_card_api.dart';
import 'gift_card_listing.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GiftCard> _giftCards;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getGiftCards();
  }

  Future<void> getGiftCards() async {
    print("Loading Data");
    _giftCards = await GiftCardApi.getGiftCards();
    print("Data loaded");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.card_giftcard_rounded),
            Text(' Gift Card Listings'),
          ],
        )),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _giftCards.length,
                itemBuilder: (context, index) {
                  return GiftCardListing(
                    name: _giftCards[index].name,
                    categories: _giftCards[index].categories,
                    logoUrl: _giftCards[index].logoUrl,
                    price: _giftCards[index].price.toString(),
                  );
                }),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[500],
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
              "Find the perfect Gift Card",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),),
          ],
        ),
        ),
    );   
  }
}
