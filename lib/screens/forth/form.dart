import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formlesson extends StatefulWidget {
  const Formlesson({super.key});
  @override
  State<Formlesson> createState() => _FormlessonState();
}

class _FormlessonState extends State<Formlesson> {
  String request = "";
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _glopalkey = GlobalKey<FormState>();
  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    emailcontroller.addListener(_update);
    passwordcontroller.addListener(_update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _glopalkey,
            child: Column(
              children: [
                SizedBox(height: 100),
                //email
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fil the email";
                    }
                    if (!value.endsWith("@gamil.com")) {
                      return "write email in right format";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white54,
                    ),
                    hintText: "email address",
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                  ],
                  maxLength: 9,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fil tje password";
                    }
                    if (value.length < 9) {
                      return "write strong password";
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open, color: Colors.white54),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white54,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        emailcontroller.text == "" &&
                            passwordcontroller.text == ""
                        ? Colors.grey
                        : Colors.blue,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  onPressed: () {
                    if (_glopalkey.currentState!.validate()) {
                      setState(() {
                        request = "request";
                      });
                    }
                    return;
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 40),
                Text(
                  "repuest: $request",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Email:${emailcontroller.text}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Password:${passwordcontroller.text}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
