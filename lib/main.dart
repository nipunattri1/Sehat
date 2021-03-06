import 'package:flutter/material.dart';
import 'package:healthcare/Sreens/covid.dart';
import 'package:healthcare/Sreens/home.dart';

void main() => runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Main(),
    ));

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(child: _buildBody(height)),
    );
  }

  Widget _buildBody(double height) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    covidinfo(),
    Text("3"),
  ];
  static List<Color> _coloroptions = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.masks_rounded),
            title: Text('Covid info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Account'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        onTap: onTabTapped,
        elevation: 0.0,
        backgroundColor: _coloroptions[_currentIndex],
        currentIndex: _currentIndex,
      ),
    );
  }
}
