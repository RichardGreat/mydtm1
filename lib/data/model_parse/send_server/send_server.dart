class ModelSendServerInfo {
  ModelSendServerInfo({
  required  this.sert,
  required  this.isGrand,
  required  this.isMaqsad,
  required  this.testRegionId,
  required  this.langId,
  required  this.appId,
  required  this.testGraph,
  required  this.emodeId,
  required  this.eduId,
  required  this.planId,
  required  this.flangId,
  });

  Map<String, String> sert;
  String isGrand;
  String isMaqsad;
  String testRegionId;
  String langId;
  String testGraph;
  int appId;
  Map<String, String> emodeId;
  Map<String, String> eduId;
  Map<String, String> planId;
  String flangId;

  factory ModelSendServerInfo.fromJson(Map<String, dynamic> json) => ModelSendServerInfo(
    sert: Map.from(json["sert"]).map((k, v) => MapEntry<String, String>(k, v)),
    isGrand: json["is_grand"],
    isMaqsad: json["is_maqsad"],
    testRegionId: json["test_region_id"],
    langId: json["lang_id"],
    testGraph: json["test_graph"],
    appId: json["app_id"],
    emodeId: Map.from(json["emode_id"]).map((k, v) => MapEntry<String, String>(k, v)),
    eduId: Map.from(json["edu_id"]).map((k, v) => MapEntry<String, String>(k, v)),
    planId: Map.from(json["plan_id"]).map((k, v) => MapEntry<String, String>(k, v)),
    flangId: json["flang_id"],
  );

  Map<String, dynamic> toJson() => {
    "sert": Map.from(sert).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "is_grand": isGrand,
    "is_maqsad": isMaqsad,
    "test_region_id": testRegionId,
    "lang_id": langId,
    "app_id": appId,
    "test_graph": testGraph,
    "emode_id": Map.from(emodeId).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "edu_id": Map.from(eduId).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "plan_id": Map.from(planId).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "flang_id": flangId,
  };
}
