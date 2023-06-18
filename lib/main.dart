import 'package:flutter/material.dart';

void main()
{
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'GPA Calculator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation="";
  String result="0";
  String expression="";

  double EqFS=38.0;
  double RzFS=48.0;
  ButtonPressed(String ButtonT)
  {
    setState(() {
      if(ButtonT=="C")
      {
        equation="";
        result="0";
        EqFS=38.0;
        RzFS=48.0;
      }
      else if (ButtonT =="⌫")
      {
        EqFS=48.0;
        RzFS=38.0;
        equation =equation.substring(0,equation.length-1);
        if(equation =="")
        {
          equation = "";
        }
      }
      else if (ButtonT =="=")
      {
        EqFS=38.0;
        RzFS=48.0;
        double Num= double.parse(equation);

        if(Num > 4){
          Num = 0;
        }
        else if(Num >=3.63)
          {
            Num= (Num-0.3)/0.037 ;
          }
        else if (Num >=3.25)
          {
            Num= (Num-0.29)/0.0037;
          }
        else if (Num >=2.88)
        {
          Num =(Num-0.36)/0.036;
        }
        else if (Num >=2.5)
        {
          Num =(Num-0.28)/0.037;
        }
        else if (Num >=1.8)
        {
          Num =(Num-1.65)/0.069;
        }
        else if (Num >=1)
        {
          Num =(Num+2.16)/0.079;
        }
        else if (Num >0)
        {
          Num =(Num/0.0248);
        }

        String Str = Num.toString();
        result= Str;
      }
      else {
        EqFS=48.0;
        RzFS=38.0;
        if(equation ==0)
        {
          equation = ButtonT;
        }
        equation=equation + ButtonT;
      }
    });
  }
  Widget buildButton(String buttonText, double ButtonHeight, Color buttonColor ){
    return Container(
      height:MediaQuery.of(context).size.height*.10*ButtonHeight,
      color:buttonColor,
      child: TextButton(
        style:TextButton.styleFrom(shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.black,
            width:1,
            style: BorderStyle.solid,
          ),
        ),
          padding:EdgeInsets.all(14),
        ),

        onPressed: () => ButtonPressed(buttonText),
        child: Text(
          buttonText,style:TextStyle(
            fontSize: 30, fontWeight: FontWeight.normal, color:Colors.white),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Calculator'),centerTitle:true,),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: EqFS),),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(result, style: TextStyle(fontSize: RzFS),),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*.75,
                child:Table(
                  children:[
                    TableRow(
                      children:[
                        buildButton("C",1.0,Colors.blue),
                        buildButton("",1.0,Colors.blue),
                        buildButton("⌫",1.0,Colors.red),
                      ],
                    ),
                    TableRow(
                      children:[
                        buildButton("7",1.0,Colors.black54),
                        buildButton("8",1.0,Colors.black54),
                        buildButton("9",1.0,Colors.black54),
                      ],
                    ),
                    TableRow(
                      children:[
                        buildButton("4",1.0,Colors.black54),
                        buildButton("5",1.0,Colors.black54),
                        buildButton("6",1.0,Colors.black54),
                      ],
                    ),

                    TableRow(
                      children:[
                        buildButton("1",1.0,Colors.black54),
                        buildButton("2",1.0,Colors.black54),
                        buildButton("3",1.0,Colors.black54),
                      ],
                    ),

                    TableRow(
                      children:[
                        buildButton(".",1.0,Colors.black54),
                        buildButton("",1.0,Colors.black54),
                        buildButton("0",1.0,Colors.black54),

                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width:MediaQuery.of(context).size.height*.10,
                child: Table(
                  children:
                  [
                    TableRow
                      (
                        children:
                        [
                          buildButton("=",5.0,Colors.purpleAccent),
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

