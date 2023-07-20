class HelpResponse {
  int? status;
  String? message;
  List<Help>? help;

  HelpResponse({this.status, this.message, this.help});

  HelpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = <Help>[];
      json['help'].forEach((v) {
        help!.add(new Help.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.help != null) {
      data['help'] = this.help!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Help {
  int? id;
  String? question;
  String? answer;

  Help({this.id, this.question, this.answer});

  Help.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
