import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<String> images = [
    "assets/labtop/bb.jpg",
    "assets/labtop/download (1).jpg",
    "assets/labtop/uu.jpg",
    "assets/labtop/xx.jpg",
    "assets/labtop/xx.jpg",
  ];
  int selectedimage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 400,
              child: Image.asset(images[selectedimage], fit: BoxFit.cover),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(images.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedimage = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: selectedimage == index
                                ? Colors.blue
                                : const Color.fromARGB(255, 205, 205, 205),
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        width: 100,
                        height: 100,
                        child: Image.asset(images[index], fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
