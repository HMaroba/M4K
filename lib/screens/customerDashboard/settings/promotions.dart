import 'package:flutter/material.dart';

import 'promotion_list.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promotions',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.pink),
                    ),
                    Icon(
                      Icons.wallet_giftcard,
                      size: 35,
                      color: Colors.pink,
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 30,
              ),
              child: Text(
                'Coming Soon. Stay tuned for exciting promotions! next month',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: promotions.length,
                itemBuilder: (BuildContext context, int index) {
                  final promotion = promotions[index];
                  return Card(
                    margin: const EdgeInsets.all(16),
                    child: ListTile(
                      title: Text(promotion['title']!),
                      subtitle: Text(promotion['description']!),
                      onTap: () {
                        // Handle tapping on a promotion if needed
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
