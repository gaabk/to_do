import 'package:flutter/material.dart';
import 'package:to_do_app/const/colors.dart';
import 'package:to_do_app/data/firestore.dart';

class Add_creen extends StatefulWidget {
  const Add_creen({super.key});

  @override
  State<Add_creen> createState() => _Add_creenState();
}

class _Add_creenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title_widget(),
          SizedBox(height: 20),
          subtitle_widget(),
          SizedBox(height: 20),
          imagess(),
          SizedBox(height: 20),
          button()
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: customGreen,
                minimumSize: Size(170, 48)
              ),
              onPressed:(){
                Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
                Navigator.pop(context);
              }, 
              child: Text('add Task'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(170, 48)
              ),
              onPressed:(){
                Navigator.pop(context);
              }, 
              child: Text('Cancel'),
            ),
          ],
        );
  }

  Container imagess() {
    return Container(
          height: 180,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexx = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: indexx == index ? customGreen : Colors.grey,
                    )
                  ),
                  width: 140,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset('images/${index}.png'),
                    ],
                  ),
                ),
              );
            } ,
          ),
        );
  }

  Widget title_widget() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: title,
                focusNode: _focusNode1,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'title',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffc5c5c5), 
                        width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: customGreen, 
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget subtitle_widget() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                maxLines: 3,
                controller: subtitle,
                focusNode: _focusNode2,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'subtitle',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffc5c5c5), 
                        width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: customGreen, 
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}