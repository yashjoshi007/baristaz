import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CocktailDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String cocktailName;
  final String category;
  final String price;
  final String instructions;
  final List<String> ingredientsList;
  final List<String> measurementsList;

  CocktailDetailsPage({
    required this.imageUrl,
    required this.cocktailName,
    required this.category,
    required this.price,
    required this.instructions,
    required this.ingredientsList,
    required this.measurementsList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cocktailName', style: GoogleFonts.poppins(),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display Cocktail Image with a frame
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Centered Cocktail Name
            Center(
              child: Text(
                '${cocktailName}(${category})',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            // Display Price
            Center(
              child: Text(
                'Price: \$$price.00',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.green),
              ),
            ),
            SizedBox(height: 16),
            // Display Ingredients
            Text(
              'Ingredients needed:',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display the list of 5 ingredients with measurements
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                ingredientsList.length,
                    (index) => Text(
                  '- ${ingredientsList[index]} (${measurementsList[index]})',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ).take(5).toList(),
            ),
            SizedBox(height: 16),
            // Display Instructions
            Text(
              'Instructions:',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display the instructions as a single Text widget
            Text(
              instructions,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
