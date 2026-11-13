import 'package:flutter/material.dart';
import '../data/gifts_data.dart';
import 'widgets/gift_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: const Color(0xFF0E5A3A),
        foregroundColor: Colors.white,
      ),
      body: favoriteGifts.isEmpty
          ? const Center(child: Text('Abhi koi favorite nahi hai'))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: favoriteGifts.length,
              itemBuilder: (context, i) => GiftCard(gift: favoriteGifts[i]),
            ),
    );
  }
}