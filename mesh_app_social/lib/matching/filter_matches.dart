import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class FilterMatches extends StatefulWidget {

  Function filterFn;

  FilterMatches({@required this.filterFn});

  @override
  _FilterMatchesState createState() => _FilterMatchesState();
}

class _FilterMatchesState extends State<FilterMatches> {

  List<String> tags = [""];
  /// Investor = 0, Founter = 1, Creative/Partner = 2
  List<int> chosenPeople = [0,1,2];
  List<int> removedPeople = [];

  List<Widget> _getTags() {
    List<Widget> widgets = <Widget>[];
    tags.forEach((element) {
      TextEditingController c = TextEditingController();
      c.addListener(() {
        c.value = c.value.copyWith(
            text: c.text,
            selection: TextSelection(
                baseOffset: c.text.length, extentOffset: c.text.length),
            composing: TextRange.empty);
      });
      c.text = element;
      widgets.add(Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '#',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: TextField(
              onChanged: (val) {
                setState(() {
                  tags[tags.indexOf(element)] = val;
                  c.selection = TextSelection.collapsed(offset: val.length);
                });
              },
              controller: c,
              cursorColor: Colors.white,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  tags.remove(element);
                });
              }),
        ],
      ));
    });
    return widgets;
  }

  List<Widget> _getPersons() {
    List<Widget> widgets = <Widget>[];
    chosenPeople.forEach((element) {
      String s = '';
      if(element == 0) {
        s = 'Investoren';
      } else if(element == 1) {
        s = 'Gründer';
      } else {
        s = 'Partner';
      }
      widgets.add(Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '@ ' + s,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          chosenPeople.length <= 1 ? Center() : IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  removedPeople.add(element);
                  chosenPeople.remove(element);
                });
              }),
        ],
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height * 0.6,
      border: 1,
      blur: 10,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.transparent.withOpacity(0.1),
          Colors.transparent.withOpacity(0.2),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color(0xFFFFFFFF).withOpacity(0.5),
        ],
      ),
      borderRadius: 24,
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Filter",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getTags(),
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      tags.add("");
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(25)),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getPersons(),
              ),
              removedPeople.length == 0 ? Center() : Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      chosenPeople.add(removedPeople[0]);
                      removedPeople.removeAt(0);
                    });
                  },
                ),
              ),

              // TO TAKE WHOLE WIDTH
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                ],
              ),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Text(
                      "Zurück",
                      style:
                      TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      "Filtern",
                      style:
                      TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      String args;
                      if((tags.isEmpty || tags[0] == '') && removedPeople.isEmpty) {
                        // do nothing
                        widget.filterFn(args);
                        return;
                      } else {
                        args = '';
                        List<String> tagsCopy = List.from(tags);
                        tagsCopy.removeWhere((element) => element == '');
                        if(tagsCopy.isNotEmpty) {
                          args = args + 'Tags:[';
                          tagsCopy.forEach((i) {
                            args = args + '"' + i + '",';
                          });
                          args = args.substring(0,args.length-1) + ']';
                        }
                        if(removedPeople.isNotEmpty) {
                          if(args != '') {
                            args = args + '&';
                          }
                          args = args + 'type:' + chosenPeople[0].toString();
                        }
                        widget.filterFn(args);
                      }

                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
