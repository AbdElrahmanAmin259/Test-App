import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  @override
  void initState() {
    filterlist = products;
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  List<Map> filterlist = [];

  List<Map> products = [
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Women pag",
      "price": 200,
    },

    {
      "image":
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Women White  whatch",
      "price": 70,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Men HeadPhone",
      "price": 100,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?q=80&w=1122&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Men Black Pike",
      "price": 400,
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1681711648620-9fa368907a86?q=80&w=708&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Men Coffe",
      "price": 30,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1615900119312-2acd3a71f3aa?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Women Hairroots",
      "price": 250,
    },
  ];
  void _searchfunction(String keyword) {
    setState(() {
      filterlist = products.where((prodoct) {
        final title = prodoct["title"].toString().toLowerCase();
        final input = keyword.toLowerCase();
        return title.startsWith(input);
      }).toList();
    });
  }

  void filterprice() {
    setState(() {
      filterlist = List<Map>.from(products);
      filterlist.sort((a, b) => b['price'].compareTo(a['price']));
    });
  }

  void filteranotherprice() {
    setState(() {
      filterlist = List<Map>.from(products);
      filterlist.sort((a, b) => a["title"].compareTo(b["title"]));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.pink.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120),
                //search textfield
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    onChanged: _searchfunction,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      suffixIcon:
                          _controller.text != "" && _controller.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controller.text = "";
                                  _searchfunction("");
                                });
                              },
                              child: Icon(CupertinoIcons.clear),
                            )
                          : SizedBox.shrink(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 3),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                //filter by word
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _searchfunction("Men");
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text("Men")),
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        _searchfunction("Women");
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text("Women")),
                      ),
                    ),
                  ],
                ),

                //search list
                SizedBox(height: 25),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        filterprice();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt, color: Colors.white),
                          Text(
                            "Highest To Lowest",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 17),
                    GestureDetector(
                      onTap: () {
                        filteranotherprice();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt, color: Colors.white),
                          Text(
                            "A=>Z",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          filterlist = List<Map>.from(products);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.clear_all_outlined, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Clear Filter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14),
                Column(
                  children: List.generate(filterlist.length, (index) {
                    final product = filterlist[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      leading: Container(
                        width: 90,
                        // height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Image.network(
                            product["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        product["title"],
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      trailing: Text(
                        "${product["price"]}\$",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
