// help_getter.dart

class HelpGetter {
  final String image;
  final String name;
  final String fatherName; // New field
  final String address;
  final int raised;
  final int needed;
  final String description;
  final String raisingFor;

  HelpGetter({
    required this.image,
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
      throw ArgumentError('Data cannot be null');
    }

    return HelpGetter(
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      fatherName: data['fathername'] ?? '',
      address: data['address'] ?? '',
      raised: data['raised'] ?? 0,
      needed: data['needed'] ?? 0,
      description: data['description'] ?? '',
      raisingFor: data['raisingfor'] ?? '',
    );
  }
}
