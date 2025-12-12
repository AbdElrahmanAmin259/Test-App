import 'package:flutter/material.dart';

class Mulitselection extends StatefulWidget {
  const Mulitselection({super.key});

  @override
  State<Mulitselection> createState() => _MulitselectionState();
}

class _MulitselectionState extends State<Mulitselection> {
  int? selectedindex;
  List<Map> gifts = [
    {"image": "assets/animal/e.jpg", "name": "Instgram"},
    {"image": "assets/animal/h.jpg", "name": "YouTup"},
    {"image": "assets/animal/he.jpg", "name": "Pintester"},
    {"image": "assets/animal/hi.jpg", "name": "Telegram"},
    {"image": "assets/animal/q.jpg", "name": "Photo"},
    {"image": "assets/animal/t.jpg", "name": "X"},
    {"image": "assets/animal/u.jpg", "name": "Phone"},
    {"image": "assets/animal/y.jpg", "name": "Pintester"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: gifts.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedindex = index;
              });
            },
            child: Stack(
              children: [
                selectedindex == index
                    ? Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(137, 155, 151, 151),
                              Colors.black12,
                              Colors.black87,
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink(),

                Column(
                  children: [
                    Image.asset(
                      // height: selectedindex == index ? 110 : 100,
                      "${gifts[index]["image"]}",
                    ),
                    selectedindex == index
                        ? SizedBox.shrink()
                        : Text(
                            "${gifts[index]["name"]}",
                            style: TextStyle(color: Colors.grey),
                          ),
                  ],
                ),
                selectedindex == index
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 40,
            crossAxisSpacing: 20,
            childAspectRatio: 0.6,
          ),
        ),
      ),
    );
  }
}
