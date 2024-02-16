import 'package:flutter/material.dart';

class WithoutWeather extends StatelessWidget {
  const WithoutWeather({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Text('There Is No Weather',
            style: TextStyle(
              fontSize: 32,
            ),
            ),
            Text('Search Now 🔍',
            style: TextStyle(
              fontSize: 28,
            ),
            ),
            
          ],
      
        ),
      ),
    );
  }
}
