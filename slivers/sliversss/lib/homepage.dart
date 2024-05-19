import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print("listener");
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            // expandedHeight: 150,
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Build your list item here, for example:
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 1000, // Change this number based on your list size
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isVisible ? 60 : 0.0,
        child: SizedBox(
          height: 65.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.abc),
                label: '',
              ),
            ],
            currentIndex: 0,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedFontSize: 0.0,
            type: BottomNavigationBarType.fixed,
            onTap: null,
          ),
        ),
      ),
    );
  }
}
