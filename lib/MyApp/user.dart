class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as int?,
  name: json['name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  phone: json['phone'] as String?,
  website: json['website'] as String?,
  company: json['company'] == null
      ? null
      : Company.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'address': instance.address,
  'phone': instance.phone,
  'website': instance.website,
  'company': instance.company,
};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  street: json['street'] as String?,
  suite: json['suite'] as String?,
  city: json['city'] as String?,
  zipcode: json['zipcode'] as String?,
  geo: json['geo'] == null
      ? null
      : Geo.fromJson(json['geo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'street': instance.street,
  'suite': instance.suite,
  'city': instance.city,
  'zipcode': instance.zipcode,
  'geo': instance.geo,
};

Geo _$GeoFromJson(Map<String, dynamic> json) => Geo(
  lat: json['lat'] as String?,
  lng: json['lng'] as String?,
);

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  name: json['name'] as String?,
  catchPhrase: json['catchPhrase'] as String?,
  bs: json['bs'] as String?,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'name': instance.name,
  'catchPhrase': instance.catchPhrase,
  'bs': instance.bs,
};
