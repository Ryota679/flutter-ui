import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String price;
  final String description;

  const DetailScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: EdgeInsets.all(24),
              child: ListView(
                controller: scrollController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      Text(price, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(location, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      Icon(Icons.star_border, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text('(5.0)', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('People', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('No. of people in your group', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text('${index + 1}'),
                          selected: index == 0,
                          onSelected: (_) {},
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text(description, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          side: BorderSide(color: Colors.black12),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                        child: Icon(Icons.favorite_border),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Book Trip Now', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
