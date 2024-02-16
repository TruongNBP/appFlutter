import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/page/detail/detail_page.dart';
import 'package:weather/page/home/home_page.dart';
import 'package:weather/page/todolist/todo_list_page.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> listItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.today), label: 'Forecast'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'Todo List'),
  ];

  List<Widget> listPages = [
    const HomePage(),
    const DetailPage(),
    const TodoListPage(),
  ];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPages[activePage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage,
        backgroundColor: Colors.white24,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        onTap: (index){
          setState(() {
            activePage = index;
          });
        },
        items: listItems,
      ),
    );
  }
}

class ForecastPage {
  const ForecastPage();
}
