class ModelSms2 {
  ModelSms2({
   required this.status,
   required this.data,
  });

  int status;
  DataSms2  data;

  factory ModelSms2.fromJson(Map<String, dynamic> json) => ModelSms2(
    status: json["status"],
    data: DataSms2.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataSms2 {
  DataSms2({
  required this.logId,
  required this.smsId,
  required this.phone,
  });

  int logId;
  int smsId;
  String phone;

  factory DataSms2.fromJson(Map<String, dynamic> json) => DataSms2(
    logId: json["log_id"],
    smsId: json["sms_id"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "log_id": logId,
    "sms_id": smsId,
    "phone": phone,
  };
}
