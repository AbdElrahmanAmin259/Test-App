import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? selectionimage;
  Future<void> _uploadimage() async {
    final pickimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      selectionimage = pickimage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                color: Colors.grey.withAlpha(30),
                width: double.infinity,
                height: 300,
                child: selectionimage == null
                    ? null
                    : Image.file(File(selectionimage!.path), fit: BoxFit.cover),
              ),
              SizedBox(height: 70),
              SizedBox(
                width: 230,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900.withAlpha(150),
                  ),
                  onPressed: () {
                    _uploadimage();
                  },
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
