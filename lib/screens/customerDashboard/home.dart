import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/services.png',
            height: 190,
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          // Image.asset(
          //   'assets/images/bookNow.png',
          //   height: 190,
          //   width: double.infinity,
          // ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Our Prices',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Small Backet : M50',
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Medium Backet : M70',
                style: TextStyle(fontSize: 19),
              ),
              // Text('Large Backet : M100'),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Large Backet : M100',
                style: TextStyle(fontSize: 19),
              ),
              Text(
                'Sneakers : M20',
                style: TextStyle(fontSize: 19),
              ),
              // Text('Large Backet : M100'),
            ],
          )
        ],
      ),
    );
  }
}
