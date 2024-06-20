class Section {
   String? id;
  final String sectionName;
  final String sectionDescription;
  final bool sectionStatus;
  final int sectionOrder;

  Section(
      {
      required this.sectionName,
      required this.sectionDescription,
      required this.sectionStatus,
      required this.sectionOrder});
}
