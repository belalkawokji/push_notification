import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Empty_page extends StatelessWidget {
  const Empty_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Push notification"),
          ),
        ),
    );
  }
}
