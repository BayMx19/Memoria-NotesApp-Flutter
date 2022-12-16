import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:Memoria/screens/note_editor.dart';
import 'package:Memoria/screens/note_reader.dart';
import 'package:Memoria/widgets/note_card.dart';



import '../style/app_style.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

 @override
 State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
    backgroundColor: AppStyle.bgColor,
    appBar: AppBar(
      elevation: 0.0,
      title: Text("Memoria", 
      style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold,),),
      backgroundColor: AppStyle.mainColor,
      
      centerTitle: true,
      
    ),
    body: Padding(
      
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          
          Text(
            
              "Catatan Anda", 
              style: GoogleFonts.roboto(
                color: Colors.black, 
                fontWeight: FontWeight.bold, 
                fontSize: 20,
              
                ),
              ),
          
          SizedBox(
            height: 30.0,

          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                  child: CircularProgressIndicator(),
                );
                }
                if(snapshot.hasData){
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                      children: snapshot.data!.docs.map((note) => noteCard((){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                          builder: (context) => 
                          NoteReaderScreen(note),));
                      }, note)).toList(),
                    );
                }
              
          
              return Text("Tidak ada Catatan", 
              style: GoogleFonts.poppins(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 18
                  ),);
          
                  },
            ),
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        }, 
        backgroundColor: AppStyle.mainColor,
        
        label: Text("Tambah Catatan", style: TextStyle(color: Colors.black),),
        
        icon: Icon(Icons.add, color: Colors.black),
        ),
    );

  }
}