import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            height: 150,
            color: Colors.red,
            child: const SafeArea(child: Text("Puch Now")),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[100],
            child: const Text(
              "Puched History",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.blue,
            child: Column(
              children: [
                for (int index = 0; index < 10; index++)
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Punched Item $index"),
                  ))
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[100],
            child: const Text(
              "Tools History",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.pink,
            child: Column(
              children: [
                for (int index = 0; index < 10; index++)
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tools Purchase Item $index"),
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
