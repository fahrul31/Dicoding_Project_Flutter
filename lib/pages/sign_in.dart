import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var txtEditEmail = TextEditingController();
  var txtEditPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                pict(),
                emailInput(),
                passInput(),
                textForgetPass(),
                submitButton(context)
              ],
            )),
      )),
    );
  }

  Padding textForgetPass() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Lupa password ?",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }

  Container submitButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/home-page');
          }
        },
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xff367668),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        child: Text(
          "Login",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Padding passInput() {
    return Padding(
      padding : const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        ),
        TextFormField(
          obscureText: true,
          controller: txtEditPass,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password tidak boleh kosong";
            }
            return null;
          },
          decoration: const InputDecoration(
              hintText: "Masukkan password",
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              prefixIcon: Icon(Icons.lock_outline_rounded),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16)),
        ),
        ]
      ),
    );
  }

  Stack emailInput() {
    return Stack(children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      ),
      TextFormField(
        
        controller: txtEditEmail,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email tidak boleh kosong";
          }
          return null;
        },
        decoration: const InputDecoration(
            hintText: "Masukkan email",
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
            prefixIcon: Icon(Icons.email_rounded),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 16)),
      ),
    ]);
  }

  Container pict() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 450,
        child: Image.asset("assets/images/ilustrasi.png"));
  }
}
