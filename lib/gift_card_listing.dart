import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GiftCardListing extends StatelessWidget {
  final String name;
  final String categories;
  final String logoUrl;
  final String price;
  GiftCardListing({
    required this.name,
    required this.categories,
    required this.logoUrl,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog<void>(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Add to Cart'),
                content: Text('Add $name \$$price to cart?'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    child: const Text('Cancel'),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              logoUrl,
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  maxLines: 2,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        blurRadius: 4,
                        offset: const Offset(0, 0.75),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(categories.toLowerCase()),
                ),
                const SizedBox(height: 15),
                Text.rich(TextSpan(
                  text: "\$$price",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
