class Team {
  final String name;

  Team(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Team && runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}