import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/apps/utils/const.dart';
import 'package:weather/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});

  final List<WeatherDetail> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: ((context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt_txt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:mm').format(dateTime);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(listData[index].main.temp, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          listData[index].weather.main,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      formatDay,
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatTime,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: Image.asset(
                  AssetCustom.getLinkImg(listData[index].weather.main),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      }),
      separatorBuilder: (context, _) => const SizedBox(height: 15),
      itemCount: 20,
    );
  }
}
