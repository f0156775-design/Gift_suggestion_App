import '../models/gift.dart';

List<Gift> favoriteGifts = [];

List<Gift> allGifts = [
  // Birthday
  Gift(name: 'Birthday Cake', price: 2000, emoji: '🎂', occasion: 'Birthday'),
  Gift(name: 'Teddy Bear', price: 1800, emoji: '🧸', occasion: 'Birthday'),
  Gift(name: 'Fresh Flowers', price: 1500, emoji: '💐', occasion: 'Birthday'),
  Gift(name: 'Perfume', price: 2500, emoji: '🌸', occasion: 'Birthday'),
  Gift(name: 'Chocolates Box', price: 1200, emoji: '🍫', occasion: 'Birthday'),
  Gift(name: 'Balloons Set', price: 800, emoji: '🎈', occasion: 'Birthday'),
  Gift(name: 'Watch', price: 3500, emoji: '⌚', occasion: 'Birthday'),
  Gift(name: 'Photo Frame', price: 1000, emoji: '🖼️', occasion: 'Birthday'),

  // Wedding
  Gift(name: 'Bridal Dinner Set', price: 5000, emoji: '🍽️', occasion: 'Wedding'),
  Gift(name: 'Couple Watch', price: 4500, emoji: '⌚', occasion: 'Wedding'),
  Gift(name: 'Flower Bouquet', price: 3000, emoji: '💐', occasion: 'Wedding'),
  Gift(name: 'Bed Sheet Set', price: 4000, emoji: '🛏️', occasion: 'Wedding'),
  Gift(name: 'Jewellery Set', price: 6000, emoji: '💎', occasion: 'Wedding'),
  Gift(name: 'Wall Clock', price: 2000, emoji: '🕰️', occasion: 'Wedding'),
  Gift(name: 'Perfume Set', price: 3500, emoji: '🌸', occasion: 'Wedding'),
  Gift(name: 'Quran with Stand', price: 3000, emoji: '📖', occasion: 'Wedding'),

  // Anniversary
  Gift(name: 'Roses Bouquet', price: 2000, emoji: '🌹', occasion: 'Anniversary'),
  Gift(name: 'Couple Mug', price: 1000, emoji: '☕', occasion: 'Anniversary'),
  Gift(name: 'Chocolates Box', price: 1500, emoji: '🍫', occasion: 'Anniversary'),
  Gift(name: 'Photo Frame', price: 1200, emoji: '🖼️', occasion: 'Anniversary'),
  Gift(name: 'Cake', price: 1800, emoji: '🎂', occasion: 'Anniversary'),
  Gift(name: 'Teddy Bear', price: 1800, emoji: '🧸', occasion: 'Anniversary'),
  Gift(name: 'Perfume', price: 2500, emoji: '🌸', occasion: 'Anniversary'),
  Gift(name: 'Love Card', price: 500, emoji: '💌', occasion: 'Anniversary'),

  // Graduation
  Gift(name: 'Smart Watch', price: 5000, emoji: '⌚', occasion: 'Graduation'),
  Gift(name: 'Laptop Bag', price: 2500, emoji: '💼', occasion: 'Graduation'),
  Gift(name: 'Books Set', price: 2000, emoji: '📚', occasion: 'Graduation'),
  Gift(name: 'Pen Set', price: 1500, emoji: '🖊️', occasion: 'Graduation'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'Graduation'),
  Gift(name: 'Flowers', price: 1200, emoji: '💐', occasion: 'Graduation'),
  Gift(name: 'Wallet', price: 2000, emoji: '👛', occasion: 'Graduation'),
  Gift(name: 'Diary', price: 800, emoji: '📓', occasion: 'Graduation'),

  // Friendship
  Gift(name: 'Friendship Band', price: 500, emoji: '🎀', occasion: 'Friendship'),
  Gift(name: 'Cute Mug', price: 1000, emoji: '☕', occasion: 'Friendship'),
  Gift(name: 'Chocolates', price: 800, emoji: '🍫', occasion: 'Friendship'),
  Gift(name: 'Photo Album', price: 1200, emoji: '📸', occasion: 'Friendship'),
  Gift(name: 'Teddy Bear', price: 1500, emoji: '🧸', occasion: 'Friendship'),
  Gift(name: 'Cap', price: 900, emoji: '🧢', occasion: 'Friendship'),
  Gift(name: 'Key Chain', price: 600, emoji: '🔑', occasion: 'Friendship'),
  Gift(name: 'T-Shirt', price: 1500, emoji: '👕', occasion: 'Friendship'),

  // Eid
  Gift(name: 'Eidi Envelope', price: 1000, emoji: '🧧', occasion: 'Eid'),
  Gift(name: 'Kurta / Dress', price: 3500, emoji: '👗', occasion: 'Eid'),
  Gift(name: 'Sweets Box', price: 1200, emoji: '🍬', occasion: 'Eid'),
  Gift(name: 'Perfume / Attar', price: 2000, emoji: '🌸', occasion: 'Eid'),
  Gift(name: 'Shoes / Sandals', price: 3000, emoji: '👞', occasion: 'Eid'),
  Gift(name: 'Watch', price: 4000, emoji: '⌚', occasion: 'Eid'),
  Gift(name: 'Cake', price: 1800, emoji: '🎂', occasion: 'Eid'),
  Gift(name: 'Bangles Set', price: 1500, emoji: '💎', occasion: 'Eid'),

  // Mother's Day
  Gift(name: 'Saree / Shawl', price: 4000, emoji: '🧣', occasion: "Mother's Day"),
  Gift(name: 'Flowers + Card', price: 1800, emoji: '💐', occasion: "Mother's Day"),
  Gift(name: 'Jewellery Set', price: 5000, emoji: '💎', occasion: "Mother's Day"),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: "Mother's Day"),
  Gift(name: 'Hand Bag', price: 3000, emoji: '👜', occasion: "Mother's Day"),
  Gift(name: 'Perfume', price: 2500, emoji: '🌸', occasion: "Mother's Day"),
  Gift(name: 'Photo Frame', price: 1200, emoji: '🖼️', occasion: "Mother's Day"),
  Gift(name: 'Chocolates', price: 1000, emoji: '🍫', occasion: "Mother's Day"),

  // Father's Day
  Gift(name: 'Wallet', price: 2000, emoji: '👛', occasion: "Father's Day"),
  Gift(name: 'Watch', price: 4000, emoji: '⌚', occasion: "Father's Day"),
  Gift(name: 'Perfume', price: 3000, emoji: '🌸', occasion: "Father's Day"),
  Gift(name: 'Kurta', price: 3000, emoji: '👕', occasion: "Father's Day"),
  Gift(name: 'Shoes', price: 3500, emoji: '👞', occasion: "Father's Day"),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: "Father's Day"),
  Gift(name: 'Belt', price: 1500, emoji: '👔', occasion: "Father's Day"),
  Gift(name: 'Glasses', price: 2000, emoji: '👓', occasion: "Father's Day"),

  // Sister Day
  Gift(name: 'Jewellery Set', price: 2500, emoji: '💎', occasion: 'Sister Day'),
  Gift(name: 'Hand Bag', price: 3000, emoji: '👜', occasion: 'Sister Day'),
  Gift(name: 'Chocolates + Flowers', price: 1800, emoji: '💐', occasion: 'Sister Day'),
  Gift(name: 'Cute Mug', price: 1000, emoji: '☕', occasion: 'Sister Day'),
  Gift(name: 'Dress', price: 3500, emoji: '👗', occasion: 'Sister Day'),
  Gift(name: 'Teddy Bear', price: 1800, emoji: '🧸', occasion: 'Sister Day'),
  Gift(name: 'Perfume', price: 2200, emoji: '🌸', occasion: 'Sister Day'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'Sister Day'),

  // Brother Day
  Gift(name: 'Wallet', price: 2000, emoji: '👛', occasion: 'Brother Day'),
  Gift(name: 'Watch', price: 3500, emoji: '⌚', occasion: 'Brother Day'),
  Gift(name: 'Perfume', price: 2500, emoji: '🌸', occasion: 'Brother Day'),
  Gift(name: 'T-Shirt', price: 1800, emoji: '👕', occasion: 'Brother Day'),
  Gift(name: 'Shoes', price: 3000, emoji: '👞', occasion: 'Brother Day'),
  Gift(name: 'Cap', price: 900, emoji: '🧢', occasion: 'Brother Day'),
  Gift(name: 'Chocolates', price: 800, emoji: '🍫', occasion: 'Brother Day'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'Brother Day'),

  // Teacher Day
  Gift(name: 'Flower Bouquet', price: 1500, emoji: '💐', occasion: 'Teacher Day'),
  Gift(name: 'Pen + Diary Set', price: 1500, emoji: '📓', occasion: 'Teacher Day'),
  Gift(name: 'Thank You Card', price: 500, emoji: '💌', occasion: 'Teacher Day'),
  Gift(name: 'Cake', price: 1800, emoji: '🎂', occasion: 'Teacher Day'),
  Gift(name: 'Books Set', price: 2000, emoji: '📚', occasion: 'Teacher Day'),
  Gift(name: 'Mug', price: 1000, emoji: '☕', occasion: 'Teacher Day'),
  Gift(name: 'Chocolates', price: 1000, emoji: '🍫', occasion: 'Teacher Day'),
  Gift(name: 'Photo Frame', price: 1200, emoji: '🖼️', occasion: 'Teacher Day'),

  // Valentine's Day
  Gift(name: 'Red Roses', price: 2500, emoji: '🌹', occasion: "Valentine's Day"),
  Gift(name: 'Teddy + Chocolates', price: 2200, emoji: '🧸', occasion: "Valentine's Day"),
  Gift(name: 'Love Card', price: 500, emoji: '💌', occasion: "Valentine's Day"),
  Gift(name: 'Heart Cake', price: 1800, emoji: '❤️', occasion: "Valentine's Day"),
  Gift(name: 'Perfume', price: 2500, emoji: '🌸', occasion: "Valentine's Day"),
  Gift(name: 'Chocolates Box', price: 1500, emoji: '🍫', occasion: "Valentine's Day"),
  Gift(name: 'Jewellery', price: 4000, emoji: '💎', occasion: "Valentine's Day"),
  Gift(name: 'Balloons', price: 800, emoji: '🎈', occasion: "Valentine's Day"),

  // Baby Shower
  Gift(name: 'Baby Clothes Set', price: 2500, emoji: '👶', occasion: 'Baby Shower'),
  Gift(name: 'Baby Toys', price: 1800, emoji: '🧸', occasion: 'Baby Shower'),
  Gift(name: 'Baby Blanket', price: 1500, emoji: '🧸', occasion: 'Baby Shower'),
  Gift(name: 'Feeder Set', price: 1200, emoji: '🍼', occasion: 'Baby Shower'),
  Gift(name: 'Baby Shoes', price: 1500, emoji: '👟', occasion: 'Baby Shower'),
  Gift(name: 'Baby Cap', price: 800, emoji: '🧢', occasion: 'Baby Shower'),
  Gift(name: 'Baby Lotion Set', price: 2000, emoji: '🧴', occasion: 'Baby Shower'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'Baby Shower'),

  // New Job
  Gift(name: 'Office Bag', price: 3000, emoji: '💼', occasion: 'New Job'),
  Gift(name: 'Pen + Diary', price: 1500, emoji: '📓', occasion: 'New Job'),
  Gift(name: 'Plant', price: 800, emoji: '🪴', occasion: 'New Job'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'New Job'),
  Gift(name: 'Wallet', price: 2000, emoji: '👛', occasion: 'New Job'),
  Gift(name: 'Watch', price: 3500, emoji: '⌚', occasion: 'New Job'),
  Gift(name: 'Flowers', price: 1200, emoji: '💐', occasion: 'New Job'),
  Gift(name: 'Chocolates', price: 1000, emoji: '🍫', occasion: 'New Job'),

  // House Warming
  Gift(name: 'Dinner Set', price: 4500, emoji: '🍽️', occasion: 'House Warming'),
  Gift(name: 'Wall Clock', price: 2000, emoji: '🕰️', occasion: 'House Warming'),
  Gift(name: 'Quran with Stand', price: 3000, emoji: '📖', occasion: 'House Warming'),
  Gift(name: 'Flower Vase', price: 1500, emoji: '🌷', occasion: 'House Warming'),
  Gift(name: 'Bed Sheet Set', price: 3500, emoji: '🛏️', occasion: 'House Warming'),
  Gift(name: 'Tea Set', price: 2500, emoji: '☕', occasion: 'House Warming'),
  Gift(name: 'Lamp', price: 2000, emoji: '💡', occasion: 'House Warming'),
  Gift(name: 'Carpet', price: 4000, emoji: '🧶', occasion: 'House Warming'),

  // Thank You
  Gift(name: 'Thank You Card', price: 500, emoji: '💌', occasion: 'Thank You'),
  Gift(name: 'Chocolates Box', price: 1000, emoji: '🍫', occasion: 'Thank You'),
  Gift(name: 'Flowers', price: 1200, emoji: '💐', occasion: 'Thank You'),
  Gift(name: 'Cute Mug', price: 1000, emoji: '☕', occasion: 'Thank You'),
  Gift(name: 'Cake', price: 1500, emoji: '🎂', occasion: 'Thank You'),
  Gift(name: 'Plant', price: 800, emoji: '🪴', occasion: 'Thank You'),
  Gift(name: 'Perfume', price: 2000, emoji: '🌸', occasion: 'Thank You'),
  Gift(name: 'Photo Frame', price: 1200, emoji: '🖼️', occasion: 'Thank You'),

  
  Gift(name: 'Flowers', price: 1500, emoji: '💐', occasion: 'Get Well Soon'),
  Gift(name: 'Fruits Basket', price: 2000, emoji: '🍎', occasion: 'Get Well Soon'),
  Gift(name: 'Get Well Card', price: 500, emoji: '💌', occasion: 'Get Well Soon'),
  Gift(name: 'Soup + Juice', price: 1200, emoji: '🧃', occasion: 'Get Well Soon'),
  Gift(name: 'Chocolates', price: 1000, emoji: '🍫', occasion: 'Get Well Soon'),
  Gift(name: 'Teddy Bear', price: 1500, emoji: '🧸', occasion: 'Get Well Soon'),
  Gift(name: 'Blanket', price: 2000, emoji: '🧸', occasion: 'Get Well Soon'),
  Gift(name: 'Books', price: 1500, emoji: '📚', occasion: 'Get Well Soon'),
];