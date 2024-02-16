import 'package:flutter/material.dart';
import 'colors.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text("Sangeetha S"),
                accountEmail: Text("Sangeetha@gmail.com")),
            Menulist(title: "Orders", iconName: Icons.border_color),
            Menulist(title: "Address", iconName: Icons.bookmark),
            Menulist(title: "Notification", iconName: Icons.notifications),
            Menulist(title: "Help", iconName: Icons.help),
            Menulist(title: "About", iconName: Icons.account_box),
            Menulist(title: "Rate Us", iconName: Icons.star_half),
            Menulist(title: "Log out", iconName: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class Menulist extends StatelessWidget {
  final String title;
  final IconData iconName;
  Menulist({required this.title, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          iconName,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
