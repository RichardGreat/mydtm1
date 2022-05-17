
class ModelRegistrationSms {
  ModelRegistrationSms({
   required this.status,
  required  this.data,
  });

  int status;
  DataRegistrationSms data;

  factory ModelRegistrationSms.fromJson(Map<String, dynamic> json) => ModelRegistrationSms(
    status: json["status"],
    data: DataRegistrationSms.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataRegistrationSms {
  DataRegistrationSms({
  required this.smsId,
  required this.endDate,
  required this.message,
  });

  int smsId;
  int endDate;
  List<String> message;

  factory DataRegistrationSms.fromJson(Map<String, dynamic> json) => DataRegistrationSms(
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
