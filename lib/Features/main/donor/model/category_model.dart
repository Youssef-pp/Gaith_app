class Catigory {
  int? id;
  String? img;
  String? nameAr;
  String? nameEn;



  Catigory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}