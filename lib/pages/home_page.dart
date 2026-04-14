import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      image: 'images/gula.png',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      image: 'images/garam.png',
      stock: 5,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belanja"),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final item = items[index];

          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item',
                arguments: item,
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar + Hero
                    Expanded(
                      child: Center(
                        child: Hero(
                          tag: item.name,
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    // Nama
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Harga
                    Text("Rp ${item.price}"),

                    // Rating
                    Text("⭐ ${item.rating}"),

                    // Stok
                    Text("Stok: ${item.stock}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // Footer
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "Andrian Sheva A.F - 244107060062",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}