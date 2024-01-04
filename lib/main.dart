import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bookAppProject',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '예제'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xPos = 0.0;
  double yPos = 0.0;

  _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      xPos += details.delta.dx;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Icon(Icons.hexagon, color: Colors.black),
        backgroundColor: Color(0xFFFFFF00),
        leading: IconButton(
          icon: Icon(Icons.person, color: Colors.black),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.manage_search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: _onPanUpdate,
          child: Transform.translate(
            offset: Offset(xPos, yPos),
            child: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: 150.0,
                height: 100.0, 
                child: Image.asset('myassets/mytestimages/image1.jpg',
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'edit',
          ),
        ],
      ),
    );
  }
}
