class BloodDonor {
  late int code;
  late List<String> messages;
  Data? data;

  BloodDonor({required this.code, required this.messages, this.data});

  BloodDonor.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'].cast<String>();
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  late int total;
  late int perPage;
  late int currentPage;
  late int lastPage;
  late String nextPageUrl;
  late String? prevPageUrl;
  late int from;
  late int to;
  late List<BloodDonors> data;

  Data(
      {required this.total,
      required this.perPage,
      required this.currentPage,
      required this.lastPage,
      required this.nextPageUrl,
      required this.prevPageUrl,
      required this.from,
      required this.to,
      required this.data});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    from = json['from'];
    to = json['to'];
    if (json['data'] != null) {
      data = <BloodDonors>[];
      json['data'].forEach((v) {
        data.add(new BloodDonors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    data['from'] = this.from;
    data['to'] = this.to;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloodDonors {
  late int id;
  late String name;
  late String companyName;
  late String designation;
  late String empId;
  late String department;
  late String dateOfBirth;
  late int age;
  late String gender;
  late String bloodGroup;
  late String cellNo;
  late int status;

  BloodDonors(
      {required this.id,
      required this.name,
      required this.companyName,
      required this.designation,
      required this.empId,
      required this.department,
      required this.dateOfBirth,
      required this.age,
      required this.gender,
      required this.bloodGroup,
      required this.cellNo,
      required this.status});

  BloodDonors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyName = json['company_name'];
    designation = json['designation'];
    empId = json['emp_id'];
    department = json['department'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    cellNo = json['cell_no'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['designation'] = this.designation;
    data['emp_id'] = this.empId;
    data['department'] = this.department;
    data['date_of_birth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['cell_no'] = this.cellNo;
    data['status'] = this.status;
    return data;
  }
}
