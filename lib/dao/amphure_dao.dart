class AmphureDao {
  int id;
  String code;
  String nameTh;
  String nameEn;
  int provinceId;

  AmphureDao({
    this.id = 0,
    this.code = '',
    this.nameTh = '',
    this.nameEn = '',
    this.provinceId = 0,
  });

  factory AmphureDao.fromJson(Map<String, dynamic> json) {
    return AmphureDao(
      id: json["id"] != null ? int.parse(json["id"]) : 0,
      code: json["code"] ?? '',
      nameTh: json["name_th"] ?? '',
      nameEn: json["name_en"] ?? '',
      provinceId:
          json["province_id"] != null ? int.parse(json["province_id"]) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name_th": nameTh,
      "name_en": nameEn,
      "province_id": provinceId,
    };
  }

  toLowerCase() {}
}
