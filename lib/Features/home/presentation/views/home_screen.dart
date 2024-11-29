import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:media_design_expert_task/Features/home/presentation/cubit/cubit/item_cubit.dart';
import 'package:media_design_expert_task/core/constant/app_sized.dart';
import 'package:media_design_expert_task/core/utils/app_images.dart';
import 'package:media_design_expert_task/di.dart';
import '../widgets/custom_note_book_pinter.dart';
import '../widgets/custom_row_order_text.dart';
import '../widgets/custom_two_icon_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(getIt())..getItem(),
      child: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          final cubit = context.read<ItemCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppImages.menu),
                        Image.asset(AppImages.logo),
                        width(10)
                      ],
                    ),
                    Visibility(
                        visible: cubit.filter.isNotEmpty,
                        child: const CustomTwoIconButtons()),
                    height(16),
                    const CustomRowOrderText(),
                    height(MediaQuery.sizeOf(context).height * 0.1),
                    CustomPaint(
                      painter: NotebookPainter(),
                      child: Column(
                        children: [
                          for (int i = 0; i < 10; i++)
                            Autocomplete(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  setState(() {});
                                  log("Empty List  ${const Iterable<String>.empty()}");

                                  return const Iterable<String>.empty();
                                }
                                log("List ${cubit.item.where((String option) {
                                  return option.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                })}");
                                cubit.filter =
                                    cubit.item.where((String option) {
                                  return option.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                }).toList();
                                setState(() {});
                                return cubit.filter;
                              },
                              fieldViewBuilder: (
                                BuildContext context,
                                TextEditingController textEditingController,
                                FocusNode focusNode,
                                VoidCallback onFieldSubmitted,
                              ) {
                                return TextField(
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                );
                              },
                              onSelected: (String selection) {
                                log('Selected: $selection');
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
