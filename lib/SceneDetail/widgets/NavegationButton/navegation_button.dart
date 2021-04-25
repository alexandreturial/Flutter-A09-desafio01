import 'package:flutter/material.dart';

class NavegationButton extends StatefulWidget {
  final bool isSelect;
  final VoidCallback onTap;
  final String title;
  const NavegationButton({
    Key key, 
    this.isSelect, 
    this.onTap,
    this.title
  }) : super(key: key);

  @override
  _NavegationButtonState createState() => _NavegationButtonState();
}

class _NavegationButtonState extends State<NavegationButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: widget.onTap,
         style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            widget.isSelect ? Colors.blue : Colors.white
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.only(top: 25, left: 25),
          ),  
          minimumSize: MaterialStateProperty.all(
            Size(0, 100),
          )
        ),
        child: Text(
           widget.title,
          style: TextStyle(
            fontSize: 20, 
            color:  widget.isSelect ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}
