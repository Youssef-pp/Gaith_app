class DonationsModel {
  int? id;
  String? img;
  String? name;
  String? catigoryAr;
  String? catigoryEn;
  String? address;
  String? phone;
  String? dec;
  String? price;
  String? pay;



  DonationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    catigoryAr = json['catigory_ar'];
    catigoryEn = json['catigory_en'];
    address = json['address'];
    phone = json['phone'];
    dec = json['dec'];
    price = json['price'];
    pay = json['pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['name'] = name;
    data['catigory_ar'] = catigoryAr;
    data['catigory_en'] = catigoryEn;
    data['address'] = address;
    data['phone'] = phone;
    data['dec'] = dec;
    data['price'] = price;
    data['pay'] = pay;
    return data;
  }
}