import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memoir_vault/models/diary_page.dart';
import 'package:memoir_vault/models/months.dart';

class DiaryListBuilder extends StatelessWidget {
  const DiaryListBuilder({super.key, required this.pages});
  final List<DiaryPage> pages;

  @override
  Widget build(context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount: pages.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                label: 'Del',
                icon: Icons.delete,
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color.fromARGB(129, 244, 67, 54),
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) {},
              ),
              SlidableAction(
                flex: 1,
                label: 'Edit',
                icon: Icons.edit,
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color.fromARGB(129, 158, 158, 158),
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) {},
              ),
            ],
          ),
          child: Card(
            color: const Color.fromARGB(170, 249, 169, 169),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title
                      Text(
                        pages[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),

                      const Spacer(),

                      //day
                      Text(
                        pages[index].date.day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),

                      const SizedBox(width: 5),

                      //month
                      Text(
                        GetMonth().getMonthNameShort(pages[index].date.month),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),

                  //body
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .25,
                        child: Expanded(
                          child: Text(
                            pages[index].body,
                            style: const TextStyle(
                              color: Color.fromARGB(178, 255, 255, 255),
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
