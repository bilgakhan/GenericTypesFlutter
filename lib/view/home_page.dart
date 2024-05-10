import 'package:app1/core/config/network_config.dart';
import 'package:app1/model/aloqa_model.dart';
import 'package:app1/service/currency_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Valyuta Kursi"),
      ),
      body: FutureBuilder(
        future: CurrencyService.getAloqaCurrency(),
        builder: (context, AsyncSnapshot<NetworkResponseConfig> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.data is NetworkErrorResponse) {
            return Center(
              child: Text(
                (snapshot.error as NetworkErrorResponse).error.toString(),
              ),
            );
          } else if (snapshot.data is NetworkExceptionResponse) {
            return Center(
              child: Text(
                (snapshot.data as NetworkExceptionResponse)
                    .messageForUser
                    .toString(),
              ),
            );
          } else {
            List<AloqaModel> data =
                (snapshot.data as NetworkSuccessResponse).model;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index].g3.toString()),
                    trailing: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Text>[
                        Text("Olish: ${data[index].g4} so'm"),
                        Text("Sotish: ${data[index].g5} so'm"),
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
