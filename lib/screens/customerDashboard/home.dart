import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFFD0E42),
                      Color(0xFFC30F31),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 46.0, left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hi',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        ' Hlalele Maroba',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/services.png',
                height: 190,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Our Services',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              Card(
                elevation: 2, // Add elevation for a card-like appearance
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/professional.jpg',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8, bottom: 5),
                      child: Text(
                        'Wash , Dry , Iron and Fold',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                elevation: 2, // Add elevation for a card-like appearance
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/book.png',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8, bottom: 5),
                      child: Text(
                        'Pick up and Delivery',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Our Prices',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: Card(
                      elevation: 2, // Add elevation for a card-like appearance
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/bucket.jpeg',
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, top: 8, bottom: 5),
                            child: Text(
                              'Small Bucket : M50',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Card(
                      elevation: 2, // Add elevation for a card-like appearance
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/book.png',
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, top: 8, bottom: 5),
                            child: Text(
                              'Medium Bucket : M70',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: Card(
                      elevation: 2, // Add elevation for a card-like appearance
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/bucket.jpeg',
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, top: 8, bottom: 5),
                            child: Text(
                              'Large Bucket :  M100.00',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      elevation: 2, // Add elevation for a card-like appearance
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/book.png',
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, top: 8, bottom: 5),
                            child: Text(
                              'Sneakers : LSL 20',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ListView.builder(
              //   shrinkWrap:
              //       true, // Ensure the ListView doesn't take more space than needed
              //   itemCount: priceList.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     final item = priceList[index];
              //     return Card(
              //       elevation: 2, // Add elevation for a card-like appearance
              //       margin:
              //           const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //       child: ListTile(
              //         leading: Image.asset(
              //           item['imagePath'],
              //           width: 50, // Adjust the width as needed
              //           height: 50, // Adjust the height as needed
              //         ),
              //         title: Text(
              //           item['name'],
              //           style: const TextStyle(fontSize: 19),
              //         ),
              //         subtitle: Text(
              //           'Price: ${item['price']}',
              //           style: const TextStyle(fontSize: 16),
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
