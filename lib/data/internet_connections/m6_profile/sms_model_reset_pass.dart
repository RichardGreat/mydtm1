class ModelResetPassSms {
  ModelResetPassSms({
  required  this.status,
  required  this.data,
  });

  int status;
  DataResetPassSms data;

  factory ModelResetPassSms.fromJson(Map<String, dynamic> json) => ModelResetPassSms(
    status: json["status"],
    data: DataResetPassSms.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataResetPassSms {
  DataResetPassSms({
  required  this.smsId,
  required  this.endDate,
  required  this.message,
  });

  int smsId;
  int endDate;
  List<String> message;

  factory DataResetPassSms.fromJson(Map<String, dynamic> json) => DataResetPassSms(
    smsId: json["sms_id"],
    endDate: json["end_date"],
    message: List<String>.from(json["message"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "sms_id": smsId,
    "end_date": endDate,
    "message": List<dynamic>.from(message.map((x) => x)),
  };
}
