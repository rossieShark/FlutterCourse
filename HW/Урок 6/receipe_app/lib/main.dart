import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:receipe_app/widgets/screens/home_screen.dart';
import 'package:receipe_app/widgets/screens/my_favorite_recipes.dart';
import 'package:receipe_app/widgets/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:receipe_app/widgets/widgets/ui_widget.dart';

import 'models/favorite_receipe/favorite_recipe_model.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
              labelColor: AppColors.yellow.color,
              unselectedLabelColor: AppColors.white.color,
              indicatorColor: AppColors.yellow.color),
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: AppColors.yellow.color,
            barBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          unselectedWidgetColor: AppColors.yellow.color,
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          useMaterial3: true,
        ),
        home: const ReceipeApp(),
      ),
    );
  }
}

class FavoriteProvider extends ChangeNotifier {
  final List<Recipe> _favoriteReceipe = [];

  List<Recipe> get favoriteReceipe => _favoriteReceipe;

  void addToFavorites(Recipe recipe) {
    _favoriteReceipe.add(recipe);
    notifyListeners();
  }

  void removeFromFavorites(Recipe recipe) {
    _favoriteReceipe.removeWhere((item) => item.name == recipe.name);
    notifyListeners();
  }
}

class ReceipeApp extends StatefulWidget {
  const ReceipeApp({super.key});

  @override
  State<ReceipeApp> createState() => _ReceipeApp();
}

class _ReceipeApp extends State<ReceipeApp> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = 0;
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoRecipe(tabController: _tabController);
    } else {
      return AndroidRecipe(tabController: _tabController);
    }
  }
}

class AndroidRecipe extends StatelessWidget {
  const AndroidRecipe({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          controller: tabController,
          children: const [
            HomeController(),
            MyRecepiecesWidget(),
            ProfileController(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home_filled)),
              Tab(icon: Icon(Icons.favorite_border_outlined)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoRecipe extends StatelessWidget {
  const CupertinoRecipe({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              child: getContentForTab(index),
            );
          },
        );
      },
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_favorites)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill)),
        ],
        currentIndex: tabController.index,
        onTap: (index) {
          tabController.index = index;
        },
        inactiveColor: const Color.fromARGB(255, 221, 221, 221),
      ),
    );
  }

  Widget getContentForTab(int index) {
    switch (index) {
      case 0:
        return const HomeController();
      case 1:
        return const MyRecepiecesWidget();
      case 2:
        return const ProfileController();
      default:
        return Container();
    }
  }
}
