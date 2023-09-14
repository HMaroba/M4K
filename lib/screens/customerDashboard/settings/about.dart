import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'About Laundry Business M4K',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Welcome to Laundry Business M4K, where convenience meets cleanliness! We understand that life can get incredibly busy, leaving you with little time to tackle that ever-growing pile of laundry. Thats where we come in  to make your life easier, one load at a time At Laundry Business M4K, were not just about washing clothes  were about providing you with the gift of time. Our mission is simple: to take the hassle out of laundry so you can focus on what truly matters in your life.'),
              SizedBox(
                height: 24,
              ),
              Text(
                'Why Choose Us?',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '1. Pickup & Delivery:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                  'Say goodbye to the laundromat. We offer seamless pickup and delivery services at your doorstep, saving you valuable time and effort.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. Expert Care:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                  'Your garments are in safe hands with us. Our skilled professionals are well-equipped to handle everything from delicate fabrics to tough stains.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '3. Affordable Pricing:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                  'We believe in providing top-notch services without breaking the bank. Our transparent pricing ensures you know exactly what you\'re paying for.'),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. Convenience Guaranteed:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                  'With our user-friendly app, you can schedule laundry pickups and deliveries at your convenience, ensuring your laundry fits into your busy schedule, not the other way around.'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Join the Laundry Business M4K family today and experience laundry day like never before. Let us handle the dirty work while you enjoy more quality time with your loved ones, pursue your passions, or simply relax.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We're here to make your laundry woes a thing of the past. Download our app now and discover the joy of hassle-free laundry!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
