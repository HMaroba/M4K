import 'package:flutter/material.dart';
import 'package:m4k/screens/customerDashboard/settings/rewards_list.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  List<String> catName = [
    "10% Discount on Next Booking",
    "Free Pickup Service",
    "VIP Washing Package",
    "Ironing Voucher",
    "Folding Bonus Points",
    "Free Delivery on Orders"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 60,
            // ),
            Container(
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rewards',
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
                'Unlock Amazing Rewards Shortly',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: rewards.length,
                itemBuilder: (BuildContext context, int index) {
                  final promotion = rewards[index];
                  return Card(
                    margin: const EdgeInsets.all(16),
                    child: ListTile(
                      // title: Text(promotion['title']!),
                      // subtitle: Text(promotion['description']!),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              promotion['title']!,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(promotion['description']!)
                          ]),
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
