class HelpGetter {
  final String name;
  final String address;
  final int raised;
  final int needed;
  final String description;
  final String raisingFor;

  HelpGetter({
    required this.name,
    required this.address,
    required this.raised,
    required this.needed,
    required this.description,
    required this.raisingFor,
  });

  factory HelpGetter.fromMap(Map<String, dynamic> data) {
    return HelpGetter(
      name: data['name'],
      address: data['address'],
      raised: data['raised'],
      needed: data['needed'],
      description: data['description'],
      raisingFor: data['raisingfor'],
    );
  }
}
