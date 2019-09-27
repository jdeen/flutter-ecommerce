import 'package:flutter/material.dart';
import 'package:aviastore/scoped-models/main.dart';
import 'package:aviastore/screens/home.dart';
import 'package:aviastore/utils/locator.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final MainModel _model = MainModel();
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();

  @override
  void initState() {
    _model.loggedInUser();
    _model.fetchCurrentOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/home',
        routes: {
          '/home' : (context) => HomeScreen()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
