import 'package:flutter/material.dart';

class Multi extends StatefulWidget {
  const Multi({super.key});

  @override
  State<Multi> createState() => _MultiState();
}

class _MultiState extends State<Multi> {
  List<String> type = [
    "News",
    "Health",
    "Cooking",
    "Entertainment",
    "Sport",
    "Football",
    "Tech",
    "Flutter",
    "Ai",
    "Trending",
    "Fasion &design",
    "LifeStyle",
  ];
  List<String> empty = [];
  int selectionindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 140),
            Text(
              "Whate do you Want to see on X ? ",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: List.generate(type.length, (index) {
                final types = type[index];
                final isselected = empty.contains(types);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!isselected) {
                        empty.add(types);
                      } else {
                        empty.remove(types);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeIn,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                        color: isselected ? Colors.blue : Colors.grey.shade700,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: Text(
                          types,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30),
            Column(
              children: empty.map((v) {
                return Text(v, style: TextStyle(color: Colors.white));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
