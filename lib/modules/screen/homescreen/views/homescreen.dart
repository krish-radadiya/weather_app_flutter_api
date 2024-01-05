import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          "weather",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: Colors.white10,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  left: 40,
                ),
                child: Row(
                  children: [
                    Text(
                      "Forecast",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.white10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
