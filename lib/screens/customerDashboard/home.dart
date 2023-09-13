import 'package:flutter/material.dart';
import 'package:m4k/screens/customerDashboard/price_list.dart';
import 'package:m4k/screens/customerDashboard/services.dart';

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
              ListView.builder(
                shrinkWrap: true,
                // Ensure the ListView doesn't take more space than needed
                itemCount: servicesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = servicesList[index];
                  return Card(
                    elevation: 2, // Add elevation for a card-like appearance
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      // leading:
                      // title: Text(
                      //   item['name'],
                      //   style: const TextStyle(fontSize: 19),
                      // ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              item['imagePath'],
                              // width: 50,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            item['name'],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      // trailing: const Icon(
                      //   Icons.add,
                      //   color: Colors.pink,
                      // ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Our Prices',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              ListView.builder(
                shrinkWrap:
                    true, // Ensure the ListView doesn't take more space than needed
                itemCount: priceList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = priceList[index];
                  return Card(
                    elevation: 2, // Add elevation for a card-like appearance
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Image.asset(
                        item['imagePath'],
                        width: 50, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                      ),
                      title: Text(
                        item['name'],
                        style: const TextStyle(fontSize: 19),
                      ),
                      subtitle: Text(
                        'Price: ${item['price']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
