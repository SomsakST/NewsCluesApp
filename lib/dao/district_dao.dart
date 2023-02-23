class DistrictDao {
  int id;
  String zipCode;
  String nameTh;
  String nameEn;
  int amphureId;

  DistrictDao({
    this.id = 0,
    this.zipCode = '',
    this.nameTh = '',
    this.nameEn = '',
    this.amphureId = 0,
  });

  factory DistrictDao.fromJson(Map<String, dynamic> json) {
    return DistrictDao(
      id: json["id"] != null ? int.parse(json["id"]) : 0,
      zipCode: json["zip_code"] ?? '',
      nameTh: json["name_th"] ?? '',
      nameEn: json["name_en"] ?? '',
      amphureId: json["amphure_id"] != null ? int.parse(json["amphure_id"]) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "zip_code": zipCode,
      "name_th": nameTh,
      "name_en": nameEn,
      "amphure_id": amphureId,
    };
  }

  toLowerCase() {}
}
