import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Memoria/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();

}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  
  @override 
  Widget build(BuildContext context){
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.mainColor,
        elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
        title: Text("Memoria", style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold),), 
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 4.0,),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            SizedBox(height: 30.0,),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
            
            ),
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton.extended(
      onPressed: () async{
        await FirebaseFirestore.instance.collection("Notes").doc(widget.doc.id).delete();
        Navigator.pop(context);
      },
      backgroundColor: AppStyle.mainColor,
      label: Text("Hapus Catatan", style: TextStyle(color:Colors.black)),
      icon: Icon(Icons.delete, color: Colors.black,)
     ),
    );

  }
}