import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Icon(Icons.home, size: 150),
    Icon(Icons.stacked_line_chart_outlined, size: 150),
    Icon(Icons.add, size: 150),
    Icon(Icons.notifications, size: 150),
    Icon(Icons.settings, size: 150)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex)
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon( Icons.home, color: Colors.black,), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart_outlined, color: Colors.black,), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.amber,), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black,), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

    );
  }
  void _onItemTapped(int index){
    setState(()=>_selectedIndex=index);

  }
}
