class Section {
   int? id;
  final String sectionName;
  final String sectionDescription;
  final bool sectionStatus;
  final int sectionOrder;

  Section(
      {
        this.id,
      required this.sectionName,
      required this.sectionDescription,
      required this.sectionStatus,
      required this.sectionOrder, });
}
