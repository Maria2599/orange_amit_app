import 'package:flutter/material.dart';
import 'package:graduation_project/layout/home.dart';
import 'package:graduation_project/login.dart';

var formkey = GlobalKey<FormState>();
var email = TextEditingController();
var pass = TextEditingController();
var name = TextEditingController();

var isHidden = true;

class Regist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistState();
}

class RegistState extends State<Regist> {
  ChangeVisiblity() => setState(() => isHidden = !isHidden);

  // const Regist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logoamit.png',
                      height: 260,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is Empty!';
                        }
                      },
                      controller: name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          size: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is Empty!';
                        }
                        if (!RegExp("^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Enter a valid Email.. it must not include space or - or _ or / ';
                        }
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is Empty!";
                        } else if (value.length != 8) {
                          return "Password must be 8 characters!";
                        }
                        if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                          return 'Enter a valid Password.. it must be characters only ';
                        }
                      },
                      controller: pass,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: isHidden
                              ? Icon(Icons.visibility_off, size: 21,)
                              : Icon(Icons.visibility, size: 21,),
                          onPressed: ChangeVisiblity,
                        ),
                        prefixIcon: Icon(
                          Icons.password,
                          size: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          print(email.text);
                          print(pass.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      child: Text(
                        "     SIGN UP     ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(200, 172, 23, 11)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Go Login",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          )),
                    ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
