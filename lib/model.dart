class Team {
  final String title;

  Team(this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Team && runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}