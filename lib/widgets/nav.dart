import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ying_3_3/Presentation/GigFeedScreens/IndividualGigFeedScreen/gig_feed_1_feed_screen.dart';
import 'package:ying_3_3/Presentation/PostTaskScreens/IndividualPostTaskScreen/individual_post_a_taks_1_screen.dart';
import 'package:ying_3_3/Presentation/SearchScreens/IndividualSearchScreens/search_container_screen.dart';
import 'package:ying_3_3/Presentation/UserProfileScreens/UserProfileViewScrren/user_profile_user_view_screen.dart';
import 'package:ying_3_3/theme/theme_helper.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
// GET AND DISPLAY USER OR GROUP INFORMATION START //

  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final String uid = user!.uid;

    final List<Widget> _widgetOptions = <Widget>[
      const GigFeed1FeedScreen(),
      SearchContainerScreen(), // Placeholder widget for the second screen
      const IndividualPostATask1Screen(), // Placeholder widget for the third screen
      Container(), // Placeholder widget for the fourth screen
      UserProfileUserViewScreen(
        userId: uid,
      ), // Placeholder widget for the fifth screen
    ];

    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.home,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.home),
            tooltip: 'Home',
            label: 'Home',
          ),
          _buildBottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.search_rounded),
            tooltip: 'Search',
            label: 'Search',
          ),
          _buildBottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: Icon(
                Icons.add,
                color: theme.canvasColor,
              ),
            ),
            tooltip: 'Post',
            label: 'Post',
          ),
          _buildBottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.notifications),
            tooltip: 'Notifications',
            label: 'Notifications',
          ),
          _buildBottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.person),
            tooltip: 'Profile',
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Widget icon,
    required String tooltip,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      tooltip: tooltip,
      label: label,
    );
  }
}
