import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawini/common_widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildConsigneList extends StatefulWidget {
  final List<dynamic>? consigne;
  const BuildConsigneList({Key? key, required this.consigne}) : super(key: key);

  @override
  State<BuildConsigneList> createState() => _BuildConsigneListState();
}

class _BuildConsigneListState extends State<BuildConsigneList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.consigne!.length,
      itemBuilder: (context, index) {
        bool isDate = false;
        switch (widget.consigne![index]['consigneDate'].runtimeType) {
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
                            text: isDate
                                ? '-consigneDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(widget.consigne![index]['consigneDate'].toString()))} '
                                : '-consigneDate: ${DateFormat('dd-MMM-yyy').format(DateTime.parse(widget.consigne![index]['consigneDate'].toDate().toString()))} ',
                            style: DefaultTextStyle.of(context).style,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: '-Consigne du jour est: ',
                            style: DefaultTextStyle.of(context).style,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          '     -${widget.consigne![index]['consigne']} ',
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
                      widget.consigne!.removeWhere(
                          (element) => element == widget.consigne![index]);
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
