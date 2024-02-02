import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/product.dart';
import '../../widgets/product_card.dart';
import '../viewmodels/home_viewmodel.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let\'s eat',
                    style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Quality food',
                    style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  onChanged: (searchTerm) {
                    viewModel.fetchDrinks(searchTerm: searchTerm);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near Restaurant',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Hardcoded Card
              Card(
                elevation: 5,
                child: Container(
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage('https://images.squarespace-cdn.com/content/v1/57ad8de5ff7c50d12ce76b68/1557410521467-U93CM432S7SJER8T2GSL/Restaurant+Colour+Scheme+Affects+Restaurant+Ambience'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Blue Restaurant',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('10:00AM - 03:30PM', style: GoogleFonts.poppins(),),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Text('Steve ST Road', style: GoogleFonts.poppins(color: Colors.red),),


                              SizedBox(width: 45),
                              Row(
                                children: [
                                  Text('4.5',style: GoogleFonts.poppins(
                                  ),),
                                  Icon(Icons.star, color: Colors.yellow),// Replace with actual rating
                                ],
                              ),
                                ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(height: 10,),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items in each row
                    crossAxisSpacing: 8.0, // Horizontal spacing between items
                    mainAxisSpacing: 8.0, // Vertical spacing between items
                  ),
                  itemCount: viewModel.drinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    DrinkModel drink = viewModel.drinks[index];
                    return FoodCard(
                      imageUrl: drink.strDrinkThumb,
                      foodName: drink.strDrink,
                      category: drink.strCategory,
                      price:  drink.idDrink,
                      onViewPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CocktailDetailsPage(
                              imageUrl: drink.strDrinkThumb,
                              cocktailName: drink.strDrink,
                              category: drink.strCategory,
                              price: drink.idDrink,
                              instructions: drink.strInstructions,
                              ingredientsList: ['${drink.strIngredient1}', '${drink.strIngredient2}', '${drink.strIngredient3}','${drink.strIngredient4}','${drink.strIngredient5}'],
                              measurementsList: ['${drink.strMeasure1}', '${drink.strMeasure2}', '${drink.strMeasure3}', '${drink.strMeasure4}', '${drink.strMeasure5}'],

                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
