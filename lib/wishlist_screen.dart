import 'package:flutter/material.dart';
import 'screens/relation_gifts_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  final TextEditingController ageController =
      TextEditingController();

  String? selectedGender;
  String? selectedRelationship;

  bool addedToCart = false;

  final List<String> relationships = [
    'Friend',
    'Best Friend',
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Husband',
    'Wife',
    'Boyfriend',
    'Girlfriend',
    'Colleague',
    'Other',
  ];

  void addToCart() {
    if (selectedGender == null ||
        selectedRelationship == null ||
        ageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields!'),
        ),
      );
      return;
    }

    final age = int.tryParse(ageController.text.trim());

    if (age == null || age < 1 || age > 120) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid age!'),
        ),
      );
      return;
    }

    setState(() {
      addedToCart = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Cart Successfully!'),
      ),
    );
  }

  void submitForm() {
    if (!addedToCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Add to Cart first!'),
        ),
      );
      return;
    }

    // NEXT SCREEN: sirf selected relationship ke gifts
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RelationGiftsScreen(
          relationship: selectedRelationship!,
          gender: selectedGender!,
          age: int.parse(ageController.text.trim()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),

      appBar: AppBar(
        title: const Text(
          'My Wishlist',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFAD4777),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           Center(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.asset(
      'assets/images/logo.jpg',
      width: 160,
      height: 160,
      fit: BoxFit.cover,
    ),
  ),
),

            const SizedBox(height: 12),

            const Center(
              child: Text(
                'Find Your Perfect Gift',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAD4777),
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                'Tell us about your special person',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Gender',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
                hintText: 'Select Gender',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              items: ['Male', 'Female', 'Other']
                  .map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                  addedToCart = false;
                });
              },
            ),

            const SizedBox(height: 22),

            const Text(
              'Age',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              onChanged: (_) {
                setState(() {
                  addedToCart = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Age',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Relationship',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedRelationship,
              decoration: InputDecoration(
                hintText: 'Select Relationship',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              items: relationships.map((relation) {
                return DropdownMenuItem(
                  value: relation,
                  child: Text(relation),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRelationship = value;
                  addedToCart = false;
                });
              },
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: addedToCart ? null : addToCart,
                icon: const Icon(Icons.shopping_cart),
                label: Text(
                  addedToCart
                      ? 'Added to Cart ✓'
                      : 'Add to Cart',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCB79A0),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAD4777),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}