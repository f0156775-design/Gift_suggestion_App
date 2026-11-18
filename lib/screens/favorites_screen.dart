import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  final List<dynamic> favoriteGifts;
  final List<String> favoriteCategories;
  final bool isDark;
  final Function(String)? onRemoveCategory;
  final Function(String)? onRemoveGift;
  final VoidCallback? onClearAll;

  const FavoritesScreen({
    super.key,
    this.favoriteGifts = const [],
    this.favoriteCategories = const [],
    this.isDark = true,
    this.onRemoveCategory,
    this.onRemoveGift,
    this.onClearAll,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  static const String _categoriesKey = 'favorite_categories';
  static const String _giftsKey = 'favorite_gifts';

  List<String> localCategories = [];
  List<dynamic> localGifts = [];

  bool isLoading = true;

  get SharedPreferences => null;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // LOAD DATA FROM LOCAL STORAGE
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final savedCategories = prefs.getString(_categoriesKey);
    final savedGifts = prefs.getString(_giftsKey);

    if (!mounted) return;

    setState(() {
      localCategories = savedCategories != null
          ? List<String>.from(jsonDecode(savedCategories))
          : List<String>.from(widget.favoriteCategories);

      localGifts = savedGifts != null
          ? List<dynamic>.from(jsonDecode(savedGifts))
          : widget.favoriteGifts.map(_giftToMap).toList();

      isLoading = false;
    });

    // Save initial data if no previous data exists
    await _saveFavorites();
  }

  // CONVERT GIFT INTO MAP
  Map<String, dynamic> _giftToMap(dynamic gift) {
    if (gift is Map) {
      return {
        'name': gift['name']?.toString() ?? '',
        'category': gift['category']?.toString() ?? '',
        'emoji': gift['emoji']?.toString() ?? '🎁',
      };
    }

    return {
      'name': _getName(gift),
      'category': _getCategory(gift),
      'emoji': _getEmoji(gift),
    };
  }

  // SAVE DATA TO LOCAL STORAGE
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _categoriesKey,
      jsonEncode(localCategories),
    );

    await prefs.setString(
      _giftsKey,
      jsonEncode(localGifts.map(_giftToMap).toList()),
    );
  }

  String _getName(dynamic gift) {
    if (gift is Map) return gift['name']?.toString() ?? '';

    try {
      return (gift as dynamic).name?.toString() ?? '';
    } catch (e) {
      return '';
    }
  }

  String _getCategory(dynamic gift) {
    if (gift is Map) return gift['category']?.toString() ?? '';

    try {
      return (gift as dynamic).category?.toString() ?? '';
    } catch (e) {
      return '';
    }
  }

  String _getEmoji(dynamic gift) {
    if (gift is Map) {
      return gift['emoji']?.toString() ?? '🎁';
    }

    try {
      return (gift as dynamic).emoji?.toString() ?? '🎁';
    } catch (e) {
      return '🎁';
    }
  }

  // REMOVE CATEGORY
  Future<void> _removeCategory(String cat) async {
    setState(() {
      localCategories.remove(cat);
    });

    await _saveFavorites();
    widget.onRemoveCategory?.call(cat);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$cat removed from Favorites'),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  // REMOVE GIFT
  Future<void> _removeGift(dynamic gift) async {
    setState(() {
      localGifts.remove(gift);
    });

    await _saveFavorites();
    widget.onRemoveGift?.call(_getName(gift));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${_getName(gift)} removed from Favorites',
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  // DELETE ALL FAVORITES
  Future<void> _clearAll() async {
    setState(() {
      localCategories.clear();
      localGifts.clear();
    });

    await _saveFavorites();
    widget.onClearAll?.call();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDark
        ? const Color(0xFF2D1454)
        : Colors.white;

    final textColor = widget.isDark
        ? Colors.white
        : Colors.black87;

    final cardColor = widget.isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.grey.shade100;

    bool isEmpty =
        localCategories.isEmpty && localGifts.isEmpty;

    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),

        title: Text(
          'My Favourites',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        actions: [
          if (!isLoading && !isEmpty)
            IconButton(
              onPressed: _clearAll,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
        ],
      ),

      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: textColor,
              ),
            )
          : isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '❤️',
                        style: TextStyle(fontSize: 60),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Nothing added to Favorites',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "You haven't added anything to Favorites yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor.withValues(alpha: 0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (localCategories.isNotEmpty) ...[
                      Text(
                        'Favorite Categories',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ...localCategories.map((cat) {
                        return Card(
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),

                          child: ListTile(
                            leading: const Text(
                              '🎁',
                              style: TextStyle(fontSize: 32),
                            ),

                            title: Text(
                              cat,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              'Category',
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.7),
                              ),
                            ),

                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _removeCategory(cat),
                            ),
                          ),
                        );
                      }),
                    ],

                    if (localGifts.isNotEmpty) ...[
                      const SizedBox(height: 8),

                      Text(
                        'Favorite Gifts',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      ...localGifts.map((gift) {
                        return Card(
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),

                          child: ListTile(
                            leading: Text(
                              _getEmoji(gift),
                              style: const TextStyle(fontSize: 32),
                            ),

                            title: Text(
                              _getName(gift),
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              _getCategory(gift),
                              style: TextStyle(
                                color: textColor.withValues(alpha: 0.7),
                              ),
                            ),

                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _removeGift(gift),
                            ),
                          ),
                        );
                      }),
                    ],
                  ],
                ),
    );
  }
}