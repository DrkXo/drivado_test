import 'package:drivado_test/src/theme/themes.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: DrivadoTheme.appbarBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Icon(
              Icons.tune_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}