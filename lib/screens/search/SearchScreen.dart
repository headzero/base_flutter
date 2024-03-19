import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/repositories/SearchRepository.dart';
import 'package:base_flutter/screens/widgets/WidgetForList.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  SearchRepository repository = SearchRepository();
  List<Post> recentPosts = List.empty();

  @override
  void initState() {
    repository.fetchDataByQuery("").then((resultData) => setState(() {
          recentPosts = resultData;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        title: const Text("Search"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(),
                        hintText: 'Search Post',
                      ),
                      onSubmitted: (String value) {
                        repository
                            .fetchDataByQuery(value)
                            .then((result) => setState(() {
                                  recentPosts = result;
                                }));
                      },
                    ),
                  ))),
          SliverToBoxAdapter(
            child: categoryFilterWidget(),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2칸짜리 그리드
              childAspectRatio: 1, // 그리드 아이템의 비율
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Post postItem = recentPosts[index];
                return postCardWidget(postItem);
              },
              childCount: recentPosts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryFilterWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Category1"),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Category2"),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Category3"),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Category4"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
