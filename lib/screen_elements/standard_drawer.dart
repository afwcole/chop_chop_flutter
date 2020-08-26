import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.8,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Theme
                      .of(context)
                      .primaryColor),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Kofi Tsikita",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                        SizedBox(height: 4,),
                        Text("+233205765286",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black54,),),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.black87,),
                title: Text("Account", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.local_dining, color: Colors.black87,),
                title: Text("Orders", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet, color: Colors.black87,),
                title: Text("Wallet", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.black87,),
                title: Text("Settings", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.black87,),
                title: Text("Help", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}