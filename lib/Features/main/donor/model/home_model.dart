import 'package:gaith/Features/main/donor/model/donation_model.dart';

import 'advertisements.dart';
import 'category_model.dart';

class DonorModel {
  int? status;
  String? message;
  List<Advertisements>? advertisements;
  List<Catigory>? catigory;
  List<DonationsModel>? donations;



  DonorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['advertisements'] != null) {
      advertisements = <Advertisements>[];
      json['advertisements'].forEach((v) {
        advertisements!.add(Advertisements.fromJson(v));
      });
    }
    if (json['Catigory'] != null) {
      catigory = <Catigory>[];
      json['Catigory'].forEach((v) {
        catigory!.add(Catigory.fromJson(v));
      });
    }
    if (json['Donations'] != null) {
      donations = <DonationsModel>[];
      json['Donations'].forEach((v) {
        donations!.add(DonationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (advertisements != null) {
      data['advertisements'] =
          advertisements!.map((v) => v.toJson()).toList();
    }
    if (catigory != null) {
      data['Catigory'] = catigory!.map((v) => v.toJson()).toList();
    }
    if (donations != null) {
      data['Donations'] = donations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}





