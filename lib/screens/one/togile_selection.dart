import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToglleSelction extends StatefulWidget {
  const ToglleSelction({super.key});

  @override
  State<ToglleSelction> createState() => _ToglleSelctionState();
}

class _ToglleSelctionState extends State<ToglleSelction> {
  bool isfollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/labtop/norato.jpg"),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -20,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isfollow = !isfollow;
                    }),
                    child: CircleAvatar(
                      child: Icon(
                        isfollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isfollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    size: 25,
                  ),
                  Text(
                    "Abdelrahman Amin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
