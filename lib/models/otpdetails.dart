class Otpdetails {
  Otpdetails({
      this.status, 
      this.message, 
      this.otp,});

  Otpdetails.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    otp = json['OTP'];
  }
  num? status;
  String? message;
  String? otp;
Otpdetails copyWith({  num? status,
  String? message,
  String? otp,
}) => Otpdetails(  status: status ?? this.status,
  message: message ?? this.message,
  otp: otp ?? this.otp,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    map['OTP'] = otp;
    return map;
  }

}