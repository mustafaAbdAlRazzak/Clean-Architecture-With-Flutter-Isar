import 'package:isar/isar.dart';
import 'package:untitled/features/note/data/d_t_o_models/note_d_t_o_model_isar.dart';
import 'package:untitled/features/note/data/data_sources/local_data_source.dart';

class IsarDataSource implements LocalDataSource {
  final Isar isar;
  IsarDataSource(this.isar);

  @override
  Future<void> addNote({required NoteDTOModel noteDTOModel}) async {
    await isar.writeTxn(() async {
      await isar.noteDTOModels.put(noteDTOModel);
    });
  }

  @override
  Future<void> deleteNote({required int id}) async {
    await isar.writeTxn(() async {
      await isar.noteDTOModels.delete(id);
    });
  }

  @override
  Future<void> editNote({required NoteDTOModel noteDTOModel}) async {
    await isar.writeTxn(() async {
      await isar.noteDTOModels.put(noteDTOModel); 
    });
  }

  @override
  Future<List<NoteDTOModel>> getAllNotes() async {
    final notes = await isar.noteDTOModels.where().findAll();
    return notes;
  }
}
