import 'dart:convert';

import 'package:http/http.dart';
import 'package:nba/network/model.dart';

Future<TeamResponse> getAllTeams() async {
  final response = await get("https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=nba");

  if (response.statusCode == 200) {
    return TeamResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load teams');
  }
}
