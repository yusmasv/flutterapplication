import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui_starter/widgets/explore_carrousel.dart';
import 'package:flutter_travel_ui_starter/screens/activities_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          print(_selectedIndex);
        },
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFE7EBEE),
              borderRadius: BorderRadius.circular(30.0)),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4),
          ),
        ));
  }

  final _widgetOptions = [
    ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 120.0),
          child: Text(
            'Mau liburan kemana kali ini?',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        DestinationCarousel(),
        SizedBox(
          height: 20.0,
        ),
        HotelCarousel(),
      ],
    ),
    ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 120.0),
          child: Text(
            'Destinasi paling dicari tahun ini',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ExploreCarrousel()
      ],
    ),
    ActivitiesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentTab),
        // ListView(
        //   padding: EdgeInsets.symmetric(vertical: 30.0),
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.only(left: 20.0, right: 120.0),
        //       child: Text(
        //         'Mau liburan kemana kali ini?',
        //         style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 20.0,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: _icons
        //           .asMap()
        //           .entries
        //           .map((MapEntry map) => _buildIcon(map.key))
        //           .toList(),
        //     ),
        //     SizedBox(
        //       height: 20.0,
        //     ),
        //     DestinationCarousel(),
        //     SizedBox(
        //       height: 20.0,
        //     ),
        //     HotelCarousel(),
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 20.0,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_activity,
                size: 20.0,
              ),
              label: "Aktivitas"),
        ],
      ),
    );
  }
}