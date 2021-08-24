class TaskModel{
 late String? title;
 late String? description;
 late DateTime? date;
 late bool? status;
 late String? level;
 late String? startTime;
 late String? endTime;


  TaskModel({
     this.startTime,
     this.endTime,
     this.date,
     this.description,
     this.level,
     this.status,
     this.title,
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
  }

  Map<String , dynamic> toMap()
  {
    return {
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,

      'description': description,
      'level': level,
      'status': status,
    };
  }
}