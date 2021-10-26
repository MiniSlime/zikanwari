import 'package:flutter/material.dart';
import 'getSubjectData.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectView extends StatefulWidget {
  SubjectView(this.weekday);
  final weekday;
  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  var _weekday;
  List<Widget> subjects = [];
  List<dynamic> lists = [];

  @override
  void initState(){
    super.initState();
    if(widget.weekday != null){
      setState(() {
        _weekday = widget.weekday;
      });
    }
    Future(() async {
      await getRequest();
    });
    if(_weekday == 6 || _weekday == 7){
      ListTile tile = ListTile(
        leading: Icon(Icons.favorite),
        title: Text('休日'),
        subtitle: Text('いっぱい休もう！'),
        onTap: () {},
      );
      setState(() {
        subjects.add(tile);
      });
    }
  }

  getRequest() async{
    getSubjectData(_weekday).then((value) => {
      setState(() {
        lists = value;
        for(dynamic data in lists){
          if(data['subject'] != ''){
            ListTile tile = ListTile(
              leading: Text(data['classNum'], style: GoogleFonts.oswald(fontSize: 20)),
              title: Text(data['subject']),
              subtitle: Text(data['item']),
              onTap: () {},
            );
            subjects.add(tile);
          }
        }
      }),
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Zikanwari'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: subjects,
      ),
    );
  }
}
