class TaskModel{
 late String? title;
 late String? description;
 late dynamic date;
 late bool? status;
 late String? level;
 late String? startTime;
 late String? endTime;
 late String? uId;
 late int? color;


  TaskModel({
     this.startTime,
     this.endTime,
     this.date,
     this.description,
     this.level,
     this.status,
     this.title,
     this.uId,
    this.color
});

  TaskModel.fromJson(Map<String , dynamic> json)
  {
    title = json['title'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    description = json['description'];
    level = json['level'];
    status = json['status'];
    uId = json['uId'];
    color = json['color'];

  }

  Map<String , dynamic> toMap()
  {
    return {
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'uId': uId,
      'description': description,
      'level': level,
      'status': status,
      'color': color,
    };
  }
}