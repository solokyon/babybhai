import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> addNotes(String title, String content)async
{
  try{
  await supabase
  .from('Notes')
  .insert({
    'title': title,
    'content': content,
  });
  }catch(e){
    SnackBar(content: throw Exception('Error Adding Note: $e'));
  }
}

Future<List<Map<String, dynamic>>> fetchNotes() async{
  try{
    final data = await supabase
    .from('Notes')
    .select();
    return List<Map<String, dynamic>>.from(data);
  }catch(e){
    SnackBar(content: throw Exception('Error Fetching Note: $e'));
  }
}

Future<void> updateNote(String id, String title, String content)async{
  try{
    await supabase
    .from('Notes')
    .update({
      'title': title,
      'content': content,
    })
    .eq('id', id);
  }catch(e){
    SnackBar(content: throw Exception('Error Updating Note: $e'));
  }
}

Future<void> deleteNote(String id)async{
  try{
    await supabase
    .from('notes')
    .delete()
    .eq('id', id);
  }catch(e){
    SnackBar(content: throw Exception('Error Deleting Note: $e'));
  }
}
