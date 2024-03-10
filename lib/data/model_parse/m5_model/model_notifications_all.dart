
class ModelNotificationAll {
  dynamic id;
  dynamic pnfl;
  dynamic title;
  dynamic summary;
  dynamic sendDate;
  dynamic status;
  dynamic deviceToken;

  ModelNotificationAll({
     this.id,
     this.pnfl,
     this.title,
     this.summary,
     this.sendDate,
     this.status,
     this.deviceToken,
  });

  factory ModelNotificationAll.fromJson(Map<String, dynamic> json) => ModelNotificationAll(
    id: json["id"],
    pnfl: json["pnfl"],
    title: json["title"],
    summary: json["summary"],
    sendDate: json["send_date"],
    status: json["status"],
    deviceToken: json["device_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pnfl": pnfl,
    "title": title,
    "summary": summary,
    "send_date": sendDate,
    "status": status,
    "device_token": deviceToken,
  };
}
