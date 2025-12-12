import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _filename;
  String? _filepath;
  void _openfile(String? path) {
    OpenFile.open(path);
  }

  Future<void> _pickerfile() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf", "docx", "doc"],
    );
    if (file != null) {
      setState(() {
        _filename = file.files.single.name;
        _filepath = file.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListTile(
            leading: Image.asset(width: 100, "assets/svgs/he.svg"),
            title: Text("$_filename"),
          ),
          // Spacer(),
          Column(),
        ],
      ),
    );
  }
}
