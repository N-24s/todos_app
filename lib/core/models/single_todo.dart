// To parse this JSON data, do
//
//     final singletodos = singletodosFromJson(jsonString);

import 'dart:convert';

Singletodos singletodosFromJson(String str) => Singletodos.fromJson(json.decode(str));

String singletodosToJson(Singletodos data) => json.encode(data.toJson());

class Singletodos {
    int id;
    String todo;
    bool completed;
    int userId;

    Singletodos({
        required this.id,
        required this.todo,
        required this.completed,
        required this.userId,
    });

    factory Singletodos.fromJson(Map<String, dynamic> json) => Singletodos(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
    };
}
