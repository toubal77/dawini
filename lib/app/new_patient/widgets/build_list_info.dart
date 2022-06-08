import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildListInfo extends StatefulWidget {
  late List<String>? listInfo;

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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listInfo!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    text: '- ${widget.listInfo![index]} ...',
                    style: DefaultTextStyle.of(context).style,
                  ),
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
    );
  }
}
