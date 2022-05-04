class QuestionData {
  bool? status;
  String? message;
  List<Data>? data;

  QuestionData({this.status, this.message, this.data});

  QuestionData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? programName;
  String? programId;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? userId;
  String? programStartDate;
  String? programEndDate;
  List<Question>? question;

  Data(
      {this.id,
      this.name,
      this.programName,
      this.programId,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.userId,
      this.programStartDate,
      this.programEndDate,
      this.question});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    programName = json['program_name'];
    programId = json['program_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    userId = json['user_id'];
    programStartDate = json['program_start_date'];
    programEndDate = json['program_end_date'];
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['program_name'] = this.programName;
    data['program_id'] = this.programId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['program_start_date'] = this.programStartDate;
    data['program_end_date'] = this.programEndDate;
    if (this.question != null) {
      data['question'] = this.question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  String? programId;
  String? milestoneId;
  String? userId;
  String? question;
  String? type;
  String? op1;
  String? op2;
  String? op3;
  String? op4;
  Null? op5;
  Null? op6;
  Null? op7;
  Null? op8;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? programName;
  String? milestoneName;
  String? tagName;
  String? isRequired;
  List<String>? options;

  Question(
      {this.id,
      this.programId,
      this.milestoneId,
      this.userId,
      this.question,
      this.type,
      this.op1,
      this.op2,
      this.op3,
      this.op4,
      this.op5,
      this.op6,
      this.op7,
      this.op8,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.programName,
      this.milestoneName,
      this.tagName,
      this.isRequired,
      this.options});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    milestoneId = json['milestone_id'];
    userId = json['user_id'];
    question = json['question'];
    type = json['type'];
    op1 = json['op1'];
    op2 = json['op2'];
    op3 = json['op3'];
    op4 = json['op4'];
    op5 = json['op5'];
    op6 = json['op6'];
    op7 = json['op7'];
    op8 = json['op8'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    programName = json['program_name'];
    milestoneName = json['milestone_name'];
    tagName = json['tag_name'];
    isRequired = json['is_required'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['program_id'] = this.programId;
    data['milestone_id'] = this.milestoneId;
    data['user_id'] = this.userId;
    data['question'] = this.question;
    data['type'] = this.type;
    data['op1'] = this.op1;
    data['op2'] = this.op2;
    data['op3'] = this.op3;
    data['op4'] = this.op4;
    data['op5'] = this.op5;
    data['op6'] = this.op6;
    data['op7'] = this.op7;
    data['op8'] = this.op8;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['program_name'] = this.programName;
    data['milestone_name'] = this.milestoneName;
    data['tag_name'] = this.tagName;
    data['is_required'] = this.isRequired;
    data['options'] = this.options;
    return data;
  }
}
