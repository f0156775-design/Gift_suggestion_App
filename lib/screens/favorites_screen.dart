import 'package:flutter/material.dart';

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
  late List<String> localCategories;
  late List<dynamic> localGifts;

  @override
  void initState() {
    super.initState();
    localCategories = List.from(widget.favoriteCategories);
    localGifts = List.from(widget.favoriteGifts);
  }

  String _getName(dynamic gift) {
    if (gift is Map) return gift["name"]?.toString() ?? "";
    try {
      return (gift as dynamic).name?.toString() ?? "";
    } catch (e) {
      return "";
    }
  }

  String _getCategory(dynamic gift) {
    if (gift is Map) return gift["category"]?.toString() ?? "";
    try {
      return (gift as dynamic).category?.toString() ?? "";
    } catch (e) {
      return "";
    }
  }

  String _getEmoji(dynamic gift) {
    if (gift is Map) return gift["emoji"]?.toString() ?? "🎁";
    try {
      return (gift as dynamic).emoji?.toString() ?? "🎁";
    } catch (e) {
      return "🎁";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDark ? const Color(0xFF2D1454) : Colors.white;
    final textColor = widget.isDark ? Colors.white : Colors.black87;
    final cardColor = widget.isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.grey.shade100;
    bool isEmpty = localCategories.isEmpty && localGifts.isEmpty;

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
              color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // TOP CORNER DELETE ALL - YEH PEHLE SE KAAM KAR RAHA HAI
        actions: [
          if (!isEmpty)
            IconButton(
              onPressed: () {
                setState(() {
                  localCategories.clear();
                  localGifts.clear();
                });
                widget.onClearAll?.call();
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
      body: isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('❤️', style: TextStyle(fontSize: 60)),
                  const SizedBox(height: 12),
                  Text(
                    'Nothing added to Favorites',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "You haven't added anything to Favorites yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor.withValues(alpha: 0.6),
                        fontSize: 14),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (localCategories.isNotEmpty) ...[
                  Text('Favorite Categories',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...localCategories.map((cat) {
                    return Card(
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: const Text("🎁",
                            style: TextStyle(fontSize: 32)),
                        title: Text(cat,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("Category",
                            style: TextStyle(
                                color:
                                    textColor.withValues(alpha: 0.7))),
                        // CATEGORY KE SAMNE WALA DELETE - AB KAAM KAREGA
                        trailing: IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              localCategories.remove(cat);
                            });
                            widget.onRemoveCategory?.call(cat);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$cat removed from Favorites'),
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ],
                if (localGifts.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text('Favorite Gifts',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...localGifts.map((gift) {
                    return Card(
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Text(_getEmoji(gift),
                            style: const TextStyle(fontSize: 32)),
                        title: Text(_getName(gift),
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(_getCategory(gift),
                            style: TextStyle(
                                color:
                                    textColor.withValues(alpha: 0.7))),
                        // GIFT KE SAMNE WALA DELETE - AB KAAM KAREGA
                        trailing: IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              localGifts.remove(gift);
                            });
                            widget.onRemoveGift?.call(_getName(gift));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${_getName(gift)} removed from Favorites'),
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
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