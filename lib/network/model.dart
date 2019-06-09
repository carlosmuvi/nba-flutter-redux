class TeamResponse {
  final List<TeamItemResponse> data;

  TeamResponse(this.data);

  factory TeamResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['teams'];
    var map = list.map((item) => TeamItemResponse.fromJson(item)).toList();
    return TeamResponse(map);
  }
}

class TeamItemResponse {
  String id;
  String name;
  String fullName;
  String teamBadge;

  TeamItemResponse(this.id, this.name, this.fullName, this.teamBadge);

  factory TeamItemResponse.fromJson(Map<String, dynamic> json) {
    return TeamItemResponse(
        json['idTeam'] as String,
        json['strTeamShort'] as String,
        json['strTeam'] as String,
        json['strTeamBadge'] as String
    );
  }
}
