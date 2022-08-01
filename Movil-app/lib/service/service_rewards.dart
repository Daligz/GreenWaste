import 'dart:convert';

import 'package:http/http.dart';
import 'package:movil_app/service/common/reward.dart';
import 'package:movil_app/service/service_routes.dart';

class ServiceRewards{
    static Future<List<Reward>?> getRewards() async{
    final Response response = await get(Uri.parse(Routes.routeRewardsRead()));
    if(response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Reward.fromJson(e)).toList();
  }
}