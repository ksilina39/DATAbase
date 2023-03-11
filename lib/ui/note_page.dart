import 'package:database/di/config.dart';
import 'package:database/ui/note_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../model/note.dart';



class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  
  late final _notes = <Note>[];
  final NoteStore _viewModel = getIt<NoteStore>();


  @override
  void initState() {
    super.initState();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
        itemCount: _viewModel.value.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(
            _viewModel.value[i].name,
          ),
          subtitle: Text(
            _viewModel.value[i].description,
          ),
          trailing: Wrap(
              children: [
                IconButton(
                  onPressed: (() =>  _showEditDialog( _viewModel.value[i]))
                   , 
                  icon: const Icon(Icons.edit)),
                IconButton(
                  onPressed: () async {
                    await _viewModel.delete(_viewModel.value[i]);
                    //Navigator.pop(context);
                  }, 
                  icon: const Icon(Icons.delete))
              ],
            ),
        ));}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showDialog() => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController();
          final descController = TextEditingController();
          return AlertDialog(
            title: const Text('New note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await _viewModel.add(
                    Note(
                      name: nameController.text,
                      description: descController.text,
                    ),
                  );
                  
                    Navigator.pop(context);
                  
                },
                child: const Text('Add'),
              )
            ],
          );
        },
      );

      Future _showEditDialog(Note note) => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController(text: note.name);
          final descController = TextEditingController(text: note.description);
          return AlertDialog(
            title: const Text('New note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await _viewModel.update(
                    note.id,
                    Note(
                      name: nameController.text,
                      description: descController.text,
                    ),
                  );
                  
                    Navigator.pop(context);
                 
                },
                child: const Text('Confirm'),
              )
            ],
          );
        },
      );
}
