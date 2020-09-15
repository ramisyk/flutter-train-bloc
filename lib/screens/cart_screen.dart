import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{//stream gerekli yapıları build edeceği için stateless uygunl olur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshoot){
          return buildCart(snapshoot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot<dynamic> snapshoot) {
    return ListView.builder(
        itemCount: snapshoot.data.length,
        itemBuilder: (BuildContext context, index){
          final cart = snapshoot.data;
          return ListTile(
            title: Text(cart[index].product.name),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: (){
                cartBloc.removeFromCart(cart[index]);
              },
            ),
          );
        });
  }
}