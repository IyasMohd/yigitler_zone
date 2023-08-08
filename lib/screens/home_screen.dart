import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yigitler_zone/core/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          HomeHeader(
            globalKey: _globalKey,
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  color: secondaryBgColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Favorite contacts',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const BuildContactAvatar(
                          name: 'Suhail',
                          filePath: 'assets/images/Sample_Avatar.jpeg',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 320,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFFEFFFFC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/chat-screen');
                  },
                  leading: AvatarWidget(
                      filePath: 'assets/images/Sample_Avatar.jpeg'),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Suhail'),
                      Text(
                        'Recent Message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Text('12:00 am'),
                      const SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.lightGreenAccent.shade700,
                        child: const Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryBgColor,
        onPressed: () {},
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(40),
          ),
        ),
        width: 275,
        elevation: 30,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(40),
              ),
              color: Color(0xF71F1E1E),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3D000000),
                  blurRadius: 20,
                  spreadRadius: 50,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      // horizontalTitleGap: 30,
                      onTap: () {},
                      leading: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          )),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        AvatarWidget(
                            filePath: 'assets/images/Sample_Avatar.jpeg'),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Suhail",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.key,
                      title: 'Account',
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.chat_bubble,
                      title: 'Chats',
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.notifications,
                      title: 'Notification',
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.storage,
                      title: 'Data and Storage',
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.help,
                      title: 'Help',
                    ),
                    Divider(
                      height: 35,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    DrawerItem(
                      onTap: () {},
                      icon: Icons.person_add_sharp,
                      title: 'invite a friend',
                    ),
                  ],
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.logout,
                  title: 'Logout',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          )),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BuildContactAvatar extends StatelessWidget {
  const BuildContactAvatar({
    super.key,
    required this.name,
    required this.filePath,
  });

  final String name;
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          AvatarWidget(
            filePath: filePath,
          ),
          5.verticalSpace,
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  AvatarWidget({
    super.key,
    required this.filePath,
    this.radius = 26,
  });

  final String filePath;
  double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: radius + 2.0,
      child: CircleAvatar(
        // backgroundColor: Colors.red,
        radius: radius,
        backgroundImage: Image.asset(
          'assets/images/Sample_Avatar.jpeg',
          fit: BoxFit.cover,
        ).image,
      ),
      // backgroundColor: Colors.white,
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.globalKey,
  });

  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        left: 5,
        right: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  globalKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 50,
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 2,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Messages',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      )),
                  const SizedBox(
                    width: 35,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Groups',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'More',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
