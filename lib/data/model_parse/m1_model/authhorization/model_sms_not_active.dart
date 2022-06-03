class ModelAuthNotActiveSms {
  ModelAuthNotActiveSms({
  required  this.status,
    required this.data,
  });

  int status;
  DataAuthNotActiveSms data;

  factory ModelAuthNotActiveSms.fromJson(Map<String, dynamic> json) => ModelAuthNotActiveSms(
    status: json["status"],
    data: DataAuthNotActiveSms.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataAuthNotActiveSms {
  DataAuthNotActiveSms({
   required this.smsId,
   required this.endDate,
   required this.message,
  });

  int smsId;
  int endDate;
  List<String> message;

  factory DataAuthNotActiveSms.fromJson(Map<String, dynamic> json) => DataAuthNotActiveSms(
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