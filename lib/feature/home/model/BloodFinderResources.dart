class BloodFinderResources {
  late int code;
  late List<String> messages;
  late Data data;

  BloodFinderResources({required this.code, required this.messages, required this.data});

  BloodFinderResources.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'].cast<String>();
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late List<BloodGroups> bloodGroups;
  late List<Companies> companies;

  Data({required this.bloodGroups, required this.companies});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['blood_groups'] != null) {
      bloodGroups = <BloodGroups>[];
      json['blood_groups'].forEach((v) {
        bloodGroups.add(new BloodGroups.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bloodGroups != null) {
      data['blood_groups'] = this.bloodGroups.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloodGroups {
  late String bloodGroup;

  BloodGroups({required this.bloodGroup});

  BloodGroups.fromJson(Map<String, dynamic> json) {
    bloodGroup = json['blood_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blood_group'] = this.bloodGroup;
    return data;
  }
}

class Companies {
  late String companyName;
  late List<Departments> departments;

  Companies({required this.companyName, required this.departments});

  Companies.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments.add(new Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    if (this.departments != null) {
      data['departments'] = this.departments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  late String departmentName;

  Departments({required this.departmentName});

  Departments.fromJson(Map<String, dynamic> json) {
    departmentName = json['department_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_name'] = this.departmentName;
    return data;
  }
}