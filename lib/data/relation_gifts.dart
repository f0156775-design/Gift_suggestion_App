// RELATIONSHIP KE HISAAB SE GIFTS
// Wishlist form mein jo relationship select hogi, next screen par
// SIRF usi ke gifts dikhenge. Gift names wahi rakhe hain jo
// gift-detail-screen.dart ke giftDetails map mein hain, taake
// detail screen par sahi price / description aaye.

Map<String, String> _g(String name, String emoji, String category) =>
    {"name": name, "emoji": emoji, "category": category};

final Map<String, List<Map<String, String>>> relationGifts = {
  'Mother': [
    _g("Flower Bouquet", "💐", "For Mother"),
    _g("Shawl", "🧣", "For Mother"),
    _g("Jewellery Box", "💎", "For Mother"),
    _g("Hand Bag", "👜", "For Mother"),
    _g("Prayer Mat", "🕌", "For Mother"),
    _g("Tea Set", "🍵", "For Mother"),
    _g("Mom Mug", "☕", "For Mother"),
    _g("Mom Frame", "🖼️", "For Mother"),
    _g("Scented Candle", "🕯️", "For Mother"),
    _g("Mom Cake", "🎂", "For Mother"),
    _g("Mom Chocolates", "🍫", "For Mother"),
  ],
  'Father': [
    _g("Watch for Dad", "⌚", "For Father"),
    _g("Dad Wallet", "👛", "For Father"),
    _g("Dad Perfume", "🌸", "For Father"),
    _g("Tie Set", "👔", "For Father"),
    _g("Shirt", "👕", "For Father"),
    _g("Shaving Kit", "🪒", "For Father"),
    _g("Cap", "🧢", "For Father"),
    _g("Dad Mug", "☕", "For Father"),
    _g("Dad Frame", "🖼️", "For Father"),
    _g("Dad Cake", "🎂", "For Father"),
    _g("Dad Chocolates", "🍫", "For Father"),
  ],
  'Brother': [
    _g("Watch", "⌚", "For Brother"),
    _g("Smart Watch", "⌚", "For Brother"),
    _g("Headphones", "🎧", "For Brother"),
    _g("Perfume", "🌸", "For Brother"),
    _g("Wallet", "👛", "For Brother"),
    _g("Sunglasses", "🕶️", "For Brother"),
    _g("Sports Shoes", "👟", "For Brother"),
    _g("T-Shirt", "👕", "For Brother"),
    _g("Backpack", "🎒", "For Brother"),
    _g("Cap", "🧢", "For Brother"),
  ],
  'Sister': [
    _g("Jewellery Set", "💎", "For Sister"),
    _g("Makeup Kit", "💄", "For Sister"),
    _g("Hand Bag", "👜", "For Sister"),
    _g("Scented Perfume", "🌸", "For Sister"),
    _g("Skin Care Set", "🧴", "For Sister"),
    _g("Hair Accessories", "🎀", "For Sister"),
    _g("Teddy Bear", "🧸", "For Sister"),
    _g("Plush Toy", "🐻", "For Sister"),
    _g("Cute Mug", "☕", "For Sister"),
    _g("Chocolate Box", "🍫", "For Sister"),
  ],
  'Husband': [
    _g("Watch", "⌚", "For Husband"),
    _g("Couple Watch", "⌚", "For Husband"),
    _g("Perfume", "🌸", "For Husband"),
    _g("Wallet", "👛", "For Husband"),
    _g("Leather Belt", "🧳", "For Husband"),
    _g("Smart Watch", "⌚", "For Husband"),
    _g("Couple Mug", "☕", "For Husband"),
    _g("Memory Album", "📸", "For Husband"),
    _g("Candle Dinner Set", "🕯️", "For Husband"),
    _g("Anniversary Card", "💌", "For Husband"),
  ],
  'Wife': [
    _g("Rose Bouquet", "🌹", "For Wife"),
    _g("Jewellery Set", "💎", "For Wife"),
    _g("Hand Bag", "👜", "For Wife"),
    _g("Scented Perfume", "🌸", "For Wife"),
    _g("Makeup Kit", "💄", "For Wife"),
    _g("Love Letter Box", "💌", "For Wife"),
    _g("Couple Mug", "☕", "For Wife"),
    _g("Couple Cushion", "❤️", "For Wife"),
    _g("Memory Album", "📸", "For Wife"),
    _g("Candle Dinner Set", "🕯️", "For Wife"),
  ],
  'Boyfriend': [
    _g("Watch", "⌚", "For Boyfriend"),
    _g("Valentine Perfume", "🌸", "For Boyfriend"),
    _g("Headphones", "🎧", "For Boyfriend"),
    _g("Sunglasses", "🕶️", "For Boyfriend"),
    _g("Couple T-Shirt", "👕", "For Boyfriend"),
    _g("Love Mug", "☕", "For Boyfriend"),
    _g("Love Gift Box", "🎁", "For Boyfriend"),
    _g("Heart Chocolate", "❤️", "For Boyfriend"),
    _g("Love Card", "💌", "For Boyfriend"),
  ],
  'Girlfriend': [
    _g("Red Roses", "🌹", "For Girlfriend"),
    _g("Valentine Teddy", "🧸", "For Girlfriend"),
    _g("Jewellery Set", "💎", "For Girlfriend"),
    _g("Scented Perfume", "🌸", "For Girlfriend"),
    _g("Love Letter Box", "💌", "For Girlfriend"),
    _g("Heart Chocolate", "❤️", "For Girlfriend"),
    _g("Love Mug", "☕", "For Girlfriend"),
    _g("Valentine Frame", "🖼️", "For Girlfriend"),
    _g("Plush Toy", "🐻", "For Girlfriend"),
  ],
  'Friend': [
    _g("Friendship Bracelet", "💛", "For Friend"),
    _g("Photo Frame", "📸", "For Friend"),
    _g("Friend Mug", "☕", "For Friend"),
    _g("Friend Gift Box", "🎁", "For Friend"),
    _g("Friend Chocolates", "🍫", "For Friend"),
    _g("Friendship Card", "💌", "For Friend"),
    _g("Friend Cake", "🎂", "For Friend"),
  ],
  'Best Friend': [
    _g("Best Friend T-Shirt", "👕", "For Best Friend"),
    _g("Friendship Bracelet", "💛", "For Best Friend"),
    _g("Memory Book", "📖", "For Best Friend"),
    _g("Photo Frame", "📸", "For Best Friend"),
    _g("Friend Gift Box", "🎁", "For Best Friend"),
    _g("Friend Cake", "🎂", "For Best Friend"),
    _g("Friend Flowers", "💐", "For Best Friend"),
  ],
  'Colleague': [
    _g("Coffee Mug", "☕", "For Colleague"),
    _g("Diary", "📓", "For Colleague"),
    _g("Pen Set", "🖊️", "For Colleague"),
    _g("Plant", "🪴", "For Colleague"),
    _g("Book", "📖", "For Colleague"),
    _g("Chocolates", "🍫", "For Colleague"),
    _g("Thank You Gift Box", "🎁", "For Colleague"),
    _g("Thank You Card", "💌", "For Colleague"),
  ],
};

// Friend / Best Friend / Colleague / Other ke liye gender se kuch extra gifts
final Map<String, List<Map<String, String>>> _genderExtras = {
  'Female': [
    _g("Scented Perfume", "🌸", "For Her"),
    _g("Hair Accessories", "🎀", "For Her"),
    _g("Cute Mug", "☕", "For Her"),
    _g("Teddy Bear", "🧸", "For Her"),
  ],
  'Male': [
    _g("Perfume", "🌸", "For Him"),
    _g("Wallet", "👛", "For Him"),
    _g("Headphones", "🎧", "For Him"),
    _g("Cap", "🧢", "For Him"),
  ],
};

final List<Map<String, String>> _neutralGifts = [
  _g("Surprise Box", "🎁", "For Someone Special"),
  _g("Chocolate Box", "🍫", "For Someone Special"),
  _g("Flowers", "🌹", "For Someone Special"),
  _g("Photo Frame", "📸", "For Someone Special"),
  _g("Plant", "🪴", "For Someone Special"),
  _g("Coffee Mug", "☕", "For Someone Special"),
  _g("Greeting Card", "💌", "For Someone Special"),
];

/// Form ki details se sirf relevant gifts nikalta hai.
List<Map<String, String>> giftsFor({
  required String relationship,
  required String gender,
}) {
  final base = relationGifts[relationship];

  // Family / partner wale rishte: sirf unhi ke gifts
  const genderAware = ['Friend', 'Best Friend', 'Colleague'];
  if (base != null && !genderAware.contains(relationship)) {
    return base;
  }

  // Friend / Best Friend / Colleague: base + gender ke hisaab se extras
  if (base != null) {
    final extras = _genderExtras[gender] ?? [];
    final names = base.map((g) => g["name"]).toSet();
    return [
      ...base,
      ...extras
          .where((g) => !names.contains(g["name"]))
          .map((g) => {...g, "category": base.first["category"]!}),
    ];
  }

  // 'Other': gender se decide karo
  final byGender = _genderExtras[gender];
  return byGender == null ? _neutralGifts : [...byGender, ..._neutralGifts];
}
