import 'package:flutter/material.dart';
import 'package:test_app/screens/forth/form.dart';
import 'package:test_app/screens/one/multi_image.dart';
import 'package:test_app/screens/one/multi_selection.dart';
import 'package:test_app/screens/one/single_selection.dart';
import 'package:test_app/screens/one/togile_selection.dart';
import 'package:test_app/screens/third/search_feature.dart';
import 'package:test_app/screens/two/upload_file.dart';
import 'package:test_app/screens/two/upload_image.dart';
import 'package:test_app/screens/two/upload_multi_images.dart';
import 'package:test_app/screens/two/upload_video.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    Multi(),
    ToglleSelction(),
    Mulitselection(),
    UploadImage(),
    UploadMultiImages(),
    UploadVideo(),
    // UploadFile(),
    SearchFeature(),
    Formlesson(),
  ];
  int screen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            screen = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.jumpToPage(screen - 1);
              },
              child: Container(child: Icon(Icons.arrow_left, size: 100)),
            ),
            SizedBox(width: 50),
            GestureDetector(
              onTap: () {
                controller.jumpToPage(screen + 1);
              },
              child: Container(child: Icon(Icons.arrow_right, size: 100)),
            ),
          ],
        ),
      ),
    );
  }
}
