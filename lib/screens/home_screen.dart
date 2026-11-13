import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";
  String? selectedCategory;
  Set<String> favorites = {};
  bool showAllCategories = false;
  bool isDark = false;

  // See All - ab naya page NAHI khulega, yahi Home par khulega
  bool showAllPopular = false;
  bool showAllRecommended = false;

  final List<Map<String, dynamic>> categories = [
    {"name": "Birthday", "emoji": "🎂", "color": Colors.purple},
    {"name": "Friendship", "emoji": "🤝", "color": Colors.green},
    {"name": "Anniversary", "emoji": "💐", "color": Colors.pink},
    {"name": "Love", "emoji": "❤️", "color": Colors.red},
    {"name": "For Her", "emoji": "🧸", "color": Colors.pinkAccent},
    {"name": "Mother's Day", "emoji": "🤱", "color": Colors.pinkAccent},
    {"name": "Father's Day", "emoji": "👨", "color": Colors.blueGrey},
    {"name": "Teacher's Day", "emoji": "👩‍🏫", "color": Colors.deepPurple},
    {"name": "Wedding", "emoji": "💍", "color": Colors.red},
    {"name": "Ramadan", "emoji": "🌙", "color": Colors.teal},
    {"name": "Eid", "emoji": "🎉", "color": Colors.green},
    {"name": "Thank You", "emoji": "🙏", "color": Colors.orange},
    {"name": "Graduation", "emoji": "🎓", "color": Colors.blue},
    {"name": "Baby Shower", "emoji": "👶", "color": Colors.lightBlue},
  ];

  final List<Map<String, dynamic>> allGifts = [
    {"title": "Birthday Cake", "desc": "Chocolate Cake with Balloons to make Birthday more special", "price": "PKR 2,500+", "type": "Cake Gift", "decoration": "Balloons + Cake Decoration", "category": "Birthday", "emoji": "🎂", "color": Colors.purple},
    {"title": "Birthday Balloons", "desc": "Colorful Balloons to make Birthday more special and fun", "price": "PKR 500+", "type": "Decoration Gift", "decoration": "Balloons Decoration", "category": "Birthday", "emoji": "🎈", "color": Colors.purple},
    {"title": "Birthday Surprise Box", "desc": "Cake, Card and Balloons Surprise for Birthday", "price": "PKR 3,000+", "type": "Surprise Gift", "decoration": "Surprise Box Decoration", "category": "Birthday", "emoji": "🎁", "color": Colors.purple},
    {"title": "Birthday Teddy", "desc": "Cute Soft Teddy for Birthday - Best for kids", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy + Ribbon", "category": "Birthday", "emoji": "🧸", "color": Colors.purple},
    {"title": "Birthday Chocolates", "desc": "Premium Chocolates Box for Birthday celebration", "price": "PKR 800+", "type": "Sweet Gift", "decoration": "Chocolate Box Decoration", "category": "Birthday", "emoji": "🍫", "color": Colors.purple},
    {"title": "Birthday Card", "desc": "Handmade Birthday Card with lovely message", "price": "PKR 500+", "type": "Card Gift", "decoration": "Card + Ribbon", "category": "Birthday", "emoji": "💌", "color": Colors.purple},
    {"title": "Friendship Bracelet", "desc": "Best Friend Bracelet for Friendship", "price": "PKR 800+", "type": "Bracelet Gift", "decoration": "Bracelet Box", "category": "Friendship", "emoji": "🤝", "color": Colors.green},
    {"title": "Friendship Teddy", "desc": "Cute Teddy for Friend", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy Packing", "category": "Friendship", "emoji": "🧸", "color": Colors.green},
    {"title": "Friendship Mug", "desc": "Best Friend Mug", "price": "PKR 700+", "type": "Mug Gift", "decoration": "Mug Packing", "category": "Friendship", "emoji": "☕", "color": Colors.green},
    {"title": "Friendship Chocolates", "desc": "Chocolates for Friend", "price": "PKR 800+", "type": "Sweet Gift", "decoration": "Chocolate Box", "category": "Friendship", "emoji": "🍫", "color": Colors.green},
    {"title": "Anniversary Roses", "desc": "Fresh Red Roses for Anniversary to express love", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Rose Bouquet Decoration", "category": "Anniversary", "emoji": "🌹", "color": Colors.pink},
    {"title": "Love Bouquet", "desc": "Pink Roses Bouquet for Anniversary", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": "Anniversary", "emoji": "💐", "color": Colors.pink},
    {"title": "Couple Mug Set", "desc": "Mr and Mrs Mug Set for Anniversary couple", "price": "PKR 1,800+", "type": "Couple Gift", "decoration": "Gift Box Packing", "category": "Anniversary", "emoji": "☕", "color": Colors.pink},
    {"title": "Couple Photo Frame", "desc": "Anniversary Memory Frame with couple photo", "price": "PKR 1,000+", "type": "Memory Gift", "decoration": "Frame Decoration", "category": "Anniversary", "emoji": "🖼️", "color": Colors.pink},
    {"title": "Love Roses", "desc": "Red Roses to express Love", "price": "PKR 1,500+", "type": "Flowers Gift", "decoration": "Rose Bouquet", "category": "Love", "emoji": "🌹", "color": Colors.red},
    {"title": "Love Teddy", "desc": "Cute Teddy for your Love", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy + Ribbon", "category": "Love", "emoji": "🧸", "color": Colors.red},
    {"title": "Love Card", "desc": "Love Card with sweet words", "price": "PKR 500+", "type": "Card Gift", "decoration": "Card + Ribbon", "category": "Love", "emoji": "💌", "color": Colors.red},
    {"title": "Love Chocolates", "desc": "Heart Chocolates for Love", "price": "PKR 1,000+", "type": "Sweet Gift", "decoration": "Chocolate Box", "category": "Love", "emoji": "🍫", "color": Colors.red},
    {"title": "Perfume for Her", "desc": "Luxury Perfume for Her", "price": "PKR 2,500+", "type": "Perfume Gift", "decoration": "Premium Packing", "category": "For Her", "emoji": "🌸", "color": Colors.pinkAccent},
    {"title": "Saree for Her", "desc": "Beautiful Saree for Her", "price": "PKR 4,500+", "type": "Dress Gift", "decoration": "Saree Packing", "category": "For Her", "emoji": "👗", "color": Colors.pinkAccent},
    {"title": "Teddy for Her", "desc": "Cute Teddy for Her", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy Packing", "category": "For Her", "emoji": "🧸", "color": Colors.pinkAccent},
    {"title": "Jewellery for Her", "desc": "Elegant Jewellery for Her", "price": "PKR 2,000+", "type": "Jewellery Gift", "decoration": "Jewellery Box", "category": "For Her", "emoji": "💎", "color": Colors.pinkAccent},
    {"title": "Bouquet for Maa", "desc": "Pink Roses for Maa to make her day special", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": "Mother's Day", "emoji": "💐", "color": Colors.pinkAccent},
    {"title": "Cake for Maa", "desc": "Special Cake for Ammi with love", "price": "PKR 1,000+", "type": "Cake Gift", "decoration": "Cake Decoration", "category": "Mother's Day", "emoji": "🎂", "color": Colors.pinkAccent},
    {"title": "Saree for Maa", "desc": "Beautiful Saree for Mother's Day", "price": "PKR 4,500+", "type": "Dress Gift", "decoration": "Saree Packing", "category": "Mother's Day", "emoji": "👗", "color": Colors.pinkAccent},
    {"title": "Shawl for Maa", "desc": "Warm Shawl for Maa", "price": "PKR 2,000+", "type": "Dress Gift", "decoration": "Shawl Packing", "category": "Mother's Day", "emoji": "🧣", "color": Colors.pinkAccent},
    {"title": "Watch for Abu", "desc": "Premium Watch for Abu - Best Father's Day Gift", "price": "PKR 2,000+", "type": "Watch Gift", "decoration": "Watch Box Packing", "category": "Father's Day", "emoji": "⌚", "color": Colors.blueGrey},
    {"title": "Wallet for Abu", "desc": "Leather Wallet for Abu", "price": "PKR 1,500+", "type": "Wallet Gift", "decoration": "Wallet Box", "category": "Father's Day", "emoji": "👛", "color": Colors.blueGrey},
    {"title": "Shirt for Abu", "desc": "Premium Shirt for Abu", "price": "PKR 2,000+", "type": "Dress Gift", "decoration": "Shirt Packing", "category": "Father's Day", "emoji": "👔", "color": Colors.blueGrey},
    {"title": "Perfume for Abu", "desc": "Best Perfume for Abu", "price": "PKR 2,500+", "type": "Perfume Gift", "decoration": "Premium Packing", "category": "Father's Day", "emoji": "🧴", "color": Colors.blueGrey},
    {"title": "Bouquet for Teacher", "desc": "Flowers for Teacher to say Thank You", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": "Teacher's Day", "emoji": "💐", "color": Colors.deepPurple},
    {"title": "Book for Teacher", "desc": "Best Book Gift for Teacher", "price": "PKR 1,000+", "type": "Book Gift", "decoration": "Book Packing", "category": "Teacher's Day", "emoji": "📚", "color": Colors.deepPurple},
    {"title": "Pen Set for Teacher", "desc": "Premium Pen Set for Teacher", "price": "PKR 1,500+", "type": "Pen Gift", "decoration": "Pen Box", "category": "Teacher's Day", "emoji": "🖊️", "color": Colors.deepPurple},
    {"title": "Wedding Hamper", "desc": "Premium Couple Hamper for Wedding", "price": "PKR 2,000+", "type": "Hamper Gift", "decoration": "Hamper Decoration", "category": "Wedding", "emoji": "💍", "color": Colors.red},
    {"title": "Wedding Flowers", "desc": "White Roses Bouquet for Wedding", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bridal Bouquet", "category": "Wedding", "emoji": "🌹", "color": Colors.red},
    {"title": "Wedding Saree", "desc": "Beautiful Saree for Wedding", "price": "PKR 5,000+", "type": "Dress Gift", "decoration": "Saree Packing", "category": "Wedding", "emoji": "👗", "color": Colors.red},
    {"title": "Bridal Jewellery", "desc": "Elegant Jewellery for Bride", "price": "PKR 2,000+", "type": "Jewellery Gift", "decoration": "Jewellery Box", "category": "Wedding", "emoji": "💎", "color": Colors.red},
    {"title": "Ramadan Hamper", "desc": "Dates and Dry Fruits Hamper for Ramadan", "price": "PKR 2,000+", "type": "Hamper Gift", "decoration": "Hamper Decoration", "category": "Ramadan", "emoji": "🌙", "color": Colors.teal},
    {"title": "Quran Gift Set", "desc": "Beautiful Quran with Cover for Ramadan", "price": "PKR 2,500+", "type": "Islamic Gift", "decoration": "Quran Box", "category": "Ramadan", "emoji": "📖", "color": Colors.teal},
    {"title": "Prayer Mat", "desc": "Soft Janamaz for Ramadan", "price": "PKR 1,800+", "type": "Islamic Gift", "decoration": "Janamaz Packing", "category": "Ramadan", "emoji": "🕌", "color": Colors.teal},
    {"title": "Dates Box", "desc": "Premium Khajoor Box for Ramadan", "price": "PKR 1,500+", "type": "Food Gift", "decoration": "Dates Box", "category": "Ramadan", "emoji": "🌴", "color": Colors.teal},
    {"title": "Eid Gift Box", "desc": "Special Eid Gift Box with love", "price": "PKR 2,000+", "type": "Gift Box", "decoration": "Eid Box Decoration", "category": "Eid", "emoji": "🎁", "color": Colors.green},
    {"title": "Eid Cake", "desc": "Delicious Cake for Eid celebration", "price": "PKR 1,000+", "type": "Cake Gift", "decoration": "Eid Cake Decoration", "category": "Eid", "emoji": "🎂", "color": Colors.green},
    {"title": "Eidi Envelope", "desc": "Beautiful Eidi Envelope for Eid", "price": "PKR 500+", "type": "Eidi Gift", "decoration": "Envelope Decoration", "category": "Eid", "emoji": "💌", "color": Colors.green},
    {"title": "Eid Sweets", "desc": "Mithai Box for Eid", "price": "PKR 800+", "type": "Sweet Gift", "decoration": "Mithai Box", "category": "Eid", "emoji": "🍬", "color": Colors.green},
    {"title": "Thank You Hamper", "desc": "Chocolates and Thank You Card", "price": "PKR 1,500+", "type": "Hamper Gift", "decoration": "Hamper Decoration", "category": "Thank You", "emoji": "🍫", "color": Colors.orange},
    {"title": "Thank You Flowers", "desc": "Fresh Flowers to say Thank You", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": "Thank You", "emoji": "🌷", "color": Colors.orange},
    {"title": "Graduation Bouquet", "desc": "Flowers for Graduation celebration", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": "Graduation", "emoji": "💐", "color": Colors.blue},
    {"title": "Graduation Cake", "desc": "Cake for Graduation celebration", "price": "PKR 1,000+", "type": "Cake Gift", "decoration": "Cake Decoration", "category": "Graduation", "emoji": "🎂", "color": Colors.blue},
    {"title": "Graduation Book", "desc": "Motivational Book for Graduate", "price": "PKR 1,000+", "type": "Book Gift", "decoration": "Book Packing", "category": "Graduation", "emoji": "📚", "color": Colors.blue},
    {"title": "Baby Clothes Set", "desc": "Soft Clothes for Baby", "price": "PKR 2,000+", "type": "Clothes Gift", "decoration": "Baby Packing", "category": "Baby Shower", "emoji": "👶", "color": Colors.lightBlue},
    {"title": "Baby Teddy", "desc": "Cute Teddy for Baby", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy Packing", "category": "Baby Shower", "emoji": "🧸", "color": Colors.lightBlue},
    {"title": "Baby Toys", "desc": "Safe Toys for Baby", "price": "PKR 1,000+", "type": "Toy Gift", "decoration": "Toy Packing", "category": "Baby Shower", "emoji": "🧩", "color": Colors.lightBlue},
  ];

  // ===== Logo wala Purple - Blue nahi =====
  Color get bgColor => isDark ? const Color(0xFF1E0B3D) : const Color(0xFFF3EDFF);
  Color get cardColor => isDark ? const Color(0xFF31135E) : Colors.white;
  Color get textColor => isDark ? Colors.white : Colors.black;
  Color get subTextColor => isDark ? const Color(0xFFE9D5FF) : Colors.black54;
  Color get searchColor => isDark ? const Color(0xFF31135E) : Colors.white;
  Color get catBg => isDark ? const Color(0xFF3B1A6B) : const Color(0xFFEDE7F6);
  Color get detailBg => isDark ? const Color(0xFF3B1A6B) : const Color(0xFFF6F0FF);
  Color get priceColor => isDark ? const Color(0xFFE9D5FF) : const Color(0xFF7B2FF7);

  String emojiFor(String text) {
    String t = text.toLowerCase();
    if (t.contains("brother") || t.contains("bhai")) return "👦";
    if (t.contains("sister") || t.contains("behen")) return "👧";
    if (t.contains("ramadan") || t.contains("ramzan") || t.contains("roza") || t.contains("iftar")) return "🌙";
    if (t.contains("eid") || t.contains("eidi")) return "🎉";
    if (t.contains("mother") || t.contains("maa") || t.contains("ammi") || t.contains("mom")) return "🤱";
    if (t.contains("father") || t.contains("abu") || t.contains("dad")) return "👨";
    if (t.contains("teacher") || t.contains("ustad") || t.contains("sir")) return "👩‍🏫";
    if (t.contains("birthday") || t.contains("cake")) return "🎂";
    if (t.contains("wedding") || t.contains("shaadi")) return "💍";
    if (t.contains("love") || t.contains("valentine")) return "❤️";
    if (t.contains("flower") || t.contains("rose") || t.contains("bouquet")) return "🌹";
    if (t.contains("chocolate") || t.contains("mithai")) return "🍫";
    if (t.contains("baby")) return "👶";
    if (t.contains("friend") || t.contains("dost")) return "🤝";
    if (t.contains("graduation")) return "🎓";
    if (t.contains("quran") || t.contains("islam") || t.contains("namaz")) return "🕌";
    if (t.contains("her")) return "🧸";
    return "🎁";
  }

  Color colorFor(String text) {
    String t = text.toLowerCase();
    if (t.contains("ramadan")) return Colors.teal;
    if (t.contains("eid")) return Colors.green;
    if (t.contains("mother") || t.contains("love") || t.contains("wedding")) return Colors.pink;
    if (t.contains("father") || t.contains("teacher")) return Colors.blue;
    if (t.contains("birthday")) return Colors.purple;
    if (t.contains("brother")) return Colors.orange;
    return const Color(0xFF7B2FF7);
  }

  List<Map<String, dynamic>> smartGifts(String query) {
    String q = query.trim();
    if (q.isEmpty) return [];
    String qLower = q.toLowerCase();
    String cap = q[0].toUpperCase() + q.substring(1);
    String emoji = emojiFor(q);
    Color col = colorFor(q);
    for (var cat in categories) {
      String catLower = cat["name"].toString().toLowerCase();
      if (catLower == qLower || catLower.contains(qLower) || qLower.contains(catLower)) {
        return allGifts.where((g) => g["category"].toString().toLowerCase() == catLower).toList();
      }
    }
    List<Map<String, dynamic>> exact = allGifts.where((g) => g["title"].toString().toLowerCase() == qLower).toList();
    if (exact.isNotEmpty) return exact;
    return [
      {"title": "$cap Gift Box", "desc": "Special Gift Box for $cap", "price": "PKR 2,000+", "type": "Gift Box", "decoration": "Gift Box Decoration", "category": cap, "emoji": emoji, "color": col},
      {"title": "$cap Bouquet", "desc": "Beautiful Flowers for $cap", "price": "PKR 1,200+", "type": "Flowers Gift", "decoration": "Bouquet Decoration", "category": cap, "emoji": "💐", "color": col},
      {"title": "$cap Cake", "desc": "Delicious Cake for $cap", "price": "PKR 1,000+", "type": "Cake Gift", "decoration": "Cake Decoration", "category": cap, "emoji": "🎂", "color": col},
      {"title": "$cap Teddy", "desc": "Cute Teddy for $cap", "price": "PKR 1,500+", "type": "Toy Gift", "decoration": "Teddy Packing", "category": cap, "emoji": "🧸", "color": col},
      {"title": "$cap Chocolates", "desc": "Premium Chocolates for $cap", "price": "PKR 800+", "type": "Sweet Gift", "decoration": "Chocolate Box", "category": cap, "emoji": "🍫", "color": col},
      {"title": "$cap Card", "desc": "Lovely Card for $cap", "price": "PKR 500+", "type": "Card Gift", "decoration": "Card + Ribbon", "category": cap, "emoji": "💌", "color": col},
    ];
  }

  // ===== Gift Detail - Sirf Occasion + Gift Type + Price =====
  // Decoration aur Theme dono khatam kar diye hain
  void _showGiftDetail(Map<String, dynamic> gift) {
    List<Map<String, dynamic>> similar = allGifts.where((g) => g["category"] == gift["category"] && g["title"] != gift["title"]).take(4).toList();
    showModalBottomSheet(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(builder: (context, setSheetState) {
          bool favNow = favorites.contains(gift["title"]);
          return Container(
            height: MediaQuery.of(context).size.height * 0.88,
            decoration: BoxDecoration(color: isDark ? const Color(0xFF31135E) : Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(child: Container(height: 5, width: 50, decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 16),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(height: 110, width: 110, decoration: BoxDecoration(shape: BoxShape.circle, color: isDark ? const Color(0xFF3B1A6B) : const Color(0xFFF6F0FF), border: Border.all(color: const Color(0xFF7B2FF7), width: 2)), child: Center(child: Text(gift["emoji"], style: const TextStyle(fontSize: 56)))),
                  const Spacer(),
                  GestureDetector(
                    onTap: () { setState(() { favNow ? favorites.remove(gift["title"]) : favorites.add(gift["title"]); }); setSheetState(() {}); },
                    child: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: favNow ? const Color(0xFF7B2FF7) : const Color(0xFFEDE7F6), shape: BoxShape.circle), child: Icon(favNow ? Icons.favorite : Icons.favorite_border, color: favNow ? Colors.white : const Color(0xFF7B2FF7))),
                  ),
                ]),
                const SizedBox(height: 16),
                Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: isDark ? const Color(0xFF7B2FF7) : const Color(0xFFEDE7F6), borderRadius: BorderRadius.circular(20)), child: Text(gift["category"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                const SizedBox(height: 10),
                Text(gift["title"], style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2, color: textColor)),
                const SizedBox(height: 8),
                Text(gift["desc"], style: TextStyle(color: isDark ? const Color(0xFFE9D5FF) : Colors.grey, fontSize: 15, height: 1.5)),
                const SizedBox(height: 18),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF7B2FF7), Color(0xFFA855F7)]), borderRadius: BorderRadius.circular(16)), child: Row(children: [const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Price Range - Pakistan", style: TextStyle(color: Colors.white70, fontSize: 12)), SizedBox(height: 2), Text("Best Price", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))]), const Spacer(), Text(gift["price"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17))])),
                const SizedBox(height: 18),
                Text("Gift Details", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: textColor)),
                const SizedBox(height: 10),
                // Sirf ye 2 rahenge
                _detailRow("🎉", "Occasion", gift["category"]),
                _detailRow("🎁", "Gift Type", gift["type"]),
                const SizedBox(height: 20),
                SizedBox(width: double.infinity, child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: favNow ? Colors.pink : const Color(0xFF7B2FF7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 14)), onPressed: () { setState(() { favNow ? favorites.remove(gift["title"]) : favorites.add(gift["title"]); }); setSheetState(() {}); }, icon: Icon(favNow ? Icons.favorite : Icons.favorite_border, color: Colors.white, size: 20), label: Text(favNow ? "Saved to Favorites ❤️" : "Save to Favorites", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)))),
                const SizedBox(height: 22),
                Text("Similar Gifts", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: textColor)),
                const SizedBox(height: 12),
                Wrap(spacing: 16, runSpacing: 16, children: similar.map((g) { return GestureDetector(onTap: () { Navigator.pop(context); _showGiftDetail(g); }, child: SizedBox(width: 80, child: Column(children: [Container(height: 72, width: 72, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF7B2FF7).withOpacity(0.2), border: Border.all(color: const Color(0xFF7B2FF7), width: 1.5)), child: Center(child: Text(g["emoji"], style: const TextStyle(fontSize: 32)))), const SizedBox(height: 6), Text(g["title"], textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, height: 1.2, color: textColor)), Text(g["price"], style: TextStyle(fontSize: 10, color: priceColor, fontWeight: FontWeight.bold))]))); }).toList()),
              ]),
            ),
          );
        });
      },
    );
  }

  Widget _detailRow(String emoji, String label, String value) {
    return Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: detailBg, borderRadius: BorderRadius.circular(12)), child: Row(children: [Text(emoji, style: const TextStyle(fontSize: 22)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: TextStyle(color: isDark ? const Color(0xFFE9D5FF) : Colors.grey, fontSize: 12)), const SizedBox(height: 2), Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textColor))]))]));
  }

  // ===== Gift Card - Overflow Fix =====
  // Pehle height 170 thi, is liye 2.0 pixels overflow aa raha tha. Ab height 190 kar di hai
  Widget _giftCard(Map<String, dynamic> gift) {
    bool isFav = favorites.contains(gift["title"]);
    return GestureDetector(
      onTap: () => _showGiftDetail(gift),
      child: Container(
        width: 150,
        height: 182,
        margin: const EdgeInsets.only(right: 12, bottom: 4),
        decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(18)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(height: 100, width: double.infinity, decoration: BoxDecoration(color: isDark ? const Color(0xFF3B1A6B) : (gift["color"] as Color).withOpacity(0.12), borderRadius: const BorderRadius.vertical(top: Radius.circular(18))), child: Center(child: Text(gift["emoji"], style: const TextStyle(fontSize: 52)))),
            Positioned(right: 8, top: 8, child: GestureDetector(onTap: () { setState(() { isFav ? favorites.remove(gift["title"]) : favorites.add(gift["title"]); }); }, child: CircleAvatar(radius: 14, backgroundColor: Colors.white, child: Icon(isFav ? Icons.favorite : Icons.favorite_border, size: 16, color: const Color(0xFF7B2FF7))))),
          ]),
          Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(gift["title"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textColor)), const SizedBox(height: 2), Text(gift["price"], style: TextStyle(color: priceColor, fontWeight: FontWeight.bold, fontSize: 12))])),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String s = searchText.trim();
    List<Map<String, dynamic>> searchedGifts = s.isNotEmpty && selectedCategory == null ? smartGifts(s) : [];
    List<Map<String, dynamic>> categoryGifts = selectedCategory != null ? allGifts.where((g) => g["category"] == selectedCategory).toList() : [];
    List<Map<String, dynamic>> popular = allGifts.take(12).toList();
    List<Map<String, dynamic>> recommended = allGifts.skip(12).toList();
    List<Map<String, dynamic>> topCategories = categories.take(5).toList();
    List<Map<String, dynamic>> moreCategories = categories.skip(5).toList();

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('assets/images/logo.jpg', height: 48, width: 48, fit: BoxFit.cover)),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("GiftFinder", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor, height: 1.1)), Text("Find the Perfect Gift 💜", style: TextStyle(fontSize: 12, color: subTextColor, height: 1.2))])),
              Stack(children: [
                GestureDetector(onTap: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(favorites.isEmpty ? "No favorites yet ❤️" : "You have ${favorites.length} favorites ❤️"), backgroundColor: const Color(0xFF7B2FF7))); }, child: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: cardColor, shape: BoxShape.circle), child: const Icon(Icons.favorite_border, color: Color(0xFF7B2FF7), size: 22))),
                if (favorites.isNotEmpty) Positioned(right: 0, top: 0, child: CircleAvatar(radius: 9, backgroundColor: Colors.pink, child: Text("${favorites.length}", style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))),
              ]),
            ]),
            const SizedBox(height: 16),

            Row(children: [
              Expanded(child: Container(decoration: BoxDecoration(color: searchColor, borderRadius: BorderRadius.circular(30)), child: TextField(onChanged: (v) { setState(() { searchText = v; selectedCategory = null; }); }, style: TextStyle(color: textColor), decoration: InputDecoration(hintText: "Search for gifts... (e.g. Birthday, Friend)", hintStyle: TextStyle(color: isDark ? const Color(0xFFE9D5FF) : Colors.grey, fontSize: 13), prefixIcon: Icon(Icons.search, color: isDark ? const Color(0xFFE9D5FF) : Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none), filled: true, fillColor: searchColor)))),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () { setState(() { isDark = !isDark; }); },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Color(0xFF7B2FF7), shape: BoxShape.circle),
                  child: Icon(isDark ? Icons.light_mode : Icons.dark_mode, color: Colors.white, size: 22),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 4),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text(isDark ? "💜 Logo Purple Dark Mode On" : "☀️ Light Mode On", style: TextStyle(fontSize: 11, color: subTextColor, fontWeight: FontWeight.w600))]),
            ),
            const SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ...topCategories.map((cat) {
                bool isSel = selectedCategory == cat["name"];
                return GestureDetector(onTap: () { setState(() { selectedCategory = isSel ? null : cat["name"]; searchText = ""; showAllCategories = false; }); }, child: Column(children: [Container(height: 62, width: 62, decoration: BoxDecoration(color: isSel ? const Color(0xFF7B2FF7) : catBg, borderRadius: BorderRadius.circular(18)), child: Center(child: Text(cat["emoji"], style: const TextStyle(fontSize: 32)))), const SizedBox(height: 6), Text(cat["name"], style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSel ? const Color(0xFF7B2FF7) : textColor))]));
              }).toList(),
              GestureDetector(onTap: () { setState(() { showAllCategories = !showAllCategories; selectedCategory = null; searchText = ""; }); }, child: Column(children: [Container(height: 62, width: 62, decoration: BoxDecoration(color: showAllCategories ? const Color(0xFF7B2FF7) : catBg, borderRadius: BorderRadius.circular(18)), child: const Center(child: Text("▦", style: TextStyle(fontSize: 28, color: Colors.white)))), const SizedBox(height: 6), Text("More", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textColor))])),
            ]),

            if (showAllCategories) ...[
              const SizedBox(height: 18),
              Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("All Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)), const Text("✨", style: TextStyle(fontSize: 16))]),
                const SizedBox(height: 12),
                Wrap(spacing: 14, runSpacing: 14, children: moreCategories.map((cat) { return GestureDetector(onTap: () { setState(() { selectedCategory = cat["name"]; showAllCategories = false; }); }, child: SizedBox(width: 72, child: Column(children: [Container(height: 60, width: 60, decoration: BoxDecoration(color: catBg, borderRadius: BorderRadius.circular(16)), child: Center(child: Text(cat["emoji"], style: const TextStyle(fontSize: 30)))), const SizedBox(height: 5), Text(cat["name"], textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textColor, height: 1.1))]))); }).toList()),
              ])),
            ],
            const SizedBox(height: 18),

            if (selectedCategory != null || s.isNotEmpty) ...[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Expanded(child: Text(selectedCategory != null ? "$selectedCategory Gifts" : "Related Gifts for '$s'", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor))), GestureDetector(onTap: () { setState(() { selectedCategory = null; searchText = ""; }); }, child: const Text("Show All", style: TextStyle(color: Color(0xFF7B2FF7), fontWeight: FontWeight.bold)))]),
              const SizedBox(height: 12),
              Wrap(spacing: 12, runSpacing: 12, children: (selectedCategory != null ? categoryGifts : searchedGifts).map((g) => _giftCard(g)).toList()),
              const SizedBox(height: 18),
            ],

            // ===== Banner - Gift Box ki jagah Asli Logo, Explore Gifts khatam =====
            Container(width: double.infinity, padding: const EdgeInsets.all(18), decoration: BoxDecoration(gradient: isDark ? const LinearGradient(colors: [Color(0xFF7B2FF7), Color(0xFFA855F7)], begin: Alignment.topLeft, end: Alignment.bottomRight) : const LinearGradient(colors: [Color(0xFFD9C6FF), Color(0xFFB388FF)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(22)), child: Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Let's Find", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black, height: 1.1)),
                Text("the Perfect Gift!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black, height: 1.1)),
                const SizedBox(height: 8),
                Text("Make every moment\nmore special", style: TextStyle(color: isDark ? Colors.white70 : Colors.black54, fontSize: 13, height: 1.3)),
                // Explore Gifts wala button yahan se khatam kar diya hai
              ])),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/logo.jpg', height: 140, width: 140, fit: BoxFit.cover),
              ),
            ])),
            const SizedBox(height: 22),

            // ===== Popular Gifts - Sirf Home par scroll hoga, naya page nahi =====
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [const Text("⭐", style: TextStyle(fontSize: 20)), const SizedBox(width: 6), Text("Popular Gifts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor))]),
              GestureDetector(
                onTap: () { setState(() { showAllPopular = !showAllPopular; }); },
                child: Text(showAllPopular ? "Show Less ↑" : "See All →", style: const TextStyle(color: Color(0xFF7B2FF7), fontWeight: FontWeight.w600)),
              ),
            ]),
            const SizedBox(height: 12),
            if (!showAllPopular)
              SizedBox(height: 190, child: ListView(scrollDirection: Axis.horizontal, children: popular.map((g) => _giftCard(g)).toList()))
            else
              Wrap(spacing: 0, runSpacing: 12, children: popular.map((g) => _giftCard(g)).toList()),
            const SizedBox(height: 22),

            // ===== Recommended - Sirf Home par scroll hoga, naya page nahi =====
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [const Text("✦", style: TextStyle(fontSize: 20, color: Color(0xFF7B2FF7))), const SizedBox(width: 6), Text("Recommended For You", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor))]),
              GestureDetector(
                onTap: () { setState(() { showAllRecommended = !showAllRecommended; }); },
                child: Text(showAllRecommended ? "Show Less ↑" : "See All →", style: const TextStyle(color: Color(0xFF7B2FF7), fontWeight: FontWeight.w600)),
              ),
            ]),
            const SizedBox(height: 12),
            if (!showAllRecommended)
              SizedBox(height: 190, child: ListView(scrollDirection: Axis.horizontal, children: recommended.map((g) => _giftCard(g)).toList()))
            else
              Wrap(spacing: 0, runSpacing: 12, children: recommended.map((g) => _giftCard(g)).toList()),
          ]),
        ),
      ),
    );
  }
}