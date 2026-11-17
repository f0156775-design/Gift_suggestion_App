import 'package:flutter/material.dart';
import '../data/relation_gifts.dart';
import 'gift-detail-screen.dart';

// WISHLIST FORM SUBMIT HONE KE BAAD YEH SCREEN KHULTI HAI
// Sirf usi relationship ke gifts dikhte hain jo form mein select ki thi.
class RelationGiftsScreen extends StatefulWidget {
  final String relationship;
  final String gender;
  final int age;

  const RelationGiftsScreen({
    super.key,
    required this.relationship,
    required this.gender,
    required this.age,
  });

  @override
  State<RelationGiftsScreen> createState() => _RelationGiftsScreenState();
}

class _RelationGiftsScreenState extends State<RelationGiftsScreen> {
  static const Color primary = Color(0xFFAD4777);
  static const Color soft = Color(0xFFCB79A0);
  static const Color background = Color(0xFFFFF5F8);

  final Set<String> favoriteNames = {};

  late final List<Map<String, String>> gifts = giftsFor(
    relationship: widget.relationship,
    gender: widget.gender,
  );

  String get relationLabel {
    if (widget.relationship == 'Other') return 'someone special';
    return 'your ${widget.relationship.toLowerCase()}';
  }

  void openDetail(Map<String, String> gift) async {
    final name = gift["name"] ?? "";
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GiftDetailScreen(
          gift: gift,
          isDark: false,
          isFavorite: favoriteNames.contains(name),
          onFavoriteToggle: () {
            setState(() {
              if (!favoriteNames.remove(name)) favoriteNames.add(name);
            });
          },
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'Gifts for ${widget.relationship}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SUMMARY - user ne form mein kya bhara tha
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${gifts.length} gifts picked for $relationLabel',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _infoChip(Icons.favorite, widget.relationship),
                      _infoChip(Icons.person, widget.gender),
                      _infoChip(Icons.cake, '${widget.age} years'),
                    ],
                  ),
                ],
              ),
            ),

            // SIRF RELEVANT GIFTS
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: gifts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (_, i) => _giftTile(gifts[i]),
              ),
            ),

            // WAPIS FORM PAR
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.edit),
                  label: const Text('Change details'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: const BorderSide(color: primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: soft.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: primary),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: primary, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _giftTile(Map<String, String> gift) {
    final name = gift["name"] ?? "";
    final isFav = favoriteNames.contains(name);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => openDetail(gift),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(gift["emoji"] ?? "🎁", style: const TextStyle(fontSize: 46)),
                    const SizedBox(height: 10),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 22,
                ),
                onPressed: () {
                  setState(() {
                    if (isFav) {
                      favoriteNames.remove(name);
                    } else {
                      favoriteNames.add(name);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
