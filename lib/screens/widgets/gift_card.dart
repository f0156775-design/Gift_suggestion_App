import 'package:flutter/material.dart';
import '../../models/gift.dart';
import '../../data/gifts_data.dart';

class GiftCard extends StatefulWidget {
  final Gift gift;
  const GiftCard({super.key, required this.gift});
  @override
  State<GiftCard> createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  @override
  Widget build(BuildContext context) {
    bool isFav = favoriteGifts.contains(widget.gift);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Text(widget.gift.emoji, style: const TextStyle(fontSize: 38)),
        title: Text(widget.gift.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: IconButton(
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
          onPressed: () {
            setState(() {
              if (isFav) {
                favoriteGifts.remove(widget.gift);
              } else {
                favoriteGifts.add(widget.gift);
              }
            });
          },
        ),
      ),
    );
  }
}