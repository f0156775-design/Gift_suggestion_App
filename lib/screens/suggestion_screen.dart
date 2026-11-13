import 'package:flutter/material.dart';
import '../data/gifts_data.dart';
import 'favorites_screen.dart';
import 'widgets/gift_card.dart';

class SuggestionsScreen extends StatefulWidget {
  final String occasion;
  const SuggestionsScreen({super.key, required this.occasion});
  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  Map<String, List<Map<String, dynamic>>> moreIdeas = {
    'Birthday': [
      {'icon': '🗺️', 'title': 'Treasure Hunt Game', 'desc': 'Hide small clues in whole house and make a fun treasure hunt.', 'items': ['5-6 Clue Papers', 'Small Prizes', 'Final Surprise Location']},
      {'icon': '📸', 'title': 'Memory Video', 'desc': 'Make a video from old photos and messages of friends.', 'items': ['Old Photos', 'Friends Video Messages', 'Favourite Song']},
      {'icon': '💌', 'title': 'Handwritten Letter', 'desc': 'Write all your feelings in a long beautiful letter.', 'items': ['Beautiful Paper', 'Pen', 'Envelope']},
      {'icon': '🍳', 'title': 'Breakfast In Bed', 'desc': 'Make special breakfast and serve in bed.', 'items': ['Pancakes', 'Juice', 'Fruit', 'Tray']},
      {'icon': '📞', 'title': 'Surprise Video Call', 'desc': 'Arrange surprise video call from far friends and family.', 'items': ['Friends List', 'Video Call', 'Cake Cutting On Call']},
    ],
    'Wedding': [
      {'icon': '💃', 'title': 'Couple Dance Performance', 'desc': 'Prepare a small surprise dance for the couple.', 'items': ['Song Selection', 'Practice', 'Video Recording']},
      {'icon': '📖', 'title': 'Couple Story Book', 'desc': 'Write their love story in a small handmade book.', 'items': ['Love Story', 'Photos', 'Handmade Book']},
      {'icon': '🎤', 'title': 'Family Singing Night', 'desc': 'Arrange a small singing night for the new couple.', 'items': ['Music', 'Family Members', 'Snacks']},
      {'icon': '🌙', 'title': 'Honeymoon Plan Card', 'desc': 'Make a beautiful card with honeymoon plan and places.', 'items': ['Places List', 'Card', 'Photos']},
      {'icon': '🎁', 'title': 'Wishing Jar', 'desc': 'Everyone writes one wish and puts in a jar.', 'items': ['Glass Jar', 'Wish Papers', 'Ribbons']},
    ],
    'Anniversary': [
      {'icon': '🍽️', 'title': 'Candle Light Dinner At Home', 'desc': 'Cook dinner at home with candles and soft music.', 'items': ['Homemade Dinner', 'Candles', 'Music', 'Table Decoration']},
      {'icon': '🗺️', 'title': 'Visit First Meeting Place', 'desc': 'Go again to the place where you first met.', 'items': ['Travel', 'Photos', 'Dinner']},
      {'icon': '📖', 'title': 'Love Story Timeline', 'desc': 'Make a timeline of all years together.', 'items': ['Photos', 'Dates', 'Chart Paper']},
      {'icon': '🎬', 'title': 'Movie Night At Home', 'desc': 'Watch your favourite movie together at home.', 'items': ['Movie', 'Popcorn', 'Blanket']},
      {'icon': '💌', 'title': 'One Letter For Every Year', 'desc': 'Write one small letter for every year together.', 'items': ['Letters', 'Envelope', 'Photos']},
    ],
    'Graduation': [
      {'icon': '🎓', 'title': 'Cap Throwing Party', 'desc': 'Arrange a small cap throwing party with friends.', 'items': ['Caps', 'Cake', 'Photos']},
      {'icon': '📸', 'title': 'Success Photo Shoot', 'desc': 'A photo shoot in graduation dress with friends.', 'items': ['Gown', 'Friends', 'Photos']},
      {'icon': '🎉', 'title': 'Surprise Success Party', 'desc': 'Surprise party with close friends and family.', 'items': ['Snacks', 'Music', 'Balloons']},
      {'icon': '💼', 'title': 'Interview Practice Session', 'desc': 'Help them practice for first job interview.', 'items': ['Questions List', 'Mock Interview']},
      {'icon': '📖', 'title': 'Future Goals Diary', 'desc': 'A diary to write future goals and dreams.', 'items': ['Diary', 'Goals List']},
    ],
    'Friendship': [
      {'icon': '🎬', 'title': 'Movie + Pizza Night', 'desc': 'Watch movie together with pizza.', 'items': ['Movie', 'Pizza', 'Cold Drinks']},
      {'icon': '📸', 'title': 'Friendship Photo Challenge', 'desc': 'Take funny photos together whole day.', 'items': ['Camera', 'Funny Props']},
      {'icon': '🗺️', 'title': 'One Day Trip Together', 'desc': 'Go on a small one day trip together.', 'items': ['Travel', 'Snacks', 'Photos']},
      {'icon': '💌', 'title': 'Friendship Promise Card', 'desc': 'Write funny promises for each other.', 'items': ['Card', 'Photos']},
      {'icon': '🎮', 'title': 'Game Night Together', 'desc': 'Play board games and card games whole night.', 'items': ['Board Games', 'Snacks']},
    ],
    'Eid': [
      {'icon': '🌙', 'title': 'Chand Raat Mehndi Night', 'desc': 'Arrange mehndi night on Chand Raat.', 'items': ['Mehndi', 'Music', 'Sweets']},
      {'icon': '🍽️', 'title': 'Eid Family Lunch', 'desc': 'Invite whole family for Eid lunch.', 'items': ['Biryani', 'Sweets', 'Drinks']},
      {'icon': '📸', 'title': 'Eid Family Photo Shoot', 'desc': 'Take beautiful family photos in Eid dresses.', 'items': ['New Dress', 'Photos']},
      {'icon': '🧧', 'title': 'Eidi Treasure Hunt For Kids', 'desc': 'Hide Eidi in house and kids will find it.', 'items': ['Eidi Envelopes', 'Clues']},
      {'icon': '🤲', 'title': 'Help Needy On Eid', 'desc': 'Give food and clothes to needy people on Eid.', 'items': ['Food Packets', 'Clothes']},
    ],
    "Mother's Day": [
      {'icon': '🍳', 'title': 'Cook For Mother For One Day', 'desc': 'Cook mothers favourite food for whole day.', 'items': ['Favourite Dish', 'Tea', 'Dessert']},
      {'icon': '💆', 'title': 'Spa Day At Home', 'desc': 'Give mother a relaxing day at home.', 'items': ['Face Mask', 'Massage', 'Tea']},
      {'icon': '📖', 'title': 'Mothers Life Story Book', 'desc': 'Write mothers life story with photos.', 'items': ['Photos', 'Story', 'Book']},
      {'icon': '🌷', 'title': 'Garden Walk Together', 'desc': 'Take mother for a morning walk in garden.', 'items': ['Walk', 'Tea', 'Photos']},
      {'icon': '💌', 'title': 'Thank You Letter For Mother', 'desc': 'Thank mother for everything she did.', 'items': ['Letter', 'Photo']},
    ],
    "Father's Day": [
      {'icon': '🍳', 'title': 'Fathers Favourite Breakfast', 'desc': 'Make fathers favourite breakfast.', 'items': ['Paratha', 'Tea', 'Eggs']},
      {'icon': '🎣', 'title': 'One Day Out With Father', 'desc': 'Spend whole day with father outside.', 'items': ['Travel', 'Lunch', 'Photos']},
      {'icon': '📖', 'title': 'Fathers Advice Book', 'desc': 'Write all best advice father ever gave.', 'items': ['Advice List', 'Book']},
      {'icon': '🎬', 'title': 'Movie Night With Father', 'desc': 'Watch fathers favourite movie together.', 'items': ['Movie', 'Popcorn', 'Tea']},
      {'icon': '💌', 'title': 'Thank You Letter For Father', 'desc': 'Thank father for all his hard work.', 'items': ['Letter', 'Photo']},
    ],
    'Sister Day': [
      {'icon': '💅', 'title': 'Sister Pamper Day', 'desc': 'Give sister a full pamper day at home.', 'items': ['Nail Paint', 'Face Mask', 'Music']},
      {'icon': '🎬', 'title': 'Sister Movie Night', 'desc': 'Watch sisters favourite movie together.', 'items': ['Movie', 'Popcorn', 'Snacks']},
      {'icon': '🛍️', 'title': 'Shopping Day With Sister', 'desc': 'Go for shopping with sister.', 'items': ['Shopping', 'Lunch']},
      {'icon': '📸', 'title': 'Childhood Photos Collage', 'desc': 'Make collage of childhood photos.', 'items': ['Photos', 'Chart']},
      {'icon': '💌', 'title': 'Secret Sister Letter', 'desc': 'Write secrets and funny memories.', 'items': ['Letter', 'Photos']},
    ],
    'Brother Day': [
      {'icon': '🎮', 'title': 'Gaming Night With Brother', 'desc': 'Play games whole night with brother.', 'items': ['Games', 'Snacks', 'Drinks']},
      {'icon': '🏏', 'title': 'Cricket Match Together', 'desc': 'Play cricket with brother and friends.', 'items': ['Bat', 'Ball', 'Friends']},
      {'icon': '🍔', 'title': 'Brother Burger Treat', 'desc': 'Give brother a burger treat.', 'items': ['Burger', 'Fries', 'Drink']},
      {'icon': '📸', 'title': 'Childhood Fun Album', 'desc': 'Make album of childhood fun.', 'items': ['Photos', 'Album']},
      {'icon': '💪', 'title': 'Gym Day Together', 'desc': 'Go to gym together one day.', 'items': ['Gym', 'Juice']},
    ],
    'Teacher Day': [
      {'icon': '🎤', 'title': 'Thank You Speech For Teacher', 'desc': 'Give a small thank you speech in class.', 'items': ['Speech', 'Card']},
      {'icon': '🎭', 'title': 'Class Performance For Teacher', 'desc': 'Prepare a small performance for teacher.', 'items': ['Song', 'Drama', 'Dance']},
      {'icon': '📖', 'title': 'Memory Book From Whole Class', 'desc': 'Every student writes one line for teacher.', 'items': ['Book', 'Messages']},
      {'icon': '🍰', 'title': 'Surprise Cake In Class', 'desc': 'Surprise teacher with cake in class.', 'items': ['Cake', 'Candles']},
      {'icon': '💌', 'title': 'Thank You Letter From Class', 'desc': 'Whole class writes thank you letter.', 'items': ['Letter', 'Signatures']},
    ],
    "Valentine's Day": [
      {'icon': '🌹', 'title': 'Rose Petal Surprise', 'desc': 'Decorate room with rose petals.', 'items': ['Rose Petals', 'Candles', 'Music']},
      {'icon': '🍽️', 'title': 'Homemade Romantic Dinner', 'desc': 'Cook romantic dinner at home.', 'items': ['Dinner', 'Candles', 'Music']},
      {'icon': '💌', 'title': 'Love Letter', 'desc': 'Write your feelings in a love letter.', 'items': ['Letter', 'Rose']},
      {'icon': '🎬', 'title': 'Romantic Movie Night', 'desc': 'Watch romantic movie together.', 'items': ['Movie', 'Popcorn', 'Blanket']},
      {'icon': '📸', 'title': 'Couple Photo Shoot', 'desc': 'Take beautiful couple photos.', 'items': ['Photos', 'Dress']},
    ],
    'Baby Shower': [
      {'icon': '🎈', 'title': 'Baby Shower Decoration', 'desc': 'Decorate room for baby shower.', 'items': ['Balloons', 'Banner', 'Lights']},
      {'icon': '🎮', 'title': 'Baby Name Game', 'desc': 'Play game to guess baby name.', 'items': ['Name Cards', 'Game']},
      {'icon': '📸', 'title': 'Baby Shower Photo Booth', 'desc': 'Make a small photo booth for guests.', 'items': ['Props', 'Frame', 'Photos']},
      {'icon': '🎂', 'title': 'Baby Shower Cake Cutting', 'desc': 'Cut cake to celebrate baby coming.', 'items': ['Cake', 'Candles']},
      {'icon': '💌', 'title': 'Wishes For Baby', 'desc': 'Everyone writes one wish for baby.', 'items': ['Wish Papers', 'Jar']},
    ],
    'New Job': [
      {'icon': '🎉', 'title': 'New Job Celebration Party', 'desc': 'Celebrate new job with friends.', 'items': ['Snacks', 'Music', 'Cake']},
      {'icon': '🪴', 'title': 'Desk Plant For Office', 'desc': 'A small green plant for office desk.', 'items': ['Plant', 'Pot']},
      {'icon': '📖', 'title': 'First Day Diary', 'desc': 'A diary to write first day experience.', 'items': ['Diary', 'Pen']},
      {'icon': '🍽️', 'title': 'First Salary Treat Plan', 'desc': 'Plan a treat for first salary.', 'items': ['Plan', 'Card']},
      {'icon': '💌', 'title': 'Best Wishes Card', 'desc': 'Write best wishes for new job.', 'items': ['Card', 'Messages']},
    ],
    'House Warming': [
      {'icon': '🤲', 'title': 'Dua Party At New Home', 'desc': 'Invite family for Dua at new home.', 'items': ['Dua', 'Sweets', 'Tea']},
      {'icon': '🍽️', 'title': 'First Dinner At New Home', 'desc': 'Cook first dinner at new home with family.', 'items': ['Dinner', 'Family', 'Photos']},
      {'icon': '🪴', 'title': 'Plants For New Home', 'desc': 'Bring green plants for new home.', 'items': ['Plants', 'Pots']},
      {'icon': '🧹', 'title': 'Help In Shifting', 'desc': 'Help them in shifting and setting home.', 'items': ['Help', 'Cleaning']},
      {'icon': '📸', 'title': 'First Photo At New Home', 'desc': 'Take first family photo at new home.', 'items': ['Photos', 'Frame']},
    ],
    'Thank You': [
      {'icon': '💌', 'title': 'Handwritten Thank You Letter', 'desc': 'Say thank you with a handwritten letter.', 'items': ['Letter', 'Envelope']},
      {'icon': '🍽️', 'title': 'Thank You Lunch', 'desc': 'Invite them for lunch to say thank you.', 'items': ['Lunch', 'Drinks']},
      {'icon': '📸', 'title': 'Thank You Photo Frame', 'desc': 'Frame a photo together as thank you.', 'items': ['Photo', 'Frame']},
      {'icon': '☕', 'title': 'Tea Treat To Say Thanks', 'desc': 'Take them for tea to say thank you.', 'items': ['Tea', 'Snacks']},
      {'icon': '🎁', 'title': 'Thank You Surprise Box', 'desc': 'A small box with thank you notes.', 'items': ['Notes', 'Sweets']},
    ],
    'Get Well Soon': [
      {'icon': '🍲', 'title': 'Homemade Soup For Patient', 'desc': 'Make healthy homemade soup.', 'items': ['Soup', 'Fruits']},
      {'icon': '📞', 'title': 'Daily Call To Cheer Up', 'desc': 'Call daily to cheer them up.', 'items': ['Call', 'Jokes']},
      {'icon': '🎬', 'title': 'Funny Movie Together', 'desc': 'Watch funny movie together at home.', 'items': ['Movie', 'Soup']},
      {'icon': '📚', 'title': 'Story Book For Rest Time', 'desc': 'Give a story book for rest time.', 'items': ['Book', 'Bookmark']},
      {'icon': '💌', 'title': 'Get Well Soon Card', 'desc': 'A card with get well soon wishes.', 'items': ['Card', 'Messages']},
    ],
  };

  void showMoreIdeas() {
    final ideas = moreIdeas[widget.occasion] ?? [];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.65, minChildSize: 0.4, maxChildSize: 0.92, expand: false,
        builder: (_, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          children: [
            Text('More Ideas for ${widget.occasion}', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color(0xFF0E5A3A))),
            const Text('Tap on any idea to see full detail', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 15),
            ...ideas.map((idea) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Text(idea['icon'], style: const TextStyle(fontSize: 32)),
                title: Text(idea['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(idea['desc']),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () => showIdeaDetail(idea),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void showIdeaDetail(Map<String, dynamic> idea) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(idea['icon'], style: const TextStyle(fontSize: 60))),
              const SizedBox(height: 10),
              Center(child: Text(idea['title'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0E5A3A)))),
              const SizedBox(height: 12),
              Text(idea['desc'], style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 16),
              ...(idea['items'] as List).map((e) => Padding(padding: const EdgeInsets.only(bottom: 7), child: Row(children: [const Text('✅ '), Expanded(child: Text(e, style: const TextStyle(fontSize: 15)))]))),
              const SizedBox(height: 18),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0E5A3A), padding: const EdgeInsets.all(14)), child: const Text('Close', style: TextStyle(color: Colors.white)))),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gifts = allGifts.where((g) => g.occasion == widget.occasion).toList();
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7EE),
      appBar: AppBar(
        title: Text('For: ${widget.occasion}'),
        backgroundColor: const Color(0xFF0E5A3A),
        foregroundColor: Colors.white,
        actions: [IconButton(icon: const Icon(Icons.favorite), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesScreen())))],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(padding: const EdgeInsets.all(15), itemCount: gifts.length, itemBuilder: (context, i) => GiftCard(gift: gifts[i]))),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: showMoreIdeas, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0E5A3A), padding: const EdgeInsets.all(15)), child: const Text('More Ideas', style: TextStyle(color: Colors.white, fontSize: 16)))),
          ),
        ],
      ),
    );
  }
}