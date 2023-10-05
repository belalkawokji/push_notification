import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String massege ="" ;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies() ;
    final arguments = ModalRoute.of(context)!.settings.arguments ;
    if(arguments!=null){
      Map? pushArguments=arguments as Map;
    setState(() {
      massege=pushArguments["message"];
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("push massege $massege"),
          ),
        )

    );
  }
}
