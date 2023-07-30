class Places {
  const Places({
    required this.place,
    required this.placeId,
  });

  final String place;
  final String placeId;

  @override
  String toString() {
    return '$place, $placeId';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Places && other.place == place && other.placeId == placeId;
  }

  @override
  int get hashCode => Object.hash(place, placeId);
}
