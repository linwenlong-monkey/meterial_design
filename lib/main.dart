//app结构
//MaterialApp、Scaffold、AppBar、BattomNavigaition、TabBar、Drawer

import 'package:flutter/material.dart';

void main() => runApp(MaterialDesignDemo());

class MaterialDesignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialDesign', //title属性应用程序的标题，
      home: HomePage(), //设置主页
      routes: {
        '/first': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage()
      }, //路由跳转map对象
      initialRoute: '/second',
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('第一个界面'),
      ),
      body: Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('进入第二个界面'),
        ),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey,
          height: 50.0,
        ),
      ),

      //添加fab按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("添加");
        },
        tooltip: 'add',
        child: Icon(Icons.add),
      ),

      //fab按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个界面'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, Navigator.defaultRouteName);
          },
          child: Text('进入第一个界面'),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 1; //当前
  final _widGetOptions = ['index 0 : 信息', 'index 1 : 通讯录', 'index 2 : 发现'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标题'),
      ),
      body: Center(
          child: Container(
        width: 200.0,
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text(
              _widGetOptions.elementAt(_selectedIndex),
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Text('跳转'),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('信息')),
          // BottomNavigationBarItem(icon: null),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('发现'))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTappep,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //点击的值
  void _onItemTappep(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
