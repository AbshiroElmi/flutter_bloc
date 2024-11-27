import 'package:cloud_firestore/cloud_firestore.dart';

class  HomeState{
  HomeState({
    this.index =0
  });
  final index;

  HomeState copywith({int? index}){
    return HomeState(
       index:index??this.index
    );
  }
}