import 'package:database/di/config.dart';
import 'package:database/model/note.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../repozitory/notes_repository.dart';

part 'note_store.g.dart'; // Указание для кодогенерации

@Injectable()
class NoteStore = _NoteStore with _$NoteStore;

abstract class _NoteStore with Store {
  final NotesRepository _notesRepo;

  _NoteStore(this._notesRepo);

  @observable
  List<Note> value = [];

  @action
  Future init() async {
    _notesRepo
        .initDB()
        .whenComplete(() => value = _notesRepo.notes);
  }

  @action
  Future delete(Note note) async {
    await _notesRepo.deleteNote(note);
    value = _notesRepo.notes;
  }

  @action
  Future add(Note note) async {
    await _notesRepo.addNote(note);
    value = _notesRepo.notes;
  }

  @action
  Future update(int id, Note note) async {
    await _notesRepo.updateNote(id, note);
    value = _notesRepo.notes;
  }
}
