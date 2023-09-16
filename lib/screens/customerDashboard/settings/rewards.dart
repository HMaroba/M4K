import 'package:flutter/material.dart';

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
              ),
              child: Text(
                'Coming Soon stay tuned',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),

            // CarouselSlider.builder(
            //   options: CarouselOptions(
            //     height: 100.0,
            //     enableInfiniteScroll: true,
            //     viewportFraction: 0.9,
            //     autoPlay: true,
            //     enlargeCenterPage: true,
            //     autoPlayInterval: const Duration(seconds: 4),
            //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     pauseAutoPlayOnTouch: true,
            //     aspectRatio: 2.0,
            //     onPageChanged: (index, reason) {
            //       // Handle indicator change if needed
            //     },
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   itemCount: catName.length,
            //   itemBuilder: (BuildContext context, int index, int realIndex) {
            //     final item = catName[index];
            //     return Card(
            //       elevation: 2,
            //       margin:
            //           const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding:
            //                 const EdgeInsets.only(left: 8, top: 16, bottom: 5),
            //             child: Text(
            //               item,
            //               style: const TextStyle(
            //                   fontSize: 20, fontWeight: FontWeight.w400),
            //             ),
            //           )
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
