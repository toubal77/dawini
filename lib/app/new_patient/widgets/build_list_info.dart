import 'package:dawini/common_widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BuildListInfo extends StatefulWidget {
  late List<dynamic>? listInfo;

  BuildListInfo({
    Key? key,
    required this.listInfo,
  }) : super(key: key);
  @override
  State<BuildListInfo> createState() => _BuildListInfoState();
}

class _BuildListInfoState extends State<BuildListInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: 150.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listInfo!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: Text(
                    '- ${widget.listInfo![index]}',
                    style: DefaultTextStyle.of(context).style,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.listInfo!.removeWhere(
                          (element) => element == widget.listInfo![index]);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
