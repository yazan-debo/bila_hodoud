import 'package:bila_hodoud/data/datasources/api/section_api.dart';
import 'package:bila_hodoud/data/models/section_model.dart';
import 'package:bila_hodoud/data/repositories/section_repository_impl.dart';
import 'package:bila_hodoud/domain/entities/section.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSectionApi extends Mock implements SectionApi {}

void main() {
  group('SectionRepositoryImpl', () {
    late SectionRepositoryImpl repository;
    late MockSectionApi mockSectionApi;

    setUp(() {
      mockSectionApi = MockSectionApi();
      repository = SectionRepositoryImpl(mockSectionApi);
    });

    test('createSection should call SectionApi.createSection', () async {
      // Arrange
      final section = Section(
       // id: '6',
        sectionName: 'Test Section',
        sectionOrder: 1,
        sectionStatus: true,
        sectionDescription: 'Test section description.',
      );
      final sectionModel = SectionModel.fromEntity(section); // Create a SectionModel object

      // Act
      await repository.addSection(section);

      // Assert
      verify(mockSectionApi.createSection(sectionModel)).called(1);
    });
  });
}