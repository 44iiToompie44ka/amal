class HelpGetter {
  final String name;
  final String fatherName; // New field
  final String address;
  final int raised;
  final int needed;
  final String description;
  final String raisingFor;

  HelpGetter({
    required this.name,
    required this.fatherName,
    required this.address,
    required this.raised,
    required this.needed,
    required this.description,
    required this.raisingFor,
  });

  factory HelpGetter.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      // Handle null data, you can throw an exception or return a default instance
      throw ArgumentError('Data cannot be null');
    }

    return HelpGetter(
      name: data['name'] ?? '',
      fatherName: data['fathername'] ?? '', // Adjust field name accordingly
      address: data['address'] ?? '',
      raised: data['raised'] ?? 0,
      needed: data['needed'] ?? 0,
      description: data['description'] ?? '',
      raisingFor: data['raisingfor'] ?? '',
    );
  }
}
