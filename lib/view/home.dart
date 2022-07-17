import 'package:flutter/material.dart';
import 'package:untitled1/view/results.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset("assets/images/github.png", height: 120.0)),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(120.0))),
          ),
          Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(height: 30.0),
                  TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0)),
                        hintText: "username",
                        labelText: "username",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  Container(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultsScreen(
                                    username: _username.value.text,
                                  )));
                    },
                    child: Text("Buscar"),
                    style: TextButton.styleFrom(
                        minimumSize: Size(double.maxFinite, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        primary: Colors.white,
                        backgroundColor: Colors.black),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
