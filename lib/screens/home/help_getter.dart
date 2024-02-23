class HelpGetter {
  final String name;
  final String address;
  final int raised;
  final int needed;

  HelpGetter({
    required this.name,
    required this.address,
    required this.raised,
    required this.needed,
  });

  factory HelpGetter.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      throw ArgumentError('Data cannot be null');
    }

    return HelpGetter(
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      raised: data['raised'] ?? 0,
      needed: data['needed'] ?? 0,
    );
  }
}
