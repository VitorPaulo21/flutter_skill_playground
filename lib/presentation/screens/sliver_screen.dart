import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:flutter/material.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  final TextEditingController controller = TextEditingController();
  final List<String> items = List.generate(100, (index) {
    return "SliverList Item #$index";
  });

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> get filteredList => items
      .where(
        (item) =>
            item.toLowerCase().contains(controller.text.toLowerCase().trim()),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Slivers Screen'),
              background: ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: RouteNames.SLIVER_SCREEN.name,
                        child: Image.asset(
                          'assets/sliver.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(height: 65, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  label: Text("Pesquisa"),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Icon(Icons.search),
                  ),
                ),
                onSubmitted: (value) {
                  setState(() {});
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {});
                  }
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
            sliver: SliverList.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  child: ListTile(
                    title: Text(item),
                    subtitle: Text('Parte da SliverList'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
