import 'package:flutter/material.dart';
import 'package:todos_app/core/view_model/todos_vm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodosVm todosVm =TodosVm();
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      
      child: Scaffold(
      appBar:AppBar(title:  const Text("Todos"),
bottom:  const TabBar(tabs: [Text("Completed"), Text("In Progress"),Text("All"),Text("Single Todo")] ),),
body: TabBarView(children: [
   isCompletedTodos(todosVm: todosVm, check: true,),
    isCompletedTodos(todosVm: todosVm, check: false,),
    allTodos(todosVm: todosVm),
    singleTodo(todosVm: todosVm)


])
 ));
  
           

  }
}


class isCompletedTodos extends StatelessWidget {
  const isCompletedTodos({
    super.key,
    required this.todosVm, required this.check,
  });

  final TodosVm todosVm;
  final bool? check;
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      
      future: todosVm.getTodos(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          return  
      ListView.builder(
        itemCount:snapshot.data!.length ,
        itemBuilder: (ctx,index){
          if(snapshot.data![index].completed==check){
        
          return 
       Column(
        children: [
          CartWidget(completed:snapshot.data![index].completed,des:snapshot.data![index].todo, title: 'Todo-$index',userId: snapshot.data![index].userId,),
      
        ],);
          }
         
          else{
              return Text("");
       
          }
        
 
        },
        );
   
  
        }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
        
      
      },);
  }
}



class allTodos extends StatelessWidget {
  const allTodos({
    super.key,
    required this.todosVm, 
  });

  final TodosVm todosVm;
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      
      future: todosVm.getTodos(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          return  
      ListView.builder(
        itemCount:snapshot.data!.length ,
        itemBuilder: (ctx,index){
        
        
          return 
       Column(
        children: [
          CartWidget(completed:snapshot.data![index].completed,des:snapshot.data![index].todo, title: 'Todo-$index',userId: snapshot.data![index].userId,),
      
        ],);
          
  
        
 
        },
        );
   
  
        }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
        
      
      },);
  }
}



class singleTodo extends StatelessWidget {
  const singleTodo({
    super.key,
    required this.todosVm, 
  });

  final TodosVm todosVm;
  

  @override
  Widget build(BuildContext context) {
        TextEditingController controller =TextEditingController();
   
    return Column(
      children: [
        TextField(
          controller: controller,
        )
      ],
    );
  }
}



class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key, required this.title, required this.des, required this.userId, required this.completed,
  });
  final String title,des;
  final int userId;
  final bool completed;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                          
                            shape:  BeveledRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: completed?Colors.green:Colors.yellow,width: 1),),
                          
                            child:   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                width: 300,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Center(child: Text(title)),
                                      leading:  Text('$userId'),
                                    
                                      trailing:  Icon(completed?Icons.check_circle_outline_rounded:Icons.hourglass_top_rounded,color:completed?Colors.green:Colors.yellow ),
                                                      
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 10),
                                       child: Text(
                                        des,

                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                       ),
                                     
                                     ),
        
                                  ],
                                )),
                            ),
                          ),
     );
  }
}