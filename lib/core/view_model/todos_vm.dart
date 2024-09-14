import 'package:dio/dio.dart';
import 'package:todos_app/core/models/single_todo.dart';
import 'package:todos_app/core/models/single_todo.dart';
import 'package:todos_app/core/models/single_todo.dart';
import 'package:todos_app/core/models/todos.dart';

class TodosVm {
      Dio dio =Dio();

Future<List<Todo>?>  getTodos()async{
  try{
      Response  res=await dio.get("https://dummyjson.com/todos"); 
   List<dynamic> allTodos=res.data?['todos'];
   List<Todo> todos= allTodos.map<Todo>((e) => Todo.fromJson(e)).toList();
   return todos;


  }catch(e){
print("Erorrrrrrrrrrrrrrrrrr $e");
  }
  }

//  Future<List<Todo>?>  isCompletedTodos({required bool check})async{
//       try{
//          Response  res=await dio.get("https://dummyjson.com/todos"); 
//    List<dynamic> allTodos=res.data?['todos'];
//     List<Todo>? completed=  allTodos.map<Todo>((e) => Todo.fromJson(e)).where((e)=>e.completed==check).toList();
//    return completed;
//       }
//       catch (e){
//         print("erorrrrrrrrrrrrr$e");
//       }
//   }

  Future<Map<String,dynamic>?>  singleTodo( {required int userId})async{
      try{
         Response  res=await dio.get("https://dummyjson.com/todos/$userId"); 
   Map<String,dynamic> singleTodo=res.data ;
    Map<String,dynamic> completed= singleTodo ;
   return completed;
      }
      catch (e){
        print("erorrrrrrrrrrrrr$e");
      }
  }

}