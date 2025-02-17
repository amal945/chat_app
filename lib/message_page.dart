import 'package:flutter/material.dart';
import 'package:wori_app/core/theme.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: Theme
            .of(context)
            .textTheme
            .titleLarge,),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white,)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  15.0),
            child: Text("Recent",style: Theme.of(context).textTheme.bodySmall,),
          ),
          SizedBox(height: 5,),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContacts(context,"Barry"),
                _buildRecentContacts(context,"Joe"),
                _buildRecentContacts(context,"Ben"),
                _buildRecentContacts(context,"Iris"),
                _buildRecentContacts(context,"Cisco"),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(child: Container(
            decoration: BoxDecoration(
              color: DefaultColors.messageListPage,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: ListView(
              children: [
                _buildMessageTile(context, "Tom Espinall", "Espinall@gmail.com","8:43"),
                _buildMessageTile(context, "Frazer", "Frazer@gmail.com","8:43"),
                _buildMessageTile(context, "Mike Tyson", "miketyson@gmail.com","8:43"),
                _buildMessageTile(context, "Muhammad Ali", "muhammadali@gmail.com","8:43"),
                _buildMessageTile(context, "Mcreggor", "macreggor7@gmail.com","8:43"),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildMessageTile(BuildContext context,String name, String message,String time){
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage("https://via.placeholder.come/150"),
      ),
      title: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      subtitle: Text(message,style: TextStyle(color: Colors.grey,),overflow: TextOverflow.ellipsis,),
      trailing: Text(
        time,
        style:TextStyle(color: Colors.grey,) ,
      ),
    );
  }


  Widget _buildRecentContacts(BuildContext context,String name) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
      children: [
      CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage("https://via.placeholder.come/150"),
    ),
    SizedBox(height: 5,),
    Text(name,style: Theme.of(context).textTheme.bodyMedium,)

    ],
    )
    ,
    );
  }

}


