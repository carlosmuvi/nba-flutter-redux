class Team {
  final String name;
  final String badgeImageUrl;

  Team(this.name, this.badgeImageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          badgeImageUrl == other.badgeImageUrl;

  @override
  int get hashCode => name.hashCode ^ badgeImageUrl.hashCode;
}
