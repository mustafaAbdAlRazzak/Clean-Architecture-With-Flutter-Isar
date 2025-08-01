import 'dart:io';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/features/note/data/d_t_o_models/note_d_t_o_model_isar.dart';
import 'package:untitled/features/note/data/data_sources/isar_data_source.dart';
import 'package:untitled/features/note/data/data_sources/local_data_source.dart';
import 'package:untitled/features/note/data/repositories/note_repository_impl.dart';
import 'package:untitled/features/note/domain/repositories/note_repository.dart';
import 'package:untitled/features/note/domain/use_cases/add_note_use_case.dart';
import 'package:untitled/features/note/domain/use_cases/delete_note_use_case.dart';
import 'package:untitled/features/note/domain/use_cases/edit_note_use_case.dart';
import 'package:untitled/features/note/domain/use_cases/get_all_notes_use_case.dart';

class DependencyInjection extends GetxService {
  late final AddNoteUseCase addNoteUseCase;
  late final EditNoteUseCase editNoteUseCase;
  late final DeleteNoteUseCase deleteNoteUseCase;
  late final GetAllNotesUseCase getAllNotesUseCase;
  late final NoteRepository noteRepository;
  late final LocalDataSource localDataSource;
  late final Isar isar;
  late final Directory directory;

  Future<DependencyInjection> init() async {
    directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteDTOModelSchema], directory: directory.path);
    localDataSource = IsarDataSource(isar);
    noteRepository = NoteRepositoryImpl(localDataSource);
    getAllNotesUseCase = GetAllNotesUseCase(noteRepository);
    deleteNoteUseCase = DeleteNoteUseCase(noteRepository);
    editNoteUseCase = EditNoteUseCase(noteRepository);
    addNoteUseCase = AddNoteUseCase(noteRepository);
    return this;
  }
}
