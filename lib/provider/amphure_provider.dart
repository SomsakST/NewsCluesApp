import 'package:main_cluesnew/dao/amphure_dao.dart';
import 'package:main_cluesnew/flutter_thailand_provinces.dart';

class AmphureProvider {
  static const String TABLE_AMPHURES = "amphures";

  static Future<List<AmphureDao>> all({int provinceId = 0}) async {
    String? where;
    List<dynamic>? whereArgs;
    if (provinceId > 0) {
      where = "province_id = ?";
      whereArgs = ["$provinceId"];
    }

    List<Map<String, dynamic>>? mapResult = await ThailandProvincesDatabase.db
        ?.query(TABLE_AMPHURES, where: where, whereArgs: whereArgs);

    if (mapResult == null) return <AmphureDao>[];

    List<AmphureDao> listAmphures = mapAmphuresList(mapResult);

    return listAmphures;
  }

  static Future<List<AmphureDao>> searchInProvince(
      {int provinceId = 1, String keyword = ""}) async {
    List<Map<String, dynamic>>? mapResult = await ThailandProvincesDatabase.db
        ?.query(TABLE_AMPHURES,
            where: "(province_id = ?) AND ( name_th LIKE ? OR name_en LIKE ? )",
            whereArgs: ["$provinceId", "%$keyword%", "%$keyword%"]);

    if (mapResult == null) return <AmphureDao>[];

    List<AmphureDao> listAmphures = mapAmphuresList(mapResult);

    return listAmphures;
  }

  static Future<List<AmphureDao>> search({String keyword = ""}) async {
    List<Map<String, dynamic>>? mapResult = await ThailandProvincesDatabase.db
        ?.query(TABLE_AMPHURES,
            where: "( name_th LIKE ? OR name_en LIKE ? )",
            whereArgs: ["%$keyword%", "%$keyword%"]);

    if (mapResult == null) return <AmphureDao>[];

    List<AmphureDao> listAmphures = mapAmphuresList(mapResult);

    return listAmphures;
  }

  static List<AmphureDao> mapAmphuresList(
      List<Map<String, dynamic>> mapResult) {
    List<AmphureDao> listAmphures = [];
    for (var mapRow in mapResult) {
      listAmphures.add(AmphureDao.fromJson(mapRow));
    }
    return listAmphures;
  }
}
