import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildImagerieList extends StatefulWidget {
  final List<dynamic>? imagerie;
  const BuildImagerieList({Key? key, required this.imagerie}) : super(key: key);

  @override
  State<BuildImagerieList> createState() => _BuildImagerieListState();
}

class _BuildImagerieListState extends State<BuildImagerieList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.imagerie!.length,
      itemBuilder: (context, index) {
        bool isDate = false;
        switch (widget.imagerie![index]['imagerieDate'].runtimeType) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text:
                                '-typeImagerie: ${widget.imagerie![index]['typeImagerie']} ',
                            style: DefaultTextStyle.of(context).style,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: isDate
                                ? '-imagerieDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(widget.imagerie![index]['imagerieDate'].toString()))} '
                                : '-imagerieDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(widget.imagerie![index]['imagerieDate'].toDate().toString()))} ',
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
                      for (int i = 0;
                          i < widget.imagerie![index]['imagerie'].length;
                          i++)
                        SizedBox(
                          child: Text(
                            '     -${widget.imagerie![index]['imagerie'][i]} ',
                            style: DefaultTextStyle.of(context).style,
                            maxLines: 10,
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.imagerie!.removeWhere(
                          (element) => element == widget.imagerie![index]);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
