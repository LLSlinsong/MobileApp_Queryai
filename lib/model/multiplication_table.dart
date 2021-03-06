import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_head.dart';
import 'table_body.dart';

class MultiplicationTable extends StatefulWidget {
  
final List<List<dynamic>> input;
  MultiplicationTable({
    
    @required this.input,
  });


  @override
  _MultiplicationTableState createState() => _MultiplicationTableState(input: input);
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  final List<List<dynamic>> input;
  _MultiplicationTableState({
    
    @required this.input,
  });
  LinkedScrollControllerGroup _controllers;
  ScrollController _headController;
  ScrollController _bodyController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHead(
          scrollController: _headController,
          input: input,
        ),
        Expanded(
          child: TableBody(
            scrollController: _bodyController,
            input: input,
          ),
        ),
      ],
    );
  }
}
