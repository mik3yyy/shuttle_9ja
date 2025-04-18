class Bus {
  final String id;
  final String transcoId;
  final String model;
  final String licenseNumber;
  final int capacity;
  final int assignedNumberOfSeats;
  final int bookedSeats;
  final String image;

  Bus(
      {required this.id,
      required this.transcoId,
      required this.model,
      required this.licenseNumber,
      required this.capacity,
      required this.assignedNumberOfSeats,
      required this.bookedSeats,
      required this.image});

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
        id: json['_id'],
        transcoId: json['transco_id'],
        model: json['model'],
        licenseNumber: json['license_number'],
        capacity: json['capacity'],
        assignedNumberOfSeats: json['assigned_no_of_seats'],
        bookedSeats: json['booked_seats'],
        image: json['image']);
  }
  @override
  String toString() {
    return 'Bus{id: $id, transcoId: $transcoId, model: $model, licenseNumber: $licenseNumber, capacity: $capacity, assignedNumberOfSeats: $assignedNumberOfSeats, bookedSeats: $bookedSeats, image: $image}';
  }
}
