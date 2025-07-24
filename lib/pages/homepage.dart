import 'dart:async';

import 'package:babybhai/actions/crud.dart';
import 'package:babybhai/components/mytextfield.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController updatetitleController = TextEditingController();
  final TextEditingController updatecontentController = TextEditingController();

  final myStream = supabase.from('Notes')
  .stream(primaryKey: ['id']);


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        showDialog(
        context: context,
        builder: (context) => Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Mytextfield(
                    hintText: 'Title',
                    autoFocus: true,
                    controller: titleController,
                    ),

                    SizedBox(height: 10,),

                    Mytextfield(
                    hintText: 'Content',
                    controller: contentController,
                    ),

                    SizedBox(height: 30,),

                    TextButton(onPressed: (){
                      addNotes(titleController.text, contentController.text);
                      titleController.clear();
                      contentController.clear();
                      Navigator.pop(context);
                    }, child: Text('Add Note')),
                  ],
                ),
            ),
          ),
        )
        );
      },
      child: Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: myStream,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(!snapshot.hasData){
            return Center(child: Text('No notes available'),);
          }
          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Card(
                child: ListTile(
                  title: Text(note['title']),
                  subtitle: Text(note['content']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      IconButton(
                      onPressed: (){
                      idController.text = note['id'].toString();
                      updatetitleController.text = note['title'];
                      updatecontentController.text = note['content'];
                      showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Mytextfield(
                              hintText: 'ID',
                              controller: idController,
                              readOnly: true,
                            ),

                            SizedBox(height: 20,),

                            Mytextfield(
                              hintText: 'Title',
                              controller: updatetitleController
                            ),

                            SizedBox(height: 20,),

                            Mytextfield(
                              hintText: '',
                              controller: updatecontentController
                            ),

                            SizedBox(height: 20,),

                            TextButton(
                              onPressed: (){
                                updateNote(
                                  idController.text,
                                  updatetitleController.text,
                                  updatecontentController.text
                                );
                              },
                              child: Text('Update')
                            ),
                          ],
                          ),
                        ),
                      ));
                      },
                      icon: Icon(Icons.update)),

                      IconButton(
                      onPressed: (){
                        idController.text = note['id'].toString();
                        showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Padding(
                            padding:EdgeInsetsGeometry.all(40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Delete Note?'),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    TextButton(onPressed: (){
                                      deleteNote(idController.text);
                                      Navigator.pop(context);
                                    }, child: Text('Confirm')),

                                    TextButton(onPressed: (){ 
                                     Navigator.pop(context);
                                },   child: Text('Cancel'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                      icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}