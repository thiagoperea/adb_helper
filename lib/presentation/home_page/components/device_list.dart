import 'dart:math';

import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * TODO: I need to see if it is loading
     */
    var isLoading = Random().nextBool();

    if (isLoading) {
      return const Align(
        alignment: Alignment.centerRight,
        child: CircularProgressIndicator(),
      );
    }

    /**
     * TODO: Here I need to listen to device list changes
     * */
    // List<String> deviceListMock = [];
    // List<String> deviceListMock = ["12fd0945"];
    List<String> deviceListMock = ["12fd0945", "523de5f00"];

    Widget deviceState;

    if (deviceListMock.isEmpty) {
      deviceState = const _DeviceListEmpty();
    } else if (deviceListMock.length == 1) {
      deviceState = _DeviceSingle(serial: deviceListMock.first);
    } else {
      deviceState = _DeviceList(deviceList: deviceListMock);
    }

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            deviceState,
            const SizedBox(width: 16.0),
            IconButton(
              onPressed: () {
                print("CALL ADB DEVICES AND REFRESH HERE"); //TODO:
              },
              icon: const Icon(Icons.refresh),
              tooltip: "Refresh devices",
            )
          ],
        ),
      ],
    );
  }
}

class _DeviceList extends StatefulWidget {
  final List<String> deviceList;

  const _DeviceList({
    Key? key,
    required this.deviceList,
  }) : super(key: key);

  @override
  State<_DeviceList> createState() => _DeviceListState();
}

class _DeviceListState extends State<_DeviceList> {
  var selectedValue = "";

  @override
  void initState() {
    selectedValue = widget.deviceList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Select your device:"),
        SizedBox(width: 8.0),
        DropdownButton(
          value: selectedValue,
          items: widget.deviceList.map((String device) {
            return DropdownMenuItem(
              value: device,
              child: Text(device),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              // TODO: THIS SHOULD BE A STLESS WIDGET AND COMMUNICATING WITH A PROVIDER
              selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}

class _DeviceListEmpty extends StatelessWidget {
  const _DeviceListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "No device found!",
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class _DeviceSingle extends StatelessWidget {
  final String serial;

  const _DeviceSingle({
    Key? key,
    required this.serial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Device $serial selected!",
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
