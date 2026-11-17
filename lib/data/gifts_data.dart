import '../models/gift.dart';

List<Gift> favoriteGifts = [];

List<Gift> allGifts = [
  // Birthday
  Gift(name: 'Birthday Cake', price: 1100, emoji: '🎂', occasion: 'Birthday'),
  Gift(name: 'Teddy Bear', price: 950, emoji: '🧸', occasion: 'Birthday'),
  Gift(name: 'Fresh Flowers', price: 800, emoji: '💐', occasion: 'Birthday'),
  Gift(name: 'Perfume', price: 1400, emoji: '🌸', occasion: 'Birthday'),
  Gift(name: 'Chocolates Box', price: 650, emoji: '🍫', occasion: 'Birthday'),
  Gift(name: 'Balloons Set', price: 400, emoji: '🎈', occasion: 'Birthday'),
  Gift(name: 'Watch', price: 1800, emoji: '⌚', occasion: 'Birthday'),
  Gift(name: 'Photo Frame', price: 500, emoji: '🖼️', occasion: 'Birthday'),

  // Wedding
  Gift(name: 'Bridal Dinner Set', price: 2800, emoji: '🍽️', occasion: 'Wedding'),
  Gift(name: 'Couple Watch', price: 2400, emoji: '⌚', occasion: 'Wedding'),
  Gift(name: 'Flower Bouquet', price: 1500, emoji: '💐', occasion: 'Wedding'),
  Gift(name: 'Bed Sheet Set', price: 2200, emoji: '🛏️', occasion: 'Wedding'),
  Gift(name: 'Jewellery Set', price: 3200, emoji: '💎', occasion: 'Wedding'),
  Gift(name: 'Wall Clock', price: 1100, emoji: '🕰️', occasion: 'Wedding'),
  Gift(name: 'Perfume Set', price: 1900, emoji: '🌸', occasion: 'Wedding'),
  Gift(name: 'Quran with Stand', price: 1600, emoji: '📖', occasion: 'Wedding'),

  // Anniversary
  Gift(name: 'Roses Bouquet', price: 1000, emoji: '🌹', occasion: 'Anniversary'),
  Gift(name: 'Couple Mug', price: 550, emoji: '☕', occasion: 'Anniversary'),
  Gift(name: 'Chocolates Box', price: 800, emoji: '🍫', occasion: 'Anniversary'),
  Gift(name: 'Photo Frame', price: 600, emoji: '🖼️', occasion: 'Anniversary'),
  Gift(name: 'Cake', price: 1000, emoji: '🎂', occasion: 'Anniversary'),
  Gift(name: 'Teddy Bear', price: 950, emoji: '🧸', occasion: 'Anniversary'),
  Gift(name: 'Perfume', price: 1400, emoji: '🌸', occasion: 'Anniversary'),
  Gift(name: 'Love Card', price: 250, emoji: '💌', occasion: 'Anniversary'),

  // Graduation
  Gift(name: 'Smart Watch', price: 2500, emoji: '⌚', occasion: 'Graduation'),
  Gift(name: 'Laptop Bag', price: 1400, emoji: '💼', occasion: 'Graduation'),
  Gift(name: 'Books Set', price: 1100, emoji: '📚', occasion: 'Graduation'),
  Gift(name: 'Pen Set', price: 750, emoji: '🖊️', occasion: 'Graduation'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'Graduation'),
  Gift(name: 'Flowers', price: 650, emoji: '💐', occasion: 'Graduation'),
  Gift(name: 'Wallet', price: 1000, emoji: '👛', occasion: 'Graduation'),
  Gift(name: 'Diary', price: 450, emoji: '📓', occasion: 'Graduation'),

  // Friendship
  Gift(name: 'Friendship Band', price: 250, emoji: '🎀', occasion: 'Friendship'),
  Gift(name: 'Cute Mug', price: 500, emoji: '☕', occasion: 'Friendship'),
  Gift(name: 'Chocolates', price: 450, emoji: '🍫', occasion: 'Friendship'),
  Gift(name: 'Photo Album', price: 650, emoji: '📸', occasion: 'Friendship'),
  Gift(name: 'Teddy Bear', price: 800, emoji: '🧸', occasion: 'Friendship'),
  Gift(name: 'Cap', price: 450, emoji: '🧢', occasion: 'Friendship'),
  Gift(name: 'Key Chain', price: 300, emoji: '🔑', occasion: 'Friendship'),
  Gift(name: 'T-Shirt', price: 850, emoji: '👕', occasion: 'Friendship'),

  // Eid
  Gift(name: 'Eidi Envelope', price: 500, emoji: '🧧', occasion: 'Eid'),
  Gift(name: 'Kurta / Dress', price: 1900, emoji: '👗', occasion: 'Eid'),
  Gift(name: 'Sweets Box', price: 650, emoji: '🍬', occasion: 'Eid'),
  Gift(name: 'Perfume / Attar', price: 1100, emoji: '🌸', occasion: 'Eid'),
  Gift(name: 'Shoes / Sandals', price: 1600, emoji: '👞', occasion: 'Eid'),
  Gift(name: 'Watch', price: 2000, emoji: '⌚', occasion: 'Eid'),
  Gift(name: 'Cake', price: 1000, emoji: '🎂', occasion: 'Eid'),
  Gift(name: 'Bangles Set', price: 800, emoji: '💎', occasion: 'Eid'),

  // Mother's Day
  Gift(name: 'Saree / Shawl', price: 2200, emoji: '🧣', occasion: "Mother's Day"),
  Gift(name: 'Flowers + Card', price: 950, emoji: '💐', occasion: "Mother's Day"),
  Gift(name: 'Jewellery Set', price: 2600, emoji: '💎', occasion: "Mother's Day"),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: "Mother's Day"),
  Gift(name: 'Hand Bag', price: 1600, emoji: '👜', occasion: "Mother's Day"),
  Gift(name: 'Perfume', price: 1400, emoji: '🌸', occasion: "Mother's Day"),
  Gift(name: 'Photo Frame', price: 600, emoji: '🖼️', occasion: "Mother's Day"),
  Gift(name: 'Chocolates', price: 550, emoji: '🍫', occasion: "Mother's Day"),

  // Father's Day
  Gift(name: 'Wallet', price: 1000, emoji: '👛', occasion: "Father's Day"),
  Gift(name: 'Watch', price: 2000, emoji: '⌚', occasion: "Father's Day"),
  Gift(name: 'Perfume', price: 1500, emoji: '🌸', occasion: "Father's Day"),
  Gift(name: 'Kurta', price: 1600, emoji: '👕', occasion: "Father's Day"),
  Gift(name: 'Shoes', price: 1900, emoji: '👞', occasion: "Father's Day"),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: "Father's Day"),
  Gift(name: 'Belt', price: 750, emoji: '👔', occasion: "Father's Day"),
  Gift(name: 'Glasses', price: 1100, emoji: '👓', occasion: "Father's Day"),

  // Sister Day
  Gift(name: 'Jewellery Set', price: 1300, emoji: '💎', occasion: 'Sister Day'),
  Gift(name: 'Hand Bag', price: 1600, emoji: '👜', occasion: 'Sister Day'),
  Gift(name: 'Chocolates + Flowers', price: 950, emoji: '💐', occasion: 'Sister Day'),
  Gift(name: 'Cute Mug', price: 500, emoji: '☕', occasion: 'Sister Day'),
  Gift(name: 'Dress', price: 1900, emoji: '👗', occasion: 'Sister Day'),
  Gift(name: 'Teddy Bear', price: 950, emoji: '🧸', occasion: 'Sister Day'),
  Gift(name: 'Perfume', price: 1200, emoji: '🌸', occasion: 'Sister Day'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'Sister Day'),

  // Brother Day
  Gift(name: 'Wallet', price: 1000, emoji: '👛', occasion: 'Brother Day'),
  Gift(name: 'Watch', price: 1800, emoji: '⌚', occasion: 'Brother Day'),
  Gift(name: 'Perfume', price: 1400, emoji: '🌸', occasion: 'Brother Day'),
  Gift(name: 'T-Shirt', price: 950, emoji: '👕', occasion: 'Brother Day'),
  Gift(name: 'Shoes', price: 1600, emoji: '👞', occasion: 'Brother Day'),
  Gift(name: 'Cap', price: 450, emoji: '🧢', occasion: 'Brother Day'),
  Gift(name: 'Chocolates', price: 450, emoji: '🍫', occasion: 'Brother Day'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'Brother Day'),

  // Teacher Day
  Gift(name: 'Flower Bouquet', price: 800, emoji: '💐', occasion: 'Teacher Day'),
  Gift(name: 'Pen + Diary Set', price: 750, emoji: '📓', occasion: 'Teacher Day'),
  Gift(name: 'Thank You Card', price: 250, emoji: '💌', occasion: 'Teacher Day'),
  Gift(name: 'Cake', price: 1000, emoji: '🎂', occasion: 'Teacher Day'),
  Gift(name: 'Books Set', price: 1100, emoji: '📚', occasion: 'Teacher Day'),
  Gift(name: 'Mug', price: 500, emoji: '☕', occasion: 'Teacher Day'),
  Gift(name: 'Chocolates', price: 550, emoji: '🍫', occasion: 'Teacher Day'),
  Gift(name: 'Photo Frame', price: 600, emoji: '🖼️', occasion: 'Teacher Day'),

  // Valentine's Day
  Gift(name: 'Red Roses', price: 1300, emoji: '🌹', occasion: "Valentine's Day"),
  Gift(name: 'Teddy + Chocolates', price: 1150, emoji: '🧸', occasion: "Valentine's Day"),
  Gift(name: 'Love Card', price: 250, emoji: '💌', occasion: "Valentine's Day"),
  Gift(name: 'Heart Cake', price: 1000, emoji: '❤️', occasion: "Valentine's Day"),
  Gift(name: 'Perfume', price: 1400, emoji: '🌸', occasion: "Valentine's Day"),
  Gift(name: 'Chocolates Box', price: 800, emoji: '🍫', occasion: "Valentine's Day"),
  Gift(name: 'Jewellery', price: 2200, emoji: '💎', occasion: "Valentine's Day"),
  Gift(name: 'Balloons', price: 400, emoji: '🎈', occasion: "Valentine's Day"),

  // Baby Shower
  Gift(name: 'Baby Clothes Set', price: 1300, emoji: '👶', occasion: 'Baby Shower'),
  Gift(name: 'Baby Toys', price: 950, emoji: '🧸', occasion: 'Baby Shower'),
  Gift(name: 'Baby Blanket', price: 800, emoji: '🧸', occasion: 'Baby Shower'),
  Gift(name: 'Feeder Set', price: 650, emoji: '🍼', occasion: 'Baby Shower'),
  Gift(name: 'Baby Shoes', price: 800, emoji: '👟', occasion: 'Baby Shower'),
  Gift(name: 'Baby Cap', price: 400, emoji: '🧢', occasion: 'Baby Shower'),
  Gift(name: 'Baby Lotion Set', price: 1100, emoji: '🧴', occasion: 'Baby Shower'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'Baby Shower'),

  // New Job
  Gift(name: 'Office Bag', price: 1600, emoji: '💼', occasion: 'New Job'),
  Gift(name: 'Pen + Diary', price: 750, emoji: '📓', occasion: 'New Job'),
  Gift(name: 'Plant', price: 450, emoji: '🪴', occasion: 'New Job'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'New Job'),
  Gift(name: 'Wallet', price: 1000, emoji: '👛', occasion: 'New Job'),
  Gift(name: 'Watch', price: 1800, emoji: '⌚', occasion: 'New Job'),
  Gift(name: 'Flowers', price: 650, emoji: '💐', occasion: 'New Job'),
  Gift(name: 'Chocolates', price: 550, emoji: '🍫', occasion: 'New Job'),

  // House Warming
  Gift(name: 'Dinner Set', price: 2500, emoji: '🍽️', occasion: 'House Warming'),
  Gift(name: 'Wall Clock', price: 1100, emoji: '🕰️', occasion: 'House Warming'),
  Gift(name: 'Quran with Stand', price: 1600, emoji: '📖', occasion: 'House Warming'),
  Gift(name: 'Flower Vase', price: 800, emoji: '🌷', occasion: 'House Warming'),
  Gift(name: 'Bed Sheet Set', price: 1900, emoji: '🛏️', occasion: 'House Warming'),
  Gift(name: 'Tea Set', price: 1400, emoji: '☕', occasion: 'House Warming'),
  Gift(name: 'Lamp', price: 1100, emoji: '💡', occasion: 'House Warming'),
  Gift(name: 'Carpet', price: 2200, emoji: '🧶', occasion: 'House Warming'),

  // Thank You
  Gift(name: 'Thank You Card', price: 250, emoji: '💌', occasion: 'Thank You'),
  Gift(name: 'Chocolates Box', price: 550, emoji: '🍫', occasion: 'Thank You'),
  Gift(name: 'Flowers', price: 650, emoji: '💐', occasion: 'Thank You'),
  Gift(name: 'Cute Mug', price: 500, emoji: '☕', occasion: 'Thank You'),
  Gift(name: 'Cake', price: 850, emoji: '🎂', occasion: 'Thank You'),
  Gift(name: 'Plant', price: 450, emoji: '🪴', occasion: 'Thank You'),
  Gift(name: 'Perfume', price: 1100, emoji: '🌸', occasion: 'Thank You'),
  Gift(name: 'Photo Frame', price: 600, emoji: '🖼️', occasion: 'Thank You'),

  // Get Well Soon
  Gift(name: 'Flowers', price: 800, emoji: '💐', occasion: 'Get Well Soon'),
  Gift(name: 'Fruits Basket', price: 1100, emoji: '🍎', occasion: 'Get Well Soon'),
  Gift(name: 'Get Well Card', price: 250, emoji: '💌', occasion: 'Get Well Soon'),
  Gift(name: 'Soup + Juice', price: 650, emoji: '🧃', occasion: 'Get Well Soon'),
  Gift(name: 'Chocolates', price: 550, emoji: '🍫', occasion: 'Get Well Soon'),
  Gift(name: 'Teddy Bear', price: 800, emoji: '🧸', occasion: 'Get Well Soon'),
  Gift(name: 'Blanket', price: 1100, emoji: '🧸', occasion: 'Get Well Soon'),
  Gift(name: 'Books', price: 800, emoji: '📚', occasion: 'Get Well Soon'),
];