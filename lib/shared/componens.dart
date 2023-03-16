import 'package:flutter/material.dart';

Widget textFormField({
  required Widget widget,
  required String labelText,
  String? hintText,
  required TextInputType keyboardType,
  required bool obscureText,
  Color? color,
  bool? areFill,
  required TextEditingController controller,
  required String textValidator
})
{
  return TextFormField(
    decoration: InputDecoration(
        suffixIcon: widget,
        labelText: labelText,
        labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color:Colors.black.withOpacity(0.4)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      fillColor: color,
      filled: areFill,
    ),
    keyboardType: keyboardType,
    obscureText: obscureText,
    textAlign: TextAlign.center,
    controller: controller,
    style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color:Colors.black
    ),
    validator:(value){
      if(value!.isEmpty)
        {
          return textValidator;
        }
      return null;
    }
  );
}


Widget materialButton({
  required String text,
  IconData? icon,
  required double width,
  required Function function,

})
{
  return Container(
    width: width,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),
    child: MaterialButton(
      color: Colors.indigoAccent,
    padding: EdgeInsets.only(right: 5),
    onPressed: function(),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Icon(icon,size: 30,color: Colors.white,),
    Text(text,style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white
    ),)
    ],
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),

),
      splashColor: Colors.white,
),
  );
}




Widget textButton({
  required String text,
  required Widget screen,
  required BuildContext context,

})
{
  return TextButton(
    onPressed: (){
      pushAndRemove(context,screen);
    },
      child:  Text(
        text,
        style:const  TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),

  );

}

Widget text({
  required String text,
  double? font,
  Color color=Colors.white
})
{
  return Text(
    text,style:  TextStyle(
      fontSize: font,
      fontWeight: FontWeight.bold,
      color: color,
  ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}




Future pushAndRemove(BuildContext context,Widget screen)async
{
  return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=>screen,
      ),
          (route) => false);
}

BoxDecoration decorOfContainer(){
  return const BoxDecoration(
      borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
      gradient: LinearGradient(
          colors: [
            Color.fromRGBO(102, 22, 178, 0.7),
            Color.fromRGBO(125, 210, 146 , 1),
            Color.fromRGBO(102, 22, 178, 0.7),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
      ),
      boxShadow: [
        BoxShadow(
            color:Colors.white,
            offset: Offset(-20,15)
        ),
        BoxShadow(
            color:Colors.black,
            offset: Offset(-15,15),blurRadius: 18
        )
      ]
  );
}

BoxDecoration decorOfMainContainer()
{
  return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color.fromRGBO(102, 22, 178, 0.7),
            Color.fromRGBO(125, 210, 146 , 1),
            Color.fromRGBO(102, 22, 178, 0.7),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
      ),
      boxShadow: [
        BoxShadow(
            color:Color.fromRGBO(125, 210, 146 , 1),
            offset: Offset(-15,15),
            blurRadius: 18
        ),
        BoxShadow(
            color:Color.fromRGBO(125, 210, 146 , 1),
            offset: Offset(15,-15),
            blurRadius: 18
        )
      ]
  );
}