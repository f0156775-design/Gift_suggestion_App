import 'package:flutter/material.dart';
import 'package:gift_suggestion_app/screens/gift-detail-screen.dart';
import 'favorites_screen.dart';
import 'gift-detail-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = true;
  String selectedCategory = 'All';
  String searchText = "";
  bool showMoreCategories = false;
  Set<String> favoriteNames = {};
  Set<String> favoriteCategories = {};
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> topCategories = [
    {"name": "All", "emoji": "🎁"},
    {"name": "For Her", "emoji": "🧸"},
    {"name": "For Him", "emoji": "⌚"},
    {"name": "Birthday", "emoji": "🎂"},
    {"name": "Anniversary", "emoji": "🌹"},
    {"name": "Get Well Soon", "emoji": "💐"},
  ];

  final List<Map<String, String>> moreCategories = [
    {"name": "Mothers Day", "emoji": "👩‍👧"},
    {"name": "Fathers Day", "emoji": "👨‍👧"},
    {"name": "Teachers Day", "emoji": "👩‍🏫"},
    {"name": "Eid", "emoji": "🌙"},
    {"name": "Wedding / Barat", "emoji": "💍"},
    {"name": "Baby Shower", "emoji": "👶"},
    {"name": "Friendship Day", "emoji": "🤝"},
    {"name": "Valentine Day", "emoji": "❤️"},
    {"name": "Graduation", "emoji": "🎓"},
    {"name": "New Year", "emoji": "🎉"},
    {"name": "Thank You", "emoji": "🙏"},
    {"name": "House Warming", "emoji": "🏠"},
  ];

  final List<Map<String, String>> allGifts = [
    {"name": "Teddy Bear", "category": "For Her", "emoji": "🧸"},
    {"name": "Chocolate Box", "category": "For Her", "emoji": "🍫"},
    {"name": "Rose Bouquet", "category": "For Her", "emoji": "🌹"},
    {"name": "Makeup Kit", "category": "For Her", "emoji": "💄"},
    {"name": "Jewellery Set", "category": "For Her", "emoji": "💎"},
    {"name": "Hand Bag", "category": "For Her", "emoji": "👜"},
    {"name": "Scented Perfume", "category": "For Her", "emoji": "🌸"},
    {"name": "Plush Toy", "category": "For Her", "emoji": "🐻"},
    {"name": "Skin Care Set", "category": "For Her", "emoji": "🧴"},
    {"name": "Cute Mug", "category": "For Her", "emoji": "☕"},
    {"name": "Hair Accessories", "category": "For Her", "emoji": "🎀"},
    {"name": "Love Letter Box", "category": "For Her", "emoji": "💌"},
    {"name": "Watch", "category": "For Him", "emoji": "⌚"},
    {"name": "Perfume", "category": "For Him", "emoji": "🌸"},
    {"name": "Wallet", "category": "For Him", "emoji": "👛"},
    {"name": "Sunglasses", "category": "For Him", "emoji": "🕶️"},
    {"name": "Leather Belt", "category": "For Him", "emoji": "🧳"},
    {"name": "Sports Shoes", "category": "For Him", "emoji": "👟"},
    {"name": "Headphones", "category": "For Him", "emoji": "🎧"},
    {"name": "Smart Watch", "category": "For Him", "emoji": "⌚"},
    {"name": "Shaving Kit", "category": "For Him", "emoji": "🪒"},
    {"name": "T-Shirt", "category": "For Him", "emoji": "👕"},
    {"name": "Backpack", "category": "For Him", "emoji": "🎒"},
    {"name": "Coffee Mug", "category": "For Him", "emoji": "☕"},
    {"name": "Birthday Cake", "category": "Birthday", "emoji": "🎂"},
    {"name": "Birthday Balloons", "category": "Birthday", "emoji": "🎈"},
    {"name": "Birthday Card", "category": "Birthday", "emoji": "💌"},
    {"name": "Birthday Gift Box", "category": "Birthday", "emoji": "🎁"},
    {"name": "Party Caps", "category": "Birthday", "emoji": "🎉"},
    {"name": "Chocolate Cake", "category": "Birthday", "emoji": "🍫"},
    {"name": "Photo Cake", "category": "Birthday", "emoji": "📸"},
    {"name": "Flower Cake", "category": "Birthday", "emoji": "🌸"},
    {"name": "Teddy Cake", "category": "Birthday", "emoji": "🧸"},
    {"name": "Cupcakes Set", "category": "Birthday", "emoji": "🧁"},
    {"name": "Surprise Box", "category": "Birthday", "emoji": "🎁"},
    {"name": "Birthday Flowers", "category": "Birthday", "emoji": "💐"},
    {"name": "Flowers", "category": "Anniversary", "emoji": "🌹"},
    {"name": "Couple Mug", "category": "Anniversary", "emoji": "☕"},
    {"name": "Couple Watch", "category": "Anniversary", "emoji": "⌚"},
    {"name": "Anniversary Cake", "category": "Anniversary", "emoji": "🎂"},
    {"name": "Love Frame", "category": "Anniversary", "emoji": "🖼️"},
    {"name": "Couple Cushion", "category": "Anniversary", "emoji": "❤️"},
    {"name": "Rose Chocolates", "category": "Anniversary", "emoji": "🍫"},
    {"name": "Anniversary Card", "category": "Anniversary", "emoji": "💌"},
    {"name": "Couple T-Shirt", "category": "Anniversary", "emoji": "👕"},
    {"name": "Candle Dinner Set", "category": "Anniversary", "emoji": "🕯️"},
    {"name": "Memory Album", "category": "Anniversary", "emoji": "📸"},
    {"name": "Heart Balloon", "category": "Anniversary", "emoji": "🎈"},
    {"name": "Greeting Card", "category": "Get Well Soon", "emoji": "💌"},
    {"name": "Fruit Basket", "category": "Get Well Soon", "emoji": "🍎"},
    {"name": "Get Well Flowers", "category": "Get Well Soon", "emoji": "💐"},
    {"name": "Soup Basket", "category": "Get Well Soon", "emoji": "🍲"},
    {"name": "Herbal Tea Set", "category": "Get Well Soon", "emoji": "🍵"},
    {"name": "Soft Blanket", "category": "Get Well Soon", "emoji": "🧣"},
    {"name": "Care Hamper", "category": "Get Well Soon", "emoji": "🎁"},
    {"name": "Motivation Book", "category": "Get Well Soon", "emoji": "📖"},
    {"name": "Dry Fruits", "category": "Get Well Soon", "emoji": "🥜"},
    {"name": "Juice Basket", "category": "Get Well Soon", "emoji": "🧃"},
    {"name": "Flower Bouquet", "category": "Mothers Day", "emoji": "💐"},
    {"name": "Scented Candle", "category": "Mothers Day", "emoji": "🕯️"},
    {"name": "Mom Mug", "category": "Mothers Day", "emoji": "☕"},
    {"name": "Shawl", "category": "Mothers Day", "emoji": "🧣"},
    {"name": "Mom Cake", "category": "Mothers Day", "emoji": "🎂"},
    {"name": "Jewellery Box", "category": "Mothers Day", "emoji": "💎"},
    {"name": "Mom Frame", "category": "Mothers Day", "emoji": "🖼️"},
    {"name": "Tea Set", "category": "Mothers Day", "emoji": "🍵"},
    {"name": "Mom Chocolates", "category": "Mothers Day", "emoji": "🍫"},
    {"name": "Prayer Mat", "category": "Mothers Day", "emoji": "🕌"},
    {"name": "Dad Wallet", "category": "Fathers Day", "emoji": "👛"},
    {"name": "Tie Set", "category": "Fathers Day", "emoji": "👔"},
    {"name": "Dad Mug", "category": "Fathers Day", "emoji": "☕"},
    {"name": "Dad Perfume", "category": "Fathers Day", "emoji": "🌸"},
    {"name": "Dad Cake", "category": "Fathers Day", "emoji": "🎂"},
    {"name": "Shirt", "category": "Fathers Day", "emoji": "👕"},
    {"name": "Dad Frame", "category": "Fathers Day", "emoji": "🖼️"},
    {"name": "Watch for Dad", "category": "Fathers Day", "emoji": "⌚"},
    {"name": "Cap", "category": "Fathers Day", "emoji": "🧢"},
    {"name": "Dad Chocolates", "category": "Fathers Day", "emoji": "🍫"},
    {"name": "Best Teacher Mug", "category": "Teachers Day", "emoji": "📚"},
    {"name": "Thank You Card", "category": "Teachers Day", "emoji": "💌"},
    {"name": "Teacher Flowers", "category": "Teachers Day", "emoji": "💐"},
    {"name": "Diary", "category": "Teachers Day", "emoji": "📓"},
    {"name": "Pen Set", "category": "Teachers Day", "emoji": "🖊️"},
    {"name": "Book", "category": "Teachers Day", "emoji": "📖"},
    {"name": "Teacher Cake", "category": "Teachers Day", "emoji": "🎂"},
    {"name": "Teacher Frame", "category": "Teachers Day", "emoji": "🖼️"},
    {"name": "Chocolates", "category": "Teachers Day", "emoji": "🍫"},
    {"name": "Plant", "category": "Teachers Day", "emoji": "🪴"},
    {"name": "Eidi Envelope", "category": "Eid", "emoji": "💌"},
    {"name": "Dry Fruits Box", "category": "Eid", "emoji": "🥜"},
    {"name": "Eid Cake", "category": "Eid", "emoji": "🎂"},
    {"name": "Eid Gift Box", "category": "Eid", "emoji": "🎁"},
    {"name": "Mehndi Set", "category": "Eid", "emoji": "🌸"},
    {"name": "Eid Dress", "category": "Eid", "emoji": "👗"},
    {"name": "Eid Chocolates", "category": "Eid", "emoji": "🍫"},
    {"name": "Dates Box", "category": "Eid", "emoji": "🌴"},
    {"name": "Eid Flowers", "category": "Eid", "emoji": "💐"},
    {"name": "Eid Card", "category": "Eid", "emoji": "💌"},
    {"name": "Bridal Gift Set", "category": "Wedding / Barat", "emoji": "💍"},
    {"name": "Wedding Frame", "category": "Wedding / Barat", "emoji": "🖼️"},
    {"name": "Bridal Jewellery", "category": "Wedding / Barat", "emoji": "💎"},
    {"name": "Wedding Cake", "category": "Wedding / Barat", "emoji": "🎂"},
    {"name": "Couple Gift Box", "category": "Wedding / Barat", "emoji": "🎁"},
    {"name": "Bridal Clutch", "category": "Wedding / Barat", "emoji": "👜"},
    {"name": "Wedding Flowers", "category": "Wedding / Barat", "emoji": "💐"},
    {"name": "Dinner Set", "category": "Wedding / Barat", "emoji": "🍽️"},
    {"name": "Bed Sheet Set", "category": "Wedding / Barat", "emoji": "🛏️"},
    {"name": "Wedding Card", "category": "Wedding / Barat", "emoji": "💌"},
    {"name": "Baby Toys", "category": "Baby Shower", "emoji": "🧸"},
    {"name": "Baby Clothes", "category": "Baby Shower", "emoji": "👶"},
    {"name": "Baby Blanket", "category": "Baby Shower", "emoji": "🧣"},
    {"name": "Baby Feeder Set", "category": "Baby Shower", "emoji": "🍼"},
    {"name": "Baby Cake", "category": "Baby Shower", "emoji": "🎂"},
    {"name": "Baby Balloons", "category": "Baby Shower", "emoji": "🎈"},
    {"name": "Baby Frame", "category": "Baby Shower", "emoji": "🖼️"},
    {"name": "Baby Shoes", "category": "Baby Shower", "emoji": "👟"},
    {"name": "Baby Gift Box", "category": "Baby Shower", "emoji": "🎁"},
    {"name": "Baby Rattle", "category": "Baby Shower", "emoji": "🎀"},
    {"name": "Friendship Bracelet", "category": "Friendship Day", "emoji": "💛"},
    {"name": "Photo Frame", "category": "Friendship Day", "emoji": "📸"},
    {"name": "Friend Mug", "category": "Friendship Day", "emoji": "☕"},
    {"name": "Friend Cake", "category": "Friendship Day", "emoji": "🎂"},
    {"name": "Friend Chocolates", "category": "Friendship Day", "emoji": "🍫"},
    {"name": "Friendship Card", "category": "Friendship Day", "emoji": "💌"},
    {"name": "Best Friend T-Shirt", "category": "Friendship Day", "emoji": "👕"},
    {"name": "Friend Gift Box", "category": "Friendship Day", "emoji": "🎁"},
    {"name": "Friend Flowers", "category": "Friendship Day", "emoji": "💐"},
    {"name": "Memory Book", "category": "Friendship Day", "emoji": "📖"},
    {"name": "Red Roses", "category": "Valentine Day", "emoji": "🌹"},
    {"name": "Heart Chocolate", "category": "Valentine Day", "emoji": "❤️"},
    {"name": "Valentine Teddy", "category": "Valentine Day", "emoji": "🧸"},
    {"name": "Love Mug", "category": "Valentine Day", "emoji": "☕"},
    {"name": "Valentine Cake", "category": "Valentine Day", "emoji": "🎂"},
    {"name": "Love Card", "category": "Valentine Day", "emoji": "💌"},
    {"name": "Valentine Frame", "category": "Valentine Day", "emoji": "🖼️"},
    {"name": "Heart Balloon", "category": "Valentine Day", "emoji": "🎈"},
    {"name": "Valentine Perfume", "category": "Valentine Day", "emoji": "🌸"},
    {"name": "Love Gift Box", "category": "Valentine Day", "emoji": "🎁"},
    {"name": "Graduation Cap Gift", "category": "Graduation", "emoji": "🎓"},
    {"name": "Success Diary", "category": "Graduation", "emoji": "📓"},
    {"name": "Graduation Cake", "category": "Graduation", "emoji": "🎂"},
    {"name": "Success Pen", "category": "Graduation", "emoji": "🖊️"},
    {"name": "Graduation Frame", "category": "Graduation", "emoji": "🖼️"},
    {"name": "Success Flowers", "category": "Graduation", "emoji": "💐"},
    {"name": "Laptop Bag", "category": "Graduation", "emoji": "💼"},
    {"name": "Graduation Card", "category": "Graduation", "emoji": "💌"},
    {"name": "Success Chocolates", "category": "Graduation", "emoji": "🍫"},
    {"name": "Graduation Gift Box", "category": "Graduation", "emoji": "🎁"},
    {"name": "New Year Cake", "category": "New Year", "emoji": "🎂"},
    {"name": "Party Gift Box", "category": "New Year", "emoji": "🎁"},
    {"name": "New Year Card", "category": "New Year", "emoji": "💌"},
    {"name": "New Year Flowers", "category": "New Year", "emoji": "💐"},
    {"name": "Party Balloons", "category": "New Year", "emoji": "🎈"},
    {"name": "New Year Chocolates", "category": "New Year", "emoji": "🍫"},
    {"name": "New Year Diary", "category": "New Year", "emoji": "📓"},
    {"name": "New Year Frame", "category": "New Year", "emoji": "🖼️"},
    {"name": "Celebration Box", "category": "New Year", "emoji": "🎉"},
    {"name": "New Year Mug", "category": "New Year", "emoji": "☕"},
    {"name": "Thank You Flowers", "category": "Thank You", "emoji": "🌷"},
    {"name": "Sweet Box", "category": "Thank You", "emoji": "🍬"},
    {"name": "Thank You Cake", "category": "Thank You", "emoji": "🎂"},
    {"name": "Thank You Card", "category": "Thank You", "emoji": "💌"},
    {"name": "Thank You Mug", "category": "Thank You", "emoji": "☕"},
    {"name": "Thank You Gift Box", "category": "Thank You", "emoji": "🎁"},
    {"name": "Thank You Chocolates", "category": "Thank You", "emoji": "🍫"},
    {"name": "Thank You Frame", "category": "Thank You", "emoji": "🖼️"},
    {"name": "Thank You Plant", "category": "Thank You", "emoji": "🪴"},
    {"name": "Thank You Diary", "category": "Thank You", "emoji": "📓"},
    {"name": "Home Decor Set", "category": "House Warming", "emoji": "🏠"},
    {"name": "Plant Gift", "category": "House Warming", "emoji": "🪴"},
    {"name": "Wall Frame", "category": "House Warming", "emoji": "🖼️"},
    {"name": "Cushion Set", "category": "House Warming", "emoji": "🛋️"},
    {"name": "Dinner Set Gift", "category": "House Warming", "emoji": "🍽️"},
    {"name": "Lamp", "category": "House Warming", "emoji": "💡"},
    {"name": "House Cake", "category": "House Warming", "emoji": "🎂"},
    {"name": "House Flowers", "category": "House Warming", "emoji": "💐"},
    {"name": "House Gift Box", "category": "House Warming", "emoji": "🎁"},
    {"name": "Quran Frame", "category": "House Warming", "emoji": "🕌"},
  ];

  // ===== SIRF SEARCH WALA FIX - YAHAN SE SHURU =====
  String _normalize(String s) {
    return s.toLowerCase().replaceAll(" ", "").replaceAll("-", "").replaceAll("/", "").trim();
  }
bool _matchesSearch(Map<String, String> gift, String query) {
  if (query.trim().isEmpty) return true;
  String q = _normalize(query);
  String name = _normalize(gift["name"] ?? "");
  String cat = _normalize(gift["category"] ?? "");

  // 1. DIRECT - naam ya category me mile
  if (name.contains(q) || cat.contains(q)) return true;

  // 2. BROTHER DAY / SISTER DAY / TEACHER DAY JAISE PHRASE
  // "brother day" likhne par bhi For Him wale gifts aayenge
  if (q.contains("brother") || q.contains("bhai") || q.contains("boy")) {
    if (cat == "forhim") return true;
  }
  if (q.contains("sister") || q.contains("behan") || q.contains("girl")) {
    if (cat == "forher") return true;
  }
  if (q.contains("teacher") || q.contains("teaher") || q.contains("techer")) {
    if (cat == "teachersday") return true;
  }
  if (q.contains("mother") || q.contains("mom") || q.contains("ami")) {
    if (cat == "mothersday") return true;
  }
  if (q.contains("father") || q.contains("dad") || q.contains("abu")) {
    if (cat == "fathersday") return true;
  }
  if (q.contains("eid") || q.contains("eidi") || q.contains("ramzan") || q.contains("ramadan")) {
    if (cat == "eid") return true;
  }
  if (q.contains("shaadi") || q.contains("wedding") || q.contains("barat")) {
    if (cat == "weddingbarat") return true;
  }
  if (q.contains("birthday")) {
    if (cat == "birthday") return true;
  }
  if (q.contains("valentine") || q.contains("love")) {
    if (cat == "valentineday" || cat == "forher") return true;
  }
  if (q.contains("friend") || q.contains("dost")) {
    if (cat == "friendshipday") return true;
  }
  if (q.contains("baby")) {
    if (cat == "babyshower") return true;
  }
  if (q.contains("ghar") || q.contains("newhome") || q.contains("housewarming")) {
    if (cat == "housewarming") return true;
  }
  if (q.contains("anniversary")) {
    if (cat == "anniversary") return true;
  }
  if (q.contains("graduation")) {
    if (cat == "graduation") return true;
  }
  if (q.contains("newyear")) {
    if (cat == "newyear") return true;
  }
  if (q.contains("thankyou")) {
    if (cat == "thankyou") return true;
  }
  if (q.contains("getwell")) {
    if (cat == "getwellsoon") return true;
  }

  if (q.length >= 4 && cat.length >= 4 && cat.contains(q.substring(0, 4))) return true;
 
  for (String w in query.toLowerCase().split(" ")) {
    if (w.length >= 3 && (name.contains(w) || cat.contains(w))) return true;
  }
  return false;
}
  List<Map<String, String>> get filteredGifts {
    // AGAR SEARCH HO RAHA HAI TO SELECTED CATEGORY KO IGNORE KARO,
    // POORE allGifts ME SE DHOONDO - IS LIYE TEACHERS DAY MILEGA
    if (searchText.trim().isNotEmpty) {
      var found = allGifts.where((g) => _matchesSearch(g, searchText)).toList();
      // AGAR BILKUL NA MILE TO BHI "NO GIFTS FOUND" NAHI - SAARE GIFTS DIKHA DO
      if (found.isEmpty) return allGifts;
      return found;
    }
    List<Map<String, String>> list = allGifts;
    if (selectedCategory != 'All') {
      list = list.where((g) => g["category"] == selectedCategory).toList();
    }
    return list;
  }

  List<Map<String, String>> get suggestionGifts {
    if (filteredGifts.length <= 6) return filteredGifts;
    return filteredGifts.sublist(0, 6);
  }

  List<Map<String, String>> get recommendationGifts {
    if (filteredGifts.length <= 6) {
      // PEHLE 6 SUGGESTION ME CHALE GAYE, TO RECOMMENDATION KHAALI NA HO
      // IS LIYE BAAKI GIFTS ME SE LE LO - "NO MORE GIFTS" KABHI NAHI AAYEGA
      var rest = allGifts.where((g) => !suggestionGifts.contains(g)).toList();
      if (rest.length <= 6) return rest;
      return rest.sublist(0, 6);
    }
    if (filteredGifts.length <= 12) {
      return filteredGifts.sublist(6);
    }
    return filteredGifts.sublist(6, 12);
  }
  // ===== SIRF SEARCH WALA FIX - YAHAN KHATAM =====

  List<Map<String, String>> get favoriteGifts {
    return allGifts.where((g) => favoriteNames.contains(g["name"])).toList();
  }

  // CATEGORY KO FAVOURITE KARNA
  void toggleCategoryFavourite(String category) {
    setState(() {
      if (favoriteCategories.contains(category)) {
        favoriteCategories.remove(category);
      } else {
        favoriteCategories.add(category);
      }
    });
  }

  void toggleGiftFavourite(Map<String, String> gift) {
    setState(() {
      String name = gift["name"] ?? "";
      if (favoriteNames.contains(name)) {
        favoriteNames.remove(name);
      } else {
        favoriteNames.add(name);
      }
    });
  }

  void openGiftDetail(Map<String, String> gift) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GiftDetailScreen(
          gift: gift,
          isDark: isDark,
          // AB GIFT KI JAGAH USKI CATEGORY FAVOURITE HOGI
          isFavorite:
              favoriteCategories.contains(gift["category"] ?? ""),
          onFavoriteToggle: () =>
              toggleCategoryFavourite(gift["category"] ?? ""),
        ),
      ),
    );
    setState(() {});
  }

  String getEmojiForCategory(String cat) {
    for (var c in [...topCategories, ...moreCategories]) {
      if (c["name"] == cat) return c["emoji"] ?? "🎁";
    }
    return "🎁";
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF2D1454) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    int totalFav = favoriteCategories.length + favoriteNames.length;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'GIFTIFY',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(
                            favoriteGifts: favoriteGifts,
                            favoriteCategories: favoriteCategories.toList(),
                            isDark: isDark,
                            onRemoveCategory: (cat) {
                              setState(() {
                                favoriteCategories.remove(cat);
                              });
                            },
                            onRemoveGift: (name) {
                              setState(() {
                                favoriteNames.remove(name);
                              });
                            },
                            onClearAll: () {
                              setState(() {
                                favoriteCategories.clear();
                                favoriteNames.clear();
                              });
                            },
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.15)
                            : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.favorite_border,
                              color: Colors.blue, size: 28),
                          if (totalFav > 0)
                            Positioned(
                              right: -6,
                              top: -6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle),
                                child: Text(
                                  '$totalFav',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.15)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                          hintText: 'Search gifts...',
                          hintStyle: TextStyle(
                              color: textColor.withValues(alpha: 0.6)),
                          border: InputBorder.none,
                          icon: Icon(Icons.search,
                              color: textColor.withValues(alpha: 0.6)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        color: Color(0xFF7B2FF7),
                        shape: BoxShape.circle,
                      ),
                     child: const Icon(
  Icons.nightlight_round,
  color: Colors.white,
  size: 28,
),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Categories',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...topCategories.map((cat) {
                      bool isSel = selectedCategory == cat["name"];
                      return _categoryCircle(cat, isSel, textColor, isDark);
                    }),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showMoreCategories = !showMoreCategories;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: showMoreCategories
                                    ? Colors.deepPurple
                                    : Colors.purple.withValues(alpha: 0.3),
                                border: showMoreCategories
                                    ? Border.all(
                                        color: Colors.white, width: 2)
                                    : null,
                              ),
                              child: const Center(
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 36),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text("More",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (showMoreCategories) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('More Categories',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: moreCategories.map((cat) {
                          bool isSel = selectedCategory == cat["name"];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = cat["name"]!;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 78,
                                  height: 78,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSel
                                        ? Colors.deepPurple
                                        : isDark
                                            ? Colors.white
                                                .withValues(alpha: 0.2)
                                            : Colors.grey.shade200,
                                    border: isSel
                                        ? Border.all(
                                            color: Colors.white, width: 2)
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(cat["emoji"] ?? "🎁",
                                        style: const TextStyle(fontSize: 34)),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  width: 78,
                                  child: Text(
                                    cat["name"] ?? "",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: isSel
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              // SELECTED CATEGORY + USKA FAVOURITE BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        selectedCategory == 'All'
                            ? 'Suggestions for you'
                            : '$selectedCategory Gifts',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  if (selectedCategory != 'All')
                    GestureDetector(
                      onTap: () =>
                          toggleCategoryFavourite(selectedCategory),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: favoriteCategories
                                  .contains(selectedCategory)
                              ? Colors.red
                              : Colors.white.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          favoriteCategories.contains(selectedCategory)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteCategories
                                  .contains(selectedCategory)
                              ? Colors.white
                              : Colors.red,
                          size: 22,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              if (suggestionGifts.isEmpty)
                Text('No gifts found',
                    style: TextStyle(color: textColor)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: suggestionGifts.map((gift) {
                    return _giftCircle(gift, textColor, isDark, false);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text('Recommendations',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              if (recommendationGifts.isEmpty)
                Text('No more gifts',
                    style: TextStyle(
                        color: textColor.withValues(alpha: 0.6))),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: recommendationGifts.map((gift) {
                    return _giftCircle(gift, textColor, isDark, true);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryCircle(Map<String, String> cat, bool isSel,
      Color textColor, bool isDark) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = cat["name"]!;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSel
                    ? Colors.deepPurple
                    : isDark
                        ? Colors.white.withValues(alpha: 0.15)
                        : Colors.grey.shade200,
                border: isSel
                    ? Border.all(color: Colors.white, width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  cat["emoji"] ?? "🎁",
                  style: const TextStyle(fontSize: 38),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              cat["name"] ?? "",
              style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: isSel ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _giftCircle(Map<String, String> gift, Color textColor, bool isDark,
      bool isRecommendation) {
    return GestureDetector(
      onTap: () => openGiftDetail(gift),
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRecommendation
                    ? Colors.purple.withValues(alpha: 0.25)
                    : isDark
                        ? Colors.white.withValues(alpha: 0.15)
                        : Colors.grey.shade200,
              ),
              child: Center(
                child: Text(gift["emoji"] ?? "🎁",
                    style: const TextStyle(fontSize: 38)),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 84,
              child: Text(gift["name"] ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(color: textColor, fontSize: 12)),
            ),
          ],  
        ),
      ),
    );
  }
}