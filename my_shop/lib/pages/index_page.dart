import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
final List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(
    title: Text('首页'),
    icon: Icon(CupertinoIcons.home),
  ),
    BottomNavigationBarItem(
    title: Text('分类'),
    icon: Icon(CupertinoIcons.search),
  ),
    BottomNavigationBarItem(
    title: Text('购物车'),
    icon: Icon(CupertinoIcons.shopping_cart),
  ),
    BottomNavigationBarItem(
    title: Text('会员中心'),
    icon: Icon(CupertinoIcons.profile_circled),
  ),

];

final List<Widget> tabBodies = [
  HomePage(),
  CategoryPage(),
  CartPage(),
  MemberPage()
];

int currentIndex = 0;
var currentpage;


  @override
  void initState() {
    super.initState();
    currentpage = tabBodies[currentIndex];
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentpage = tabBodies[index];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      )
    );
  }
}

