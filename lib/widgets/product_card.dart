import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final String category;
  final String price;
  final VoidCallback onViewPressed;

  FoodCard({
    required this.imageUrl,
    required this.foodName,
    required this.category,
    required this.price,
    required this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.grey[200], // Set the background color here
      child: Container(
        height: 150,
        width: 60,
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  Text(
                    foodName,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    category,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    '\$$price.00',
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: onViewPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.red)
                        // Adjust the border radius as needed
                      ),
                    ),
                    child: Container(
                      width: 25, // Adjust the width as needed
                      child: Center(
                        child: Text('View', style: GoogleFonts.poppins(fontSize: 10, color: Colors.red)),
                      ),
                    ),
                  ),

                ],)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
