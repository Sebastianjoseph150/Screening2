import 'package:flutter/material.dart';
import 'package:screening2/presentations/log_in.dart';
import 'package:screening2/presentations/widgets/company_info.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.details),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Companyinfowidget()));
            },
          ),
          ListTile(
            title: const Text(
              'LogOut',
              style: TextStyle(color: Colors.red),
            ),
            trailing: const Icon(Icons.logout_outlined),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
