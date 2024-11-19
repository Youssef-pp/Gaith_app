class DetailsModel {
  dynamic status;
  String? message;
  Donation? donation;



  DetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    donation = json['donation'] != null
        ? Donation.fromJson(json['donation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (donation != null) {
      data['donation'] = donation!.toJson();
    }
    return data;
  }
}

class Donation {
  int? id;
  String? img;
  String? name;
  String? address;
  String? phone;
  String? des;
  String? price;
  String? pay;



  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    des = json['des'];
    price = json['price'];
    pay = json['pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['des'] = des;
    data['price'] = price;
    data['pay'] = pay;
    return data;
  }
}