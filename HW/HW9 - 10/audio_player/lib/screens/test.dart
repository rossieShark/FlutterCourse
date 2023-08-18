// import 'package:flutter/material.dart';

// class _OtherScreenState extends State<OtherScreen> {
//   late final TextEditingController _textFieldController;
//   late final ScrollController _scrollController;
//   late final FocusNode _focusNode;
//   bool _isTappedTextField = false;

//   @override
//   void initState() {
//     _textFieldController = widget.textFieldController;
//     _scrollController = widget.scrollController;
//     _focusNode = widget.focusNode;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background.color,
//       body: Builder(builder: (context) {
//         return CustomScrollView(controller: _scrollController, slivers: [
//           SliverAppBar(
//             pinned: true,
//             backgroundColor: AppColors.background.color,
//             title: _buildTextField(context),
//           ),
//           _isTappedTextField
//               ? SliverToBoxAdapter(
//                   child: SearchResultlist(
//                       width: MediaQuery.of(context).size.width),
//                 )
//               : _buildRecentlySearchedSection(context),
//         ]);
//       }),
//     );
//   }

//   Widget _buildRecentlySearchedSection(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           //mainAxisSize: MainAxisSize.max,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 'Others',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
            
//             const SizedBox(
//               height: 10,
//             ),
//             CategoriesList()
//           ]),
//     );
//   }

//   Widget _buildTextField(BuildContext context) {
//     return SearchTextField(
//       controller: _textFieldController,
//       focusNode: _focusNode,
//       isTappedTextField: _isTappedTextField,
//       onChanged: (query) {
//         setState(() {
//           _isTappedTextField = query.isNotEmpty;
//         });
//       },
//     );
//   }
// }
