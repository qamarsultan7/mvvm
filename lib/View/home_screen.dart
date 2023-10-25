import 'package:flutter/material.dart';
import 'package:mvvm/Data/Response/status.dart';
import 'package:mvvm/Model/movies_model.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/View%20Model/auth_usermodel.dart';
import 'package:mvvm/View%20Model/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeviewModel homeviewModel = HomeviewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeviewModel.fetchmovielist();
    super.initState();
  }

  Widget build(BuildContext context) {
    // final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Screen'),
          actions: [
            Center(
                child: GestureDetector(
                    onTap: () {
                      // userViewModel.remove().then((value) {
                      //   Navigator.pushNamed(context, RouteNames.logIn);
                      // });
                    },
                    child: const Text('Log Out'))),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: ChangeNotifierProvider<HomeviewModel>(
          create: (BuildContext context) => homeviewModel,
          child: Consumer<HomeviewModel>(builder: (context, value, _) {
            switch (value.movielist.status) {
              case Status.LOADING:
                return const Center(child:  CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.movielist.message.toString()));
              case Status.COMPLETE:
                return ListView.builder(
                    itemCount: value.movielist.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(value.movielist.data!.movies![index].title
                                .toString()),
                            Text(value.movielist.data!.movies![index].genres
                                .toString()),
                            Text(value.movielist.data!.movies![index].duration
                                .toString()),
                            Text(value.movielist.data!.movies![index].year
                                .toString()),
                            Text(Utils.averagerating(value.movielist.data!.movies![index].ratings!).toString())
                          ],
                        ),
                      );
                    });
              default:
            }
            return Container();
          }),
        ));
  }
}
