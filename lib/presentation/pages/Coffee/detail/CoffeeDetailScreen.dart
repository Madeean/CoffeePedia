import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/presentation/themes/Colors.dart';

class CoffeeDetailScreen extends ConsumerStatefulWidget {
  final CoffeeDomainModel coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  ConsumerState<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends ConsumerState<CoffeeDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        title: Text(
          widget.coffee.title,
          style: const TextStyle(color: CustomColors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        foregroundColor: CustomColors.white,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: widget.coffee.image,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                  ),
                  Text(
                    widget.coffee.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: CustomColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: CustomColors.black,
                    ),
                  ),
                  SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        widget.coffee.ingredients.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "- ${widget.coffee.ingredients[index]}",
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.black,
                            ),
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
      ),
    );
  }
}
