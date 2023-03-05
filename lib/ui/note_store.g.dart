// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStore, Store {
  late final _$valueAtom = Atom(name: '_NoteStore.value', context: context);

  @override
  List<Note> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<Note> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_NoteStore.init', context: context);

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_NoteStore.delete', context: context);

  @override
  Future<dynamic> delete(Note note) {
    return _$deleteAsyncAction.run(() => super.delete(note));
  }

  late final _$addAsyncAction = AsyncAction('_NoteStore.add', context: context);

  @override
  Future<dynamic> add(Note note) {
    return _$addAsyncAction.run(() => super.add(note));
  }

  late final _$updateAsyncAction =
      AsyncAction('_NoteStore.update', context: context);

  @override
  Future<dynamic> update(int id, Note note) {
    return _$updateAsyncAction.run(() => super.update(id, note));
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
