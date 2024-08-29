class CompanyModel {
  String? code;
  String? name;
  String? nameAr;
  String? ipAddress;
  String? logo;
  String? activeFrom;
  String? activeTo;
  String? minVersionIos;
  String? minVersionAndriod;
  bool? isMsTeamsAllowed;
  bool? isWhatsAppAllowed;

  CompanyModel(
      {this.code,
      this.name,
      this.nameAr,
      this.ipAddress,
      this.logo,
      this.activeFrom,
      this.activeTo,
      this.minVersionIos,
      this.minVersionAndriod,
      this.isMsTeamsAllowed,
      this.isWhatsAppAllowed});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    nameAr = json['nameAr'];
    ipAddress = json['ipAddress'];
    logo = json['logo'];
    activeFrom = json['activeFrom'];
    activeTo = json['activeTo'];
    minVersionIos = json['minVersionIos'];
    minVersionAndriod = json['minVersionAndriod'];
    isMsTeamsAllowed = json['isMsTeamsAllowed'];
    isWhatsAppAllowed = json['isWhatsAppAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['nameAr'] = this.nameAr;
    data['ipAddress'] = this.ipAddress;
    data['logo'] = this.logo;
    data['activeFrom'] = this.activeFrom;
    data['activeTo'] = this.activeTo;
    data['minVersionIos'] = this.minVersionIos;
    data['minVersionAndriod'] = this.minVersionAndriod;
    data['isMsTeamsAllowed'] = this.isMsTeamsAllowed;
    data['isWhatsAppAllowed'] = this.isWhatsAppAllowed;
    return data;
  }
}
