import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuttle_9ja/cubit/book_cubit.dart';
import 'package:shuttle_9ja/global_widget/custom_button.dart';
import 'package:shuttle_9ja/global_widget/textfield.dart';
import 'package:shuttle_9ja/settings/constants.dart';
import 'package:user_repository/src/models/model.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats({super.key, required this.trip, required this.index});
  final Trip trip;
  final int index;
  @override
  State<SelectSeats> createState() => _SelectSeatsState();
}

class _SelectSeatsState extends State<SelectSeats> {
  final TextEditingController _qController = TextEditingController();
  final TextEditingController _uController = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _qController.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      // icon: Icon(Icons.access_alarm),
      title: Text("Book Seats"),
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -30,
            top: -90,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Constants.white,
                child: Icon(
                  Icons.close,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            width: MediaQuery.sizeOf(context).width * .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No of Seats:",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomTextField(
                            controller: _qController,
                            keyboardType: TextInputType.number,
                            hintText: "20",
                            onChange: () {
                              setState(() {});
                            },
                            prefix: IconButton(
                              onPressed: () {
                                int pints = int.parse(_qController.text);
                                if (pints != 0) pints = --pints;
                                _qController.text = pints.toString();
                                setState(() {});
                              },
                              icon: Icon(Icons.remove),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                int pints = int.parse(_qController.text);
                                pints = ++pints;
                                _qController.text = pints.toString();
                                setState(() {});
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomButton(
                  loading: loading,
                  onTap: () async {
                    context.read<BookCubit>().bookTrip(widget.trip.bookData(
                        busIndex: widget.index,
                        seats: int.parse(_qController.text)));
                    Navigator.pop(context);
                  },
                  title: "Book Trip",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
