class ProvinceDao {
  int id;
  String code;
  String nameTh;
  String nameEn;
  int geographyId;

 

  ProvinceDao({ required this.id, 
                required this.code, 
                required this.nameTh, 
                required this.nameEn, 
                required this.geographyId
                }
              );

  factory ProvinceDao.fromJson(Map<String, dynamic> json) {
    return ProvinceDao(
      id: int.parse(json["id"]),
      code: json["code"],
      nameTh: json["name_th"],
      nameEn: json["name_en"],
      geographyId: int.parse(json["geography_id"]),
    );
  }

  get isEmpty => null;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name_th": nameTh,
      "name_en": nameEn,
      "geography_id": geographyId,
    };
  }
}
