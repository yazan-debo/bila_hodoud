import 'package:bila_hodoud/domain/entities/section.dart';

import '../../domain/repositories/section_repository.dart';
import '../datasources/api/section_api.dart';
import '../models/section_model.dart';

class SectionRepositoryImpl implements SectionRepository{
  final SectionApi sectionApi;
  SectionRepositoryImpl(this.sectionApi);

  @override
  Future<void> addSection(Section section) async {
    final sectionModel = SectionModel(
      name: section.sectionName,
      priority: section.sectionOrder,
      isVisible: section.sectionStatus,
      description: section.sectionDescription,
    );

    await sectionApi.createSection(sectionModel);
  }

  @override
  Future<void> editSection(Section section, int id)  async {
    final sectionModel = SectionModel(
      name: section.sectionName,
      priority: section.sectionOrder,
      isVisible: section.sectionStatus,
      description: section.sectionDescription,
    );

    await sectionApi.editSection(sectionModel , id);
  }

  @override
  Future<List<Section>> getAllSections() async {
    var sectionModels = await sectionApi.getAllSections();

    var sections = sectionModels.map((sectionModel) => Section(
      id: sectionModel.id,
      sectionName: sectionModel.name,
      sectionDescription: sectionModel.description,
      sectionStatus: sectionModel.isVisible,
      sectionOrder: sectionModel.priority,
    )).toList();

    return sections;
  }
  
  
}