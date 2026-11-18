import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/gift.dart';
import '../../data/gifts_data.dart';

class GiftCard extends StatefulWidget {
  final Gift gift;

  const GiftCard({super.key, required this.gift});

  @override
  State<GiftCard> createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  static const String _storageKey = 'favorite_gifts';

  bool isFav = false;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  // LOAD FAVORITE STATUS
  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final savedData = prefs.getString(_storageKey);

    List<dynamic> savedGifts = savedData != null
        ? jsonDecode(savedData)
        : [];

    final exists = savedGifts.any(
      (gift) => gift['name'] == widget.gift.name,
    );

    if (!mounted) return;

    setState(() {
      isFav = exists;
      isLoaded = true;
    });
  }

  // SAVE FAVORITES
  Future<void> _saveFavorites(bool add) async {
    final prefs = await SharedPreferences.getInstance();

    final savedData = prefs.getString(_storageKey);

    List<dynamic> savedGifts = savedData != null
        ? jsonDecode(savedData)
        : [];

    if (add) {
      final alreadyExists = savedGifts.any(
        (gift) => gift['name'] == widget.gift.name,
      );

      if (!alreadyExists) {
        savedGifts.add({
          'name': widget.gift.name,
          'emoji': widget.gift.emoji,
          'category': '',
        });
      }

      if (!favoriteGifts.contains(widget.gift)) {
        favoriteGifts.add(widget.gift);
      }
    } else {
      savedGifts.removeWhere(
        (gift) => gift['name'] == widget.gift.name,
      );

      favoriteGifts.remove(widget.gift);
    }

    await prefs.setString(
      _storageKey,
      jsonEncode(savedGifts),
    );
  }

  // TOGGLE FAVORITE
  Future<void> _toggleFavorite() async {
    final newValue = !isFav;

    setState(() {
      isFav = newValue;
    });

    try {
      await _saveFavorites(newValue);
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isFav = !newValue;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to save favorite'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Text(
          widget.gift.emoji,
          style: const TextStyle(fontSize: 38),
        ),

        title: Text(
          widget.gift.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: isLoaded ? _toggleFavorite : null,
        ),
      ),
    );
  }
}