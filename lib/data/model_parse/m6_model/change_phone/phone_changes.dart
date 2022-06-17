class ModelPhoneChange {
  ModelPhoneChange({
  required this.status,
  required this.data,
  });

  int status;
  DataPhoneChange data;

  factory ModelPhoneChange.fromJson(Map<String, dynamic> json) => ModelPhoneChange(
    status: json["status"],
    data: DataPhoneChange.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataPhoneChange {
  DataPhoneChange({
  required this.smsId,
  required this.phone,
  });

  int smsId;
  String phone;

  factory DataPhoneChange.fromJson(Map<String, dynamic> json) => DataPhoneChange(
    smsId: json["sms_id"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "sms_id": smsId,
    "phone": phone,
  };
}
