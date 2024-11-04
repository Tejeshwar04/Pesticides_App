import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'crop_detail_screen.dart'; // Ensure this path is correct
import 'models/crop_model.dart'; // Ensure this path is correct

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Crop> crops = [
    Crop(name: 'Paddy', pesticides: ['Pesticide A', 'Pesticide B'], image: 'assets/images/paddy.jpeg'),
    Crop(name: 'Wheat', pesticides: ['Pesticide C', 'Pesticide D'], image: 'assets/images/wheat.jpeg'),
    Crop(name: 'Maize', pesticides: ['Pesticide E', 'Pesticide F'], image: 'assets/images/maize.jpeg'),
    Crop(name: 'Cotton', pesticides: ['Pesticide G', 'Pesticide H'], image: 'assets/images/cotton.jpeg'),
    Crop(name: 'Sugarcane', pesticides: ['Pesticide I', 'Pesticide J'], image: 'assets/images/sugarcane.jpeg'),
    Crop(name: 'Banana', pesticides: ['Pesticide K', 'Pesticide L'], image: 'assets/images/bananna.jpeg'), // Ensure path and spelling are correct
  ];

  List<int> visibleItems = []; // List to track visible items

  @override
  void initState() {
    super.initState();
    _animateItems();
  }

  void _animateItems() {
    for (int i = 0; i < crops.length; i++) {
      Future.delayed(Duration(milliseconds: i * 500), () {
        setState(() {
          visibleItems.add(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Dashboard'),
        backgroundColor: Color(0xFF1A5319),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background01.jpeg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Content overlay (GridView)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: crops.length,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  opacity: visibleItems.contains(index) ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CropDetailScreen(crop: crops[index]),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      color: Colors.white.withOpacity(0.7), // Slight transparency to blend with background
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // Changed to white color
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                crops[index].image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.red,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            crops[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
