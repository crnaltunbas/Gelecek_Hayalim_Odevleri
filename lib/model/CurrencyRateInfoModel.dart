import 'package:what_currency_app/model/RatesModel.dart';

class CurrencyRateInfoModel {
  int? timestamp;
  String? base;
  bool? success;
  String? date;
  RatesModel? rates;

  CurrencyRateInfoModel(
      {this.timestamp, this.base, this.success, this.date, this.rates});

  CurrencyRateInfoModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    base = json['base'];
    success = json['success'];
    date = json['date'];
    rates = json['rates'] != null ?  RatesModel.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['timestamp'] = timestamp;
    data['base'] = base;
    data['success'] = success;
    data['date'] = date;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    return data;
  }
}