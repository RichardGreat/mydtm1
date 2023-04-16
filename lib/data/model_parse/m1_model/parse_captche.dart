class ModelParseCaptcha {
  ModelParseCaptcha({
    required this.status,
    required this.data,
  });

  int status;
  DataParseCaptcha data;

  factory ModelParseCaptcha.fromJson(Map<String, dynamic> json) => ModelParseCaptcha(
    status: json["status"],
    data: DataParseCaptcha.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DataParseCaptcha {
  DataParseCaptcha({
    required this.captchaKey,
    required this.captchaImg,
    required this.val,
  });

  String captchaKey;
  String captchaImg;
  int val;

  factory DataParseCaptcha.fromJson(Map<String, dynamic> json) => DataParseCaptcha(
    captchaKey: json["captcha_key"],
    captchaImg: json["captcha_img"],
    val: json["val"],
  );

  Map<String, dynamic> toJson() => {
    "captcha_key": captchaKey,
    "captcha_img": captchaImg,
    "val": val,
  };
}
