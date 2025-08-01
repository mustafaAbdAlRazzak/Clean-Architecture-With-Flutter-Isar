import 'package:untitled/features/note/data/d_t_o_models/note_d_t_o_model_isar.dart';

abstract class LocalDataSource {
  Future<void> addNote({required NoteDTOModel noteDTOModel});
  Future<void> deleteNote({required int id});
  Future<void> editNote({required NoteDTOModel noteDTOModel});
  Future<List<NoteDTOModel>> getAllNotes();
}