class RepositoriesModel {
  String? name;
  String? description;
  String? createdAT;
  String? language;
  bool? archived;
  bool? disabled;

  RepositoriesModel({
    this.name,
    this.description,
    this.createdAT,
    this.language,
    this.archived,
    this.disabled,
  });

  RepositoriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    createdAT = json['created_at'];
    language = json['language'];
    archived = json['archived'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAT;
    data['language'] = language;
    data['archived'] = archived;
    data['disabled'] = disabled;
    return data;
  }
}
