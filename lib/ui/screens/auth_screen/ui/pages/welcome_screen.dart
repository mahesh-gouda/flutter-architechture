
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:styra_poc/ui/theme/theme_const.dart';

import '../../bloc/login_cubit.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key,}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController =  TextEditingController();
  final TextEditingController _passWordController =  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  loginToEvent(BuildContext context, String userName, String password, int eventId) async {
    await BlocProvider.of<LoginCubit>(context).loginToEvent(userName, password, eventId);
  }

  @override
  void dispose() {
    _passWordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginFailed){
      Fluttertoast.showToast(msg: state.message);
    }

  },
  builder: (context, state) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryColor,

          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).colorScheme.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 40.sp
                  ),
                ),

                SizedBox(
                  height: 100.h,
                ),

                ElevatedButton(
                  child: Text("Sign Up",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).colorScheme.primaryColor,
                    ),),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Theme.of(context).colorScheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                      padding: EdgeInsets.symmetric(horizontal: width*0.3,vertical: 15.h )

                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                OutlinedButton(
                  onPressed: () {},
                  child: Text('Login',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.white,
                    ),),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.white,
                    side: BorderSide(
                      color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(horizontal: width*0.3,vertical: 15.h )

                  ),
                ),


              ],
            ),
          ),

        ));
  },
);
  }
}
