import 'package:flutter/material.dart';

class GiftDetailScreen extends StatefulWidget {
  final Map<String, String> gift;
  final bool isDark;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const GiftDetailScreen({
    super.key,
    required this.gift,
    required this.isDark,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  @override
  State<GiftDetailScreen> createState() => _GiftDetailScreenState();
}

class _GiftDetailScreenState extends State<GiftDetailScreen> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  // HAR GIFT KE LIYE ALAG ALAG DATA - [Best Occasion, Why You'll Love It, Price, Caption]
  static const Map<String, List<String>> giftDetails = {
    // FOR HER
    "Teddy Bear": ["Birthday, Valentine Day", "Soft, cuddly and super cute - the perfect companion for every hug.", "Rs. 1,500 - Rs. 3,500", "A soft hug that will always be remembered! 🧸❤️"],
    "Chocolate Box": ["Birthday, Valentine Day", "A premium selection of delicious chocolates - sweet, elegant and loved by all.", "Rs. 800 - Rs. 2,500", "A sweet surprise that wins every heart! 🍫"],
    "Rose Bouquet": ["Valentine Day, Anniversary", "Fresh red roses, beautifully wrapped - the most romantic gift ever.", "Rs. 1,200 - Rs. 3,500", "A bouquet of love, for the one you love! 🌹❤️"],
    "Makeup Kit": ["Birthday, Eid, Anniversary", "A complete premium makeup kit - trendy shades, perfect for every look.", "Rs. 3,000 - Rs. 7,000", "Beauty that shines as bright as she does! 💄✨"],
    "Jewellery Set": ["Wedding, Anniversary, Eid", "Elegant and sparkling jewellery - timeless, classy and unforgettable.", "Rs. 4,000 - Rs. 12,000", "Sparkle that matches her beautiful smile! 💎"],
    "Hand Bag": ["Birthday, Anniversary", "Stylish, spacious and premium quality - perfect for every outfit.", "Rs. 2,500 - Rs. 6,000", "Style that goes everywhere with her! 👜"],
    "Scented Perfume": ["Birthday, Anniversary", "A soft, long-lasting fragrance - sweet, fresh and truly unforgettable.", "Rs. 2,000 - Rs. 5,500", "A fragrance as beautiful as her! 🌸"],
    "Plush Toy": ["Birthday, Valentine Day", "Extra soft and huggable - a cute friend she will love forever.", "Rs. 1,000 - Rs. 2,800", "Cuteness that melts every heart! 🐻"],
    "Skin Care Set": ["Birthday, Thank You", "A complete glow care set - natural, gentle and perfect for daily pampering.", "Rs. 2,800 - Rs. 6,500", "Glow that comes from love and care! 🧴✨"],
    "Cute Mug": ["Birthday, Friendship Day", "A cute, personal mug - perfect for her morning chai and coffee moments.", "Rs. 700 - Rs. 1,800", "Every sip will remind her of you! ☕❤️"],
    "Hair Accessories": ["Birthday, Eid", "Trendy and elegant hair accessories - pretty, stylish and so her.", "Rs. 900 - Rs. 2,200", "Little details that make her shine! 🎀"],
    "Love Letter Box": ["Anniversary, Valentine Day", "A heartfelt keepsake she can keep forever - full of love and beautiful memories.", "Rs. 1,200 - Rs. 3,000", "Words from the heart, kept forever in a beautiful box! 💌❤️"],
    // FOR HIM
    "Watch": ["Birthday, Anniversary", "A classy and timeless piece - stylish, premium and perfect for daily wear.", "Rs. 2,500 - Rs. 8,000", "Time passes, but your love will always be remembered! ⌚"],
    "Perfume": ["Birthday, Eid, Anniversary", "A bold, long-lasting fragrance - confident, fresh and unforgettable.", "Rs. 2,000 - Rs. 6,000", "A fragrance that becomes a beautiful memory! 🌸"],
    "Wallet": ["Birthday, Fathers Day, Eid", "Premium leather wallet - slim, durable and perfect for everyday use.", "Rs. 1,800 - Rs. 4,500", "A classic gift for a classic man! 👛"],
    "Sunglasses": ["Birthday, Summer, Trip", "Stylish UV-protection sunglasses - cool, trendy and perfect for every look.", "Rs. 1,500 - Rs. 4,000", "Cool looks, cool vibes, only for him! 🕶️"],
    "Leather Belt": ["Birthday, Anniversary", "Genuine leather belt - premium finish, perfect fit, everyday class.", "Rs. 1,200 - Rs. 3,000", "Style that holds everything together! 🧳"],
    "Sports Shoes": ["Birthday, New Year", "Comfortable and sporty shoes - perfect for gym, running and daily style.", "Rs. 3,500 - Rs. 9,000", "Step into style, step into confidence! 👟"],
    "Headphones": ["Birthday, Graduation", "Crystal clear sound and deep bass - perfect for music, movies and gaming.", "Rs. 3,000 - Rs. 8,500", "Music that feels like magic! 🎧"],
    "Smart Watch": ["Birthday, Graduation", "Smart, stylish and full of features - fitness, calls and notifications in one.", "Rs. 5,000 - Rs. 15,000", "Smart gift for a smart man! ⌚✨"],
    "Shaving Kit": ["Birthday, Fathers Day", "A complete premium shaving kit - smooth, clean and perfect grooming.", "Rs. 1,500 - Rs. 4,000", "Sharp look, sharp man! 🪒"],
    "T-Shirt": ["Birthday, Friendship Day", "Premium cotton T-shirt - comfortable, trendy and perfect for daily wear.", "Rs. 1,000 - Rs. 2,500", "Simple, stylish and so him! 👕"],
    "Backpack": ["Birthday, Graduation, Trip", "Durable and spacious backpack - perfect for office, university and travel.", "Rs. 2,200 - Rs. 5,500", "Carry your dreams everywhere! 🎒"],
    "Coffee Mug": ["Birthday, Thank You", "A strong, stylish mug - perfect for his morning coffee and late night work.", "Rs. 600 - Rs. 1,500", "Every coffee tastes better with love! ☕"],
    // BIRTHDAY
    "Birthday Cake": ["Birthday, Celebration", "Fresh, delicious and beautifully decorated - made to make the day extra special.", "Rs. 1,200 - Rs. 4,000", "Sweet moments, sweet memories, sweet celebration! 🎂"],
    "Birthday Balloons": ["Birthday, Party", "Colourful and fun balloons - instant party vibes and happy smiles.", "Rs. 500 - Rs. 1,500", "Happiness that floats in the air! 🎈"],
    "Birthday Card": ["Birthday", "A beautiful card with heartfelt birthday wishes - simple, yet truly touching.", "Rs. 200 - Rs. 700", "Words that make birthdays warmer! 💌"],
    "Birthday Gift Box": ["Birthday", "A surprise box full of goodies - chocolates, cards and cute surprises inside.", "Rs. 2,000 - Rs. 5,000", "One box, endless surprises! 🎁"],
    "Party Caps": ["Birthday, Party", "Fun and colourful party caps - perfect for photos and party fun.", "Rs. 300 - Rs. 900", "Party mode ON! 🎉"],
    "Chocolate Cake": ["Birthday", "Rich, moist chocolate cake - the favourite of every birthday lover.", "Rs. 1,500 - Rs. 4,500", "Chocolate happiness in every bite! 🍫🎂"],
    "Photo Cake": ["Birthday, Anniversary", "A cake with your favourite photo - personal, sweet and unforgettable.", "Rs. 2,000 - Rs. 5,500", "A memory you can taste! 📸🎂"],
    "Flower Cake": ["Birthday", "A floral designed cake - beautiful, fresh and perfect for elegant celebrations.", "Rs. 1,800 - Rs. 5,000", "Beauty and sweetness in one cake! 🌸🎂"],
    "Teddy Cake": ["Birthday", "A cute teddy shaped cake - adorable, delicious and perfect for kids and loved ones.", "Rs. 2,200 - Rs. 5,500", "Cutest cake for the cutest birthday star! 🧸🎂"],
    "Cupcakes Set": ["Birthday, Party", "A set of mini cupcakes - colourful, tasty and perfect for sharing.", "Rs. 1,000 - Rs. 3,000", "Small cakes, big smiles! 🧁"],
    "Surprise Box": ["Birthday, Anniversary", "A mystery surprise box - you never know what love is inside.", "Rs. 1,500 - Rs. 4,000", "Surprises that make hearts jump! 🎁"],
    "Birthday Flowers": ["Birthday", "Fresh and bright birthday flowers - joy, colour and love in one bouquet.", "Rs. 1,000 - Rs. 3,000", "Flowers that say Happy Birthday beautifully! 💐"],
    // ANNIVERSARY
    "Flowers": ["Anniversary, Valentine Day", "Fresh, fragrant and hand-picked - the classic way to say 'I love you'.", "Rs. 1,000 - Rs. 3,000", "Love as beautiful as flowers, always blooming! 🌹"],
    "Couple Mug": ["Anniversary, Valentine Day", "A matching couple mug set - perfect for chai together, every morning.", "Rs. 900 - Rs. 2,200", "Two hearts, one chai! ☕❤️"],
    "Couple Watch": ["Anniversary, Wedding", "Matching couple watches - timeless love, ticking together forever.", "Rs. 4,000 - Rs. 10,000", "Together, in every second! ⌚❤️"],
    "Anniversary Cake": ["Anniversary", "A romantic anniversary cake - elegant, delicious and made for two.", "Rs. 1,500 - Rs. 4,500", "Years of love, one sweet cake! 🎂❤️"],
    "Love Frame": ["Anniversary, Valentine Day", "A beautiful photo frame - your best memory, framed forever.", "Rs. 1,200 - Rs. 3,500", "A memory framed forever! 🖼️❤️"],
    "Couple Cushion": ["Anniversary", "Soft couple cushions - cozy, cute and perfect for home love.", "Rs. 1,000 - Rs. 2,500", "Comfort that feels like love! ❤️"],
    "Rose Chocolates": ["Anniversary, Valentine Day", "Roses + chocolates - the perfect romantic combo for your special day.", "Rs. 1,200 - Rs. 3,200", "Romance in every bite and petal! 🍫🌹"],
    "Anniversary Card": ["Anniversary", "A heartfelt anniversary card - love written in the most beautiful words.", "Rs. 250 - Rs. 800", "Love that grows every year! 💌"],
    "Couple T-Shirt": ["Anniversary", "Matching couple T-shirts - fun, cute and perfect for couple photos.", "Rs. 1,800 - Rs. 4,000", "Matching outfits, matching hearts! 👕❤️"],
    "Candle Dinner Set": ["Anniversary, Valentine Day", "A romantic candle dinner set - soft light, sweet vibes, perfect evening.", "Rs. 2,000 - Rs. 5,000", "A dinner lit by love! 🕯️❤️"],
    "Memory Album": ["Anniversary, Wedding", "A beautiful memory album - all your moments, kept safe forever.", "Rs. 1,500 - Rs. 4,000", "Every page tells your love story! 📸"],
    "Heart Balloon": ["Anniversary, Valentine Day", "A big heart balloon - cute, romantic and perfect for surprise decor.", "Rs. 600 - Rs. 1,800", "Love that floats high! 🎈❤️"],
    // GET WELL SOON
    "Greeting Card": ["Get Well Soon, Thank You", "A beautiful card with heartfelt words - simple, yet truly touching.", "Rs. 200 - Rs. 800", "Words that truly touch the heart! 💌"],
    "Fruit Basket": ["Get Well Soon, Eid", "Fresh fruits, beautifully packed - healthy, tasty and full of care.", "Rs. 1,200 - Rs. 3,500", "Health and love in one basket! 🍎"],
    "Get Well Flowers": ["Get Well Soon", "Bright and cheerful flowers - to bring smiles and fast recovery.", "Rs. 1,000 - Rs. 3,000", "Flowers that heal hearts! 💐"],
    "Soup Basket": ["Get Well Soon", "Warm soup and care essentials - comfort in a basket.", "Rs. 1,000 - Rs. 2,800", "Warmth that heals! 🍲"],
    "Herbal Tea Set": ["Get Well Soon, Thank You", "Soothing herbal teas - calm, healthy and perfect for recovery.", "Rs. 1,200 - Rs. 3,200", "A cup of care in every sip! 🍵"],
    "Soft Blanket": ["Get Well Soon", "An extra soft blanket - warm, cozy and full of comfort.", "Rs. 1,500 - Rs. 4,000", "Wrapped in love and warmth! 🧣"],
    "Care Hamper": ["Get Well Soon", "A complete care hamper - teas, fruits, cards and lots of love.", "Rs. 2,000 - Rs. 5,000", "Care that feels like a hug! 🎁"],
    "Motivation Book": ["Get Well Soon, Graduation", "An inspiring book - hope, strength and positive vibes on every page.", "Rs. 800 - Rs. 2,000", "Words that give strength! 📖"],
    "Dry Fruits": ["Get Well Soon, Eid", "Premium dry fruits - healthy, tasty and perfect for fast recovery.", "Rs. 1,500 - Rs. 4,000", "Health in every bite! 🥜"],
    "Juice Basket": ["Get Well Soon", "Fresh juices and fruits - energy, vitamins and love in one basket.", "Rs. 1,000 - Rs. 3,000", "Fresh energy, fresh hope! 🧃"],
    // MOTHERS DAY
    "Flower Bouquet": ["Mothers Day, Birthday", "A gorgeous hand-arranged bouquet - fresh, elegant and full of love.", "Rs. 1,500 - Rs. 4,000", "For the woman who gave us everything! 💐❤️"],
    "Scented Candle": ["Mothers Day", "A calming scented candle - soft light, sweet fragrance, pure peace.", "Rs. 1,200 - Rs. 3,000", "A calm and beautiful gift for a beautiful soul! 🕯️"],
    "Mom Mug": ["Mothers Day, Birthday", "A special Mom mug - for her chai, coffee and endless love.", "Rs. 700 - Rs. 1,800", "Best Mom deserves the best mug! ☕❤️"],
    "Shawl": ["Mothers Day, Eid", "A soft, elegant shawl - warm, classy and perfect for every occasion.", "Rs. 2,000 - Rs. 5,500", "Warmth as soft as Mom's love! 🧣"],
    "Mom Cake": ["Mothers Day, Birthday", "A beautiful Mom cake - sweet, soft and made with love.", "Rs. 1,500 - Rs. 4,500", "Sweetest cake for the sweetest Mom! 🎂❤️"],
    "Jewellery Box": ["Mothers Day, Anniversary", "A pretty jewellery box - to keep her treasures safe and shining.", "Rs. 1,500 - Rs. 4,000", "Treasure box for a treasure Mom! 💎"],
    "Mom Frame": ["Mothers Day", "A lovely Mom photo frame - your best moment with Mom, forever.", "Rs. 1,000 - Rs. 3,000", "Mom - framed in our hearts forever! 🖼️❤️"],
    "Tea Set": ["Mothers Day, House Warming", "A beautiful tea set - perfect for Mom's evening chai time.", "Rs. 2,500 - Rs. 6,000", "Chai time with Mom is the best time! 🍵"],
    "Mom Chocolates": ["Mothers Day", "Premium chocolates for Mom - sweet, just like her.", "Rs. 900 - Rs. 2,500", "Sweetness for the sweetest Mom! 🍫❤️"],
    "Prayer Mat": ["Mothers Day, Eid", "A soft, beautiful prayer mat - a gift of love, dua and respect.", "Rs. 1,200 - Rs. 3,500", "A gift wrapped in duas! 🕌❤️"],
    // FATHERS DAY
    "Dad Wallet": ["Fathers Day, Birthday", "Premium wallet for Dad - strong, classy and everyday useful.", "Rs. 1,800 - Rs. 4,500", "For the man who holds our world! 👛"],
    "Tie Set": ["Fathers Day, Office", "A premium tie set - sharp, elegant and perfect for office look.", "Rs. 1,500 - Rs. 4,000", "Style that shows your love and respect! 👔"],
    "Dad Mug": ["Fathers Day, Birthday", "A Best Dad mug - for his morning chai and proud moments.", "Rs. 700 - Rs. 1,800", "Best Dad, best mug! ☕"],
    "Dad Perfume": ["Fathers Day, Eid", "A strong, classy perfume for Dad - confident and unforgettable.", "Rs. 2,000 - Rs. 5,500", "A fragrance as strong as Dad! 🌸"],
    "Dad Cake": ["Fathers Day, Birthday", "A special Dad cake - sweet, fun and made for the hero of home.", "Rs. 1,500 - Rs. 4,500", "Sweetest cake for our superhero! 🎂"],
    "Shirt": ["Fathers Day, Birthday", "A premium shirt - comfortable, classy and perfect for Dad.", "Rs. 2,000 - Rs. 5,000", "Classy shirt for a classy Dad! 👕"],
    "Dad Frame": ["Fathers Day", "A beautiful Dad frame - a memory with Dad, kept forever.", "Rs. 1,000 - Rs. 3,000", "Dad - our hero, framed forever! 🖼️"],
    "Watch for Dad": ["Fathers Day, Birthday", "An elegant watch for Dad - timeless, just like his love.", "Rs. 2,500 - Rs. 7,000", "Time with Dad is priceless! ⌚"],
    "Cap": ["Fathers Day", "A stylish cap - casual, cool and perfect for Dad's daily wear.", "Rs. 800 - Rs. 2,000", "Cool cap for a cool Dad! 🧢"],
    "Dad Chocolates": ["Fathers Day", "Premium chocolates for Dad - sweet surprise for a strong man.", "Rs. 900 - Rs. 2,500", "Sweet love for a strong Dad! 🍫"],
    // TEACHERS DAY
    "Best Teacher Mug": ["Teachers Day, Thank You", "A Best Teacher mug - for the teacher who makes learning fun.", "Rs. 800 - Rs. 2,000", "Thank you for making us who we are! 📚"],
    "Thank You Card": ["Teachers Day, Thank You", "A heartfelt thank you card - gratitude in the most beautiful words.", "Rs. 200 - Rs. 700", "Thank you for every lesson of life! 💌"],
    "Teacher Flowers": ["Teachers Day", "Fresh flowers for teacher - respect, love and gratitude in one bouquet.", "Rs. 1,000 - Rs. 3,000", "Flowers for the one who blooms minds! 💐"],
    "Diary": ["Teachers Day, Graduation", "A premium diary - perfect for notes, plans and beautiful ideas.", "Rs. 900 - Rs. 2,500", "For the one who writes our future! 📓"],
    "Pen Set": ["Teachers Day", "A luxury pen set - smooth, elegant and perfect for a great teacher.", "Rs. 1,000 - Rs. 3,000", "A pen for the one who writes destinies! 🖊️"],
    "Book": ["Teachers Day", "An inspiring book - knowledge, wisdom and love for learning.", "Rs. 800 - Rs. 2,200", "A book for the book of knowledge! 📖"],
    "Teacher Cake": ["Teachers Day", "A special teacher cake - sweet, fun and full of respect.", "Rs. 1,200 - Rs. 3,500", "Sweetest cake for the sweetest teacher! 🎂"],
    "Teacher Frame": ["Teachers Day", "A beautiful teacher frame - a memory with the best teacher.", "Rs. 1,000 - Rs. 3,000", "Teacher - framed in our hearts! 🖼️"],
    "Chocolates": ["Teachers Day, Thank You", "Premium chocolates - a sweet thank you for a sweet teacher.", "Rs. 700 - Rs. 2,000", "Sweet thank you for a sweet teacher! 🍫"],
    "Plant": ["Teachers Day, Thank You", "A beautiful green plant - growing, just like the knowledge you gave.", "Rs. 800 - Rs. 2,200", "Knowledge that keeps growing! 🪴"],
    // EID
    "Eidi Envelope": ["Eid, Celebration", "A beautiful, festive envelope - the cutest way to give Eidi with love.", "Rs. 500 - Rs. 5,000", "Eid happiness in a beautiful envelope! 🌙"],
    "Dry Fruits Box": ["Eid, Family", "Premium dry fruits - healthy, tasty and perfect for Eid mehmaan.", "Rs. 1,500 - Rs. 4,000", "A healthy and happy gift for Eid! 🥜"],
    "Eid Cake": ["Eid", "A festive Eid cake - sweet, beautiful and perfect for Eid dawat.", "Rs. 1,500 - Rs. 4,500", "Meethi Eid, meetha cake! 🎂🌙"],
    "Eid Gift Box": ["Eid", "A complete Eid gift box - chocolates, dates and festive surprises.", "Rs. 2,000 - Rs. 5,500", "Eid joys packed in one box! 🎁🌙"],
    "Mehndi Set": ["Eid, Wedding", "A beautiful mehndi set - dark, pretty and perfect for Eid hands.", "Rs. 800 - Rs. 2,500", "Mehndi that makes Eid more beautiful! 🌸"],
    "Eid Dress": ["Eid", "A beautiful Eid dress - festive, elegant and perfect for Eid day.", "Rs. 3,000 - Rs. 10,000", "Eid look that shines bright! 👗🌙"],
    "Eid Chocolates": ["Eid", "Festive Eid chocolates - sweet, premium and perfect for everyone.", "Rs. 900 - Rs. 2,800", "Meethi Eid, meethi chocolates! 🍫"],
    "Dates Box": ["Eid, Ramadan", "Premium dates box - traditional, healthy and perfect for Eid.", "Rs. 1,200 - Rs. 3,500", "Sunnah sweetness for Eid! 🌴"],
    "Eid Flowers": ["Eid", "Fresh Eid flowers - festive, bright and full of Eid happiness.", "Rs. 1,000 - Rs. 3,000", "Flowers that bloom like Eid joy! 💐🌙"],
    "Eid Card": ["Eid", "A beautiful Eid card - Eid Mubarak in the sweetest words.", "Rs. 200 - Rs. 700", "Eid Mubarak with all my love! 💌🌙"],
    // WEDDING / BARAT
    "Bridal Gift Set": ["Wedding, Barat", "A complete premium bridal set - elegant, luxurious and perfect for a new beginning.", "Rs. 5,000 - Rs. 15,000", "A beautiful start to a beautiful new life! 💍"],
    "Wedding Frame": ["Wedding, Barat", "A beautiful wedding frame - your big day, kept forever.", "Rs. 2,000 - Rs. 6,000", "A memory framed forever! 🖼️❤️"],
    "Bridal Jewellery": ["Wedding, Barat", "Stunning bridal jewellery - sparkling, elegant and perfect for dulhan.", "Rs. 6,000 - Rs. 20,000", "Shine like a dulhan should! 💎"],
    "Wedding Cake": ["Wedding, Barat", "A grand wedding cake - elegant, delicious and made for the big day.", "Rs. 3,000 - Rs. 10,000", "Sweet start to a sweet forever! 🎂💍"],
    "Couple Gift Box": ["Wedding, Anniversary", "A lovely couple gift box - surprises for bride and groom together.", "Rs. 3,000 - Rs. 8,000", "Two hearts, one beautiful box! 🎁❤️"],
    "Bridal Clutch": ["Wedding, Barat", "An elegant bridal clutch - stylish, premium and perfect for dulhan.", "Rs. 2,500 - Rs. 6,500", "Elegance in her hands! 👜"],
    "Wedding Flowers": ["Wedding, Barat", "Fresh wedding flowers - romantic, beautiful and perfect for the big day.", "Rs. 1,500 - Rs. 4,500", "Flowers that bloom with love! 💐"],
    "Dinner Set": ["Wedding, House Warming", "A premium dinner set - elegant, durable and perfect for new home.", "Rs. 5,000 - Rs. 15,000", "Dinners that feel like celebrations! 🍽️"],
    "Bed Sheet Set": ["Wedding, House Warming", "A soft, luxury bed sheet set - cozy, beautiful and perfect for new home.", "Rs. 3,000 - Rs. 8,000", "Comfort for a new beginning! 🛏️"],
    "Wedding Card": ["Wedding, Barat", "A beautiful wedding card - love and duas for the happy couple.", "Rs. 300 - Rs. 1,000", "Duas for a happy forever! 💌"],
    // BABY SHOWER
    "Baby Toys": ["Baby Shower, Birthday", "Safe, soft and super fun - perfect for little hands and big smiles.", "Rs. 1,000 - Rs. 3,500", "Little joys for the littlest one! 🧸"],
    "Baby Clothes": ["Baby Shower, New Born", "Soft, cute baby clothes - gentle on skin, adorable on baby.", "Rs. 1,200 - Rs. 4,000", "Cuteness in every tiny outfit! 👶"],
    "Baby Blanket": ["Baby Shower", "An extra soft baby blanket - warm, cozy and safe for baby.", "Rs. 1,500 - Rs. 4,000", "Wrapped in love and softness! 🧣👶"],
    "Baby Feeder Set": ["Baby Shower, New Born", "A complete feeder set - safe, easy and perfect for new moms.", "Rs. 1,200 - Rs. 3,500", "Feeding time made lovely! 🍼"],
    "Baby Cake": ["Baby Shower, Birthday", "A cute baby cake - adorable, sweet and perfect for welcome baby.", "Rs. 1,500 - Rs. 4,500", "Welcome baby, with sweetness! 🎂👶"],
    "Baby Balloons": ["Baby Shower", "Cute baby balloons - soft colours, happy vibes, perfect decor.", "Rs. 500 - Rs. 1,800", "Welcome to the world, little star! 🎈"],
    "Baby Frame": ["Baby Shower", "A cute baby frame - first photo, first memory, forever.", "Rs. 1,000 - Rs. 3,000", "First moments, framed forever! 🖼️👶"],
    "Baby Shoes": ["Baby Shower", "Tiny, soft baby shoes - adorable, comfy and perfect for tiny feet.", "Rs. 800 - Rs. 2,500", "Tiny steps, big dreams! 👟👶"],
    "Baby Gift Box": ["Baby Shower", "A complete baby gift box - clothes, toys and lots of love.", "Rs. 2,500 - Rs. 6,500", "Everything baby needs, with love! 🎁👶"],
    "Baby Rattle": ["Baby Shower", "A cute baby rattle - colourful, safe and fun for baby.", "Rs. 500 - Rs. 1,500", "Sounds that make baby smile! 🎀"],
    // FRIENDSHIP DAY
    "Friendship Bracelet": ["Friendship Day, Birthday", "A cute friendship bracelet - a promise of forever friendship.", "Rs. 600 - Rs. 1,800", "Friends forever, and always! 💛"],
    "Photo Frame": ["Friendship Day, Birthday", "A beautiful photo frame - your best friendship moment, forever.", "Rs. 1,000 - Rs. 3,000", "Friendship framed forever! 📸"],
    "Friend Mug": ["Friendship Day", "A fun friend mug - for chai, gossip and endless talks.", "Rs. 700 - Rs. 1,800", "Chai with a friend is the best chai! ☕"],
    "Friend Cake": ["Friendship Day", "A fun friend cake - sweet, colourful and made for besties.", "Rs. 1,200 - Rs. 3,500", "Sweet cake for the sweetest friend! 🎂"],
    "Friend Chocolates": ["Friendship Day", "Premium chocolates for friend - sweet, just like your friendship.", "Rs. 800 - Rs. 2,200", "Sweet friendship, sweet chocolates! 🍫"],
    "Friendship Card": ["Friendship Day", "A heartfelt friendship card - your friendship in beautiful words.", "Rs. 200 - Rs. 700", "Thank you for being my friend! 💌"],
    "Best Friend T-Shirt": ["Friendship Day, Birthday", "Matching best friend T-shirts - fun, cute and perfect for duo photos.", "Rs. 1,500 - Rs. 3,500", "Besties who match together, stay together! 👕"],
    "Friend Gift Box": ["Friendship Day", "A fun friend gift box - surprises, snacks and lots of love.", "Rs. 1,800 - Rs. 4,500", "One box, full of friendship! 🎁"],
    "Friend Flowers": ["Friendship Day", "Bright friendship flowers - cheerful, happy and full of love.", "Rs. 1,000 - Rs. 3,000", "Flowers for my favourite person! 💐"],
    "Memory Book": ["Friendship Day, Graduation", "A beautiful memory book - all your fun moments, kept together.", "Rs. 1,200 - Rs. 3,200", "Our story, in one beautiful book! 📖"],
    // VALENTINE DAY
    "Red Roses": ["Valentine Day, Anniversary", "Classic red roses - timeless, romantic and always the right choice.", "Rs. 1,000 - Rs. 3,500", "Red roses for a love that never fades! 🌹❤️"],
    "Heart Chocolate": ["Valentine Day", "Heart shaped chocolates - sweet, romantic and perfect for your valentine.", "Rs. 900 - Rs. 2,800", "Sweet heart for my sweetheart! ❤️🍫"],
    "Valentine Teddy": ["Valentine Day", "A cute valentine teddy - holding a heart, just like you hold mine.", "Rs. 1,500 - Rs. 3,800", "A teddy that hugs like you do! 🧸❤️"],
    "Love Mug": ["Valentine Day", "A romantic love mug - for chai together, every morning.", "Rs. 800 - Rs. 2,000", "Love in every sip! ☕❤️"],
    "Valentine Cake": ["Valentine Day", "A romantic valentine cake - heart shaped, sweet and made for two.", "Rs. 1,500 - Rs. 4,500", "Sweet love in every bite! 🎂❤️"],
    "Love Card": ["Valentine Day", "A romantic love card - your feelings, in the most beautiful words.", "Rs. 250 - Rs. 800", "My heart speaks through this card! 💌❤️"],
    "Valentine Frame": ["Valentine Day", "A romantic valentine frame - your love story, framed forever.", "Rs. 1,200 - Rs. 3,500", "Our love, framed forever! 🖼️❤️"],
    "Heart Balloon|Valentine Day": ["Valentine Day", "A big heart balloon - romantic, cute and perfect for surprise.", "Rs. 600 - Rs. 1,800", "My heart floats for you! 🎈❤️"],
    "Valentine Perfume": ["Valentine Day", "A romantic perfume - soft, sweet and unforgettable, just like her.", "Rs. 2,200 - Rs. 6,000", "A fragrance of love! 🌸❤️"],
    "Love Gift Box": ["Valentine Day", "A complete love gift box - roses, chocolates and romantic surprises.", "Rs. 2,500 - Rs. 6,500", "All my love, in one box! 🎁❤️"],
    // GRADUATION
    "Graduation Cap Gift": ["Graduation, Success", "A proud and memorable gift to celebrate hard work and big success.", "Rs. 1,500 - Rs. 4,000", "You did it! Proud of your success! 🎓"],
    "Success Diary": ["Graduation, New Year", "A premium success diary - for new dreams, new goals, new wins.", "Rs. 900 - Rs. 2,500", "New chapter, new dreams! 📓✨"],
    "Graduation Cake": ["Graduation", "A celebratory graduation cake - sweet success in every bite.", "Rs. 1,500 - Rs. 4,500", "Sweet success tastes best! 🎂🎓"],
    "Success Pen": ["Graduation", "A premium success pen - for signing the next big chapter.", "Rs. 1,000 - Rs. 3,000", "Write your own success story! 🖊️"],
    "Graduation Frame": ["Graduation", "A proud graduation frame - your achievement, framed forever.", "Rs. 1,200 - Rs. 3,200", "Proud moment, framed forever! 🖼️🎓"],
    "Success Flowers": ["Graduation", "Bright success flowers - to celebrate hard work and big win.", "Rs. 1,000 - Rs. 3,000", "Flowers for a bright future! 💐🎓"],
    "Laptop Bag": ["Graduation, New Job", "A premium laptop bag - stylish, durable and perfect for new journey.", "Rs. 2,500 - Rs. 6,500", "Carry your success everywhere! 💼"],
    "Graduation Card": ["Graduation", "A proud graduation card - congratulations in the sweetest words.", "Rs. 250 - Rs. 800", "Congratulations, graduate! 💌🎓"],
    "Success Chocolates": ["Graduation", "Premium success chocolates - sweet celebration for a sweet win.", "Rs. 800 - Rs. 2,200", "Sweet win, sweet chocolates! 🍫🎓"],
    "Graduation Gift Box": ["Graduation", "A complete graduation gift box - celebration, surprises and pride.", "Rs. 2,500 - Rs. 6,000", "Celebrating your big win! 🎁🎓"],
    // NEW YEAR
    "New Year Cake": ["New Year", "A festive New Year cake - sweet start to a sweet new year.", "Rs. 1,500 - Rs. 4,500", "Sweet start to a brand new year! 🎂🎉"],
    "Party Gift Box": ["New Year, Birthday", "A fun party gift box - party props, snacks and surprises.", "Rs. 2,000 - Rs. 5,000", "Party jo kabhi na bhule! 🎁🎉"],
    "New Year Card": ["New Year", "A beautiful New Year card - new hopes, new dreams, new beginnings.", "Rs. 200 - Rs. 700", "Happy New Year, with all my love! 💌🎉"],
    "New Year Flowers": ["New Year", "Fresh New Year flowers - fresh start, fresh happiness.", "Rs. 1,000 - Rs. 3,000", "Fresh flowers for a fresh year! 💐"],
    "Party Balloons": ["New Year, Birthday", "Colourful party balloons - instant party vibes and happy photos.", "Rs. 500 - Rs. 1,500", "Party mode ON for New Year! 🎈🎉"],
    "New Year Chocolates": ["New Year", "Festive New Year chocolates - sweet start to sweet year.", "Rs. 900 - Rs. 2,500", "Sweet year ahead! 🍫🎉"],
    "New Year Diary": ["New Year", "A fresh New Year diary - for new goals, new plans, new wins.", "Rs. 900 - Rs. 2,500", "New year, new dreams! 📓🎉"],
    "New Year Frame": ["New Year", "A beautiful New Year frame - new memories, framed forever.", "Rs. 1,000 - Rs. 3,000", "New memories, new frame! 🖼️🎉"],
    "Celebration Box": ["New Year, Birthday", "A full celebration box - party, fun and surprises in one.", "Rs. 2,200 - Rs. 5,500", "Celebration that never ends! 🎉"],
    "New Year Mug": ["New Year", "A festive New Year mug - for morning chai in the new year.", "Rs. 700 - Rs. 1,800", "New year, new chai vibes! ☕🎉"],
    // THANK YOU
    "Thank You Flowers": ["Thank You", "Beautiful thank you flowers - gratitude in the prettiest form.", "Rs. 1,000 - Rs. 3,000", "Thank you, from the bottom of my heart! 🌷"],
    "Sweet Box": ["Thank You, Eid", "A sweet box - mithai, chocolates and lots of thank you.", "Rs. 800 - Rs. 2,500", "Sweet thank you for sweet people! 🍬"],
    "Thank You Cake": ["Thank You", "A sweet thank you cake - gratitude in every bite.", "Rs. 1,200 - Rs. 3,500", "Thank you, with sweetness! 🎂"],
    "Thank You Card|Teachers Day": ["Teachers Day, Thank You", "A heartfelt thank you card - gratitude in the most beautiful words.", "Rs. 200 - Rs. 700", "Thank you for every lesson of life! 💌"],
    "Thank You Mug": ["Thank You", "A thank you mug - for the one who deserves all the thanks.", "Rs. 700 - Rs. 1,800", "Thank you, in every sip! ☕"],
    "Thank You Gift Box": ["Thank You", "A complete thank you box - surprises and gratitude together.", "Rs. 1,800 - Rs. 4,500", "A box full of thank you! 🎁"],
    "Thank You Chocolates": ["Thank You", "Premium thank you chocolates - sweet gratitude.", "Rs. 800 - Rs. 2,200", "Sweet thanks for a sweet soul! 🍫"],
    "Thank You Frame": ["Thank You", "A beautiful thank you frame - gratitude, framed forever.", "Rs. 1,000 - Rs. 3,000", "Thankful, always! 🖼️"],
    "Thank You Plant": ["Thank You", "A green thank you plant - gratitude that keeps growing.", "Rs. 800 - Rs. 2,200", "Thank you that grows every day! 🪴"],
    "Thank You Diary": ["Thank You", "A pretty thank you diary - for thoughts, dreams and gratitude.", "Rs. 900 - Rs. 2,500", "Grateful today, grateful always! 📓"],
    // HOUSE WARMING
    "Home Decor Set": ["House Warming, Wedding", "Elegant and modern decor - makes any new home feel warm and beautiful.", "Rs. 3,000 - Rs. 8,000", "A beautiful gift for a beautiful new home! 🏠"],
    "Plant Gift": ["House Warming, Thank You", "A beautiful green plant - fresh air, fresh vibes, fresh home.", "Rs. 800 - Rs. 2,500", "Green love for a new home! 🪴🏠"],
    "Wall Frame": ["House Warming, Wedding", "A beautiful wall frame - art that makes home feel like home.", "Rs. 1,200 - Rs. 3,500", "Home sweet home, framed beautifully! 🖼️"],
    "Cushion Set": ["House Warming", "Soft, stylish cushions - cozy, colourful and perfect for new sofa.", "Rs. 1,500 - Rs. 4,000", "Comfort that feels like home! 🛋️"],
    "Dinner Set Gift": ["House Warming, Wedding", "A premium dinner set - elegant dinners for the new home.", "Rs. 4,000 - Rs. 12,000", "Dinners that feel like celebrations! 🍽️🏠"],
    "Lamp": ["House Warming", "A beautiful lamp - warm light for warm evenings at new home.", "Rs. 1,500 - Rs. 4,500", "Light that makes home shine! 💡🏠"],
    "House Cake": ["House Warming", "A sweet house warming cake - welcome home in sweetness.", "Rs. 1,500 - Rs. 4,500", "Welcome home, sweet home! 🎂🏠"],
    "House Flowers": ["House Warming", "Fresh house flowers - fresh vibes for a fresh new home.", "Rs. 1,000 - Rs. 3,000", "Fresh flowers for a fresh home! 💐🏠"],
    "House Gift Box": ["House Warming", "A complete house gift box - decor, candles and home love.", "Rs. 2,500 - Rs. 6,500", "Everything new home needs! 🎁🏠"],
    "Quran Frame": ["House Warming, Eid", "A beautiful Quran frame - barkat, love and duas for new home.", "Rs. 2,000 - Rs. 5,500", "Barkat for a beautiful new home! 🕌🏠"],
  };

  Map<String, String> get detail {
    String name = widget.gift["name"] ?? "";
    String cat = widget.gift["category"] ?? "";
    var d = giftDetails[name];
    if (d == null) {
      return {
        "occasion": cat,
        "why": "A premium, thoughtful gift made to make every moment special.",
        "price": "Rs. 1,500 - Rs. 5,000",
        "caption": "A perfect gift for a perfect memory! 🎁",
      };
    }
    return {
      "occasion": d[0],
      "why": d[1],
      "price": d[2],
      "caption": d[3],
    };
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDark ? const Color(0xFF2D1454) : Colors.white;
    final textColor = widget.isDark ? Colors.white : Colors.black87;
    final d = detail;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.gift["name"] ?? "",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
              widget.onFavoriteToggle?.call();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFav
                      ? '${widget.gift["category"]} added to Favorites ❤️'
                      : '${widget.gift["category"]} removed from Favorites'),
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.deepPurple,
                ),
              );
            },
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : textColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.15),
              ),
              child: Center(
                child: Text(widget.gift["emoji"] ?? "🎁",
                    style: const TextStyle(fontSize: 90)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.gift["name"] ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(widget.gift["category"] ?? "",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            _infoBox("🎯  Best Occasion", d["occasion"]!, textColor, widget.isDark),
            const SizedBox(height: 12),
            _infoBox("💝  Why You'll Love It", d["why"]!, textColor, widget.isDark),
            const SizedBox(height: 12),
            _infoBox("💰  Price", d["price"]!, textColor, widget.isDark),
            const SizedBox(height: 12),
            _infoBox("✨  Caption", d["caption"]!, textColor, widget.isDark),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value, Color textColor, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.12)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(color: textColor, fontSize: 15)),
        ],
      ),
    );
  }
}