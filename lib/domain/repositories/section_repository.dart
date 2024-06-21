import 'package:bila_hodoud/domain/entities/section.dart';

abstract class SectionRepository {
  Future<void> addSection (Section section);
  Future<void> editSection (Section section , int id);
  Future<List<Section>> getAllSections();
}
