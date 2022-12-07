class SpecialConditionsModel {
  String? status;
  int? errors;
  int? code;
  List<Question>? data;

  SpecialConditionsModel({this.status, this.errors, this.code, this.data});

  SpecialConditionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Question>[];
      json['data'].forEach((v) {
        data!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  String? question;
  List<Answer>? answers;

  Question({this.id, this.question, this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = <Answer>[];
      json['answers'].forEach((v) {
        answers!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  int? questionId;
  String? title;

  Answer({this.id, this.questionId, this.title});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['title'] = this.title;
    return data;
  }
}
