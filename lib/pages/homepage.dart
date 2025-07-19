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
    );
  }
}