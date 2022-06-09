import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildImagerieList extends StatelessWidget {
  final List<dynamic>? imagerie;
  const BuildImagerieList({Key? key, required this.imagerie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: imagerie!.length,
      itemBuilder: (context, index) {
        bool isDate = false;
        switch (imagerie![index]['imagerieDate'].runtimeType) {
          case DateTime:
            {
              isDate = true;
              break;
            }
          case Timestamp:
            {
              isDate = false;
              break;
            }
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text:
                          '-typeImagerie: ${imagerie![index]['typeImagerie']} ',
                      style: DefaultTextStyle.of(context).style,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: isDate
                          ? '-imagerieDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(imagerie![index]['imagerieDate'].toString()))} '
                          : '-imagerieDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(imagerie![index]['imagerieDate'].toDate().toString()))} ',
                      style: DefaultTextStyle.of(context).style,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: '-Conclusion: ',
                      style: DefaultTextStyle.of(context).style,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                for (int i = 0; i < imagerie![index]['imagerie'].length; i++)
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: '     -${imagerie![index]['imagerie'][i]} ',
                        style: DefaultTextStyle.of(context).style,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const SizedBox(height: 5),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
