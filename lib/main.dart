import 'package:flutter/material.dart';
import 'subjectView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zikanwari',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Zikanwari'),
      },
      onGenerateRoute: (settings) {
        if(settings.name == '/subjectView'){
          return MaterialPageRoute(
            builder: (context) => SubjectView(settings.arguments),
          );
        }
        return null;
      }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('今日'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    var weekday = DateTime.now().weekday;
                    Navigator.of(context).pushNamed('/subjectView', arguments: weekday);
                  },
                ),
                ElevatedButton(
                  child: Text('明日'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyanAccent,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    var weekday = DateTime.now().weekday + 1;
                    if(weekday > 7) weekday = 1;
                    Navigator.of(context).pushNamed('/subjectView', arguments: weekday);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('月'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/subjectView', arguments: 1);
                  },
                ),
                ElevatedButton(
                  child: Text('火'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/subjectView', arguments: 2);
                  },
                ),
                ElevatedButton(
                  child: Text('水'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/subjectView', arguments: 3);
                  },
                ),
                ElevatedButton(
                  child: Text('木'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/subjectView', arguments: 4);
                  },
                ),
                ElevatedButton(
                  child: Text('金'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/subjectView', arguments: 5);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
