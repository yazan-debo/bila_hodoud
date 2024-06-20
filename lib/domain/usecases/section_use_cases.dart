import 'package:bila_hodoud/domain/entities/section.dart';

import '../repositories/section_repository.dart';

class SectionUseCases {
  final SectionRepository sectionRepository;

  SectionUseCases(this.sectionRepository);

  Future<void> createNewSection(Section section) async {
    await sectionRepository.addSection(section);}

  Future<void> editSection(Section section, int id) async {
    await sectionRepository.editSection(section , id);}
}
