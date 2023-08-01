// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:receipe_app/services/category_receipe/category_recipe_response.dart';
import 'package:receipe_app/services/search_pagination_service/search_pagination_service.dart';
import 'package:receipe_app/widgets/screens/recipe_detail_screen.dart';
import 'package:receipe_app/widgets/widgets/button_widget.dart';
import 'package:receipe_app/widgets/widgets/custom_spinner.dart';
import 'package:receipe_app/widgets/widgets/rating_widget.dart';

import '../../models/category_recipe/category_receipe.dart';
import '../../models/popular_recipe/popular_recipes.dart';
import '../../services/popular_recipe/popular_recipes_pagination_service.dart';
import '../widgets/ui_widget.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  HomeControllerState createState() => HomeControllerState();
}

class HomeControllerState extends State<HomeController> {
  final ScrollController _scrollController = ScrollController();
  final _searchService = SearchPaginationService();
  final FocusNode _focusNode = FocusNode();
  final RecipesPaginationService _service = RecipesPaginationService();
  final TextEditingController _searchController = TextEditingController();

  List<RecipeFeed> get _searchResult => _searchService.items;
  Timer? _debounceTimer;
  bool _isLoading = false;
  bool isTappedTextField = false;
  List<RecipeFeed> get _feed => _service.items;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });

    _searchController.addListener(() async {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(seconds: 1), () async {
        await _loadMoreItems();
      });
    });

    _scrollController.addListener(() {
      _scrollListener();
    });
    //_loadMoreItems();
    _loadMorePopularItems();
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = _searchService.items.isEmpty;
    });
    await _searchService.loadMoreItems(_searchController.text);
    print('load more data');
    setState(() {
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!isTappedTextField) {
        if (!_service.isLoading) {
          print('loading more popular items');
          _loadMorePopularItems();
        }
      } else {
        print(isTappedTextField);
        if (!_searchService.isLoading) {
          print('loading more search items');
          _loadMoreItems();
        }
      }
    }
  }

  Future<void> _loadMorePopularItems() async {
    await _service.loadMoreItems();
    print('load more data');
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black.color,
      body: SafeArea(
        child: CustomScrollView(controller: _scrollController, slivers: [
          HeaderWidget(maxHeight: maxHeight),
          SliverAppBar(
            backgroundColor: AppColors.black.color,
            expandedHeight: 25,
            surfaceTintColor: AppColors.black.color,
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: SizedBox(
                width: maxWidth,
                child: SearchTextField(),
              ),
            ),
          ),
          _isLoading
              ? const SliverToBoxAdapter(child: CustomSpinner())
              : isTappedTextField
                  ? SearchResultList(searchResult: _searchResult)
                  : SliverToBoxAdapter(
                      child: Column(children: [
                        SizedBox(height: maxHeight * 0.01),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Text(
                              'Receipes category',
                              style: TextStyle(
                                  fontSize: maxHeight * 0.03,
                                  color: AppColors.white.color,
                                  fontFamily: AppFonts.fontspring.font,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: CategoryList(),
                        ),
                        Container(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                            child: Text(
                              'Popular receipes',
                              style: TextStyle(
                                  fontSize: maxHeight * 0.03,
                                  fontFamily: AppFonts.fontspring.font,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.color),
                            ),
                          ),
                        ),
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.white.color))),
                        ),
                        _feed.isEmpty
                            ? const CustomSpinner()
                            : PopularListViewWidget(feed: _feed),
                      ]),
                    ),
        ]),
      ),
    );
  }

  TextField SearchTextField() {
    return TextField(
        controller: _searchController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: _focusNode.hasFocus ? '' : 'Recipes',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
            fontFamily: AppFonts.montserrat.font,
          ),
          labelStyle: TextStyle(color: AppColors.white.color),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white.color)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white.color)),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButtonWidget(
                  iconData: Icons.clear,
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      isTappedTextField = false;
                    });
                  },
                )
              : null,
        ),
        onChanged: (query) {
          setState(() {
            isTappedTextField = true;
          });
        });
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.maxHeight,
  });

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, ',
                    style: TextStyle(
                        color: AppColors.white.color,
                        fontFamily: AppFonts.fontspring.font,
                        fontWeight: FontWeight.w200,
                        fontSize: maxHeight * 0.025)),
                Text('Rosie',
                    style: TextStyle(
                        color: AppColors.yellow.color,
                        fontFamily: AppFonts.fontspring.font,
                        fontSize: maxHeight * 0.03)),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: maxHeight * 0.035,
              backgroundImage: AssetImage(AppImages.userImage.image),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required List<RecipeFeed> searchResult,
  }) : _searchResult = searchResult;

  final List<RecipeFeed> _searchResult;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _searchResult.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Text(
                  'No results',
                  style: TextStyle(color: AppColors.white.color, fontSize: 25),
                )))
            : ListTile(
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceipeDetailScreen(
                                numberOfServings: _searchResult[index]
                                        .content
                                        .details
                                        .numberOfServings ??
                                    3,
                                totalTime: _searchResult[index]
                                        .content
                                        .details
                                        .totalTime ??
                                    '',
                                images: _searchResult[index]
                                    .content
                                    .details
                                    .images[0]
                                    .hostedLargeUrl,
                                name: _searchResult[index].content.details.name,
                                rating:
                                    _searchResult[index].content.details.rating,
                                ingredients: _searchResult[index]
                                    .content
                                    .ingredientLines,
                                reciepe: _searchResult[index]
                                    .content
                                    .preparationSteps,
                                description: _searchResult[index]
                                        .content
                                        .description
                                        ?.text ??
                                    "",
                              ),
                          fullscreenDialog: true),
                    );
                  },
                  child: Text(
                    _searchResult[index].content.details.name,
                    style: TextStyle(color: AppColors.white.color),
                  ),
                ),
              );
      }, childCount: _searchResult.length),
    );
  }
}

class PopularListViewWidget extends StatelessWidget {
  const PopularListViewWidget({
    super.key,
    required List<RecipeFeed> feed,
  }) : _feed = feed;

  final List<RecipeFeed> _feed;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _feed.length * (maxHeight * 0.1 + 35),
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: AppColors.white.color,
                height: 1,
              ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _feed.length,
          itemBuilder: (context, index) {
            final receipe = _feed[index].content.details;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      child: SizedBox(
                        height: maxHeight * 0.1,
                        width: maxHeight * 0.1,
                        child: Image.network(
                          receipe.images[0].hostedLargeUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.1,
                    width: maxWidth - maxHeight * 0.1 - 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          receipe.name,
                          style: TextStyle(
                            color: AppColors.white.color,
                            fontSize: maxHeight * 0.013,
                            fontFamily: AppFonts.montserrat.font,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            StarRating(
                              starCount: 5,
                              rating: receipe.rating,
                              color: AppColors.yellow.color,
                              size: maxHeight * 0.018,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${receipe.rating}',
                              style: TextStyle(
                                  color: AppColors.white.color,
                                  fontFamily: AppFonts.montserrat.font,
                                  fontSize: maxHeight * 0.013),
                            ),
                          ],
                        ),
                        Container(
                          height: maxHeight * 0.034,
                          width: maxHeight * 0.08,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(maxHeight * 0.02),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 247, 172, 33))),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReceipeDetailScreen(
                                      numberOfServings:
                                          receipe.numberOfServings ?? 2,
                                      totalTime: receipe.totalTime ?? "30 min",
                                      images: receipe.images[0].hostedLargeUrl,
                                      name: receipe.name,
                                      rating: receipe.rating,
                                      ingredients:
                                          _feed[index].content.ingredientLines,
                                      reciepe:
                                          _feed[index].content.preparationSteps,
                                      description: _feed[index]
                                          .content
                                          .description
                                          ?.text),
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'See',
                                style: TextStyle(
                                  fontSize: maxHeight * 0.01,
                                  fontFamily: AppFonts.montserrat.font,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);
  @override
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  final CategoryRecipeRepository _categoryReceipeRepository =
      CategoryRecipeRepository();
  bool _isDataFetched = false;
  List<CategoryData>? _categoryRecipeList;
  @override
  void initState() {
    super.initState();
    _fetchCategoryRecipes();
  }

  Future<void> _fetchCategoryRecipes() async {
    try {
      final categoryRecipe =
          await _categoryReceipeRepository.getCategoryRecipes();
      setState(() {
        _categoryRecipeList = categoryRecipe;
        _isDataFetched = true;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    if (!_isDataFetched) {
      return const CustomSpinner();
    } else if (_categoryRecipeList == null) {
      return const Center(child: Text('No data available'));
    }

    return SizedBox(
      height: maxHeight * 0.16,
      child: ListView.builder(
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemCount: _categoryRecipeList!.length,
          itemBuilder: (context, index) {
            final categoryRecipe = _categoryRecipeList![index];
            return GestureDetector(
              onTap: () {
                print('Receipeces tapped');
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: SizedBox(
                        height: maxHeight * 0.16,
                        width: maxHeight * 0.16,
                        child: Image.network(
                          categoryRecipe.display.categoryImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Container(
                          width: maxHeight * 0.16,
                          color: Colors.black.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              categoryRecipe.display.displayName.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppFonts.montserrat.font,
                                  fontWeight: FontWeight.w600,
                                  fontSize: maxHeight * 0.02),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
