import 'dart:convert';

List<BeersListClass> breweryModelFromJson(String str) =>
    List<BeersListClass>.from(
        json.decode(str).map((x) => BeersListClass.fromJson(x)));

class BeersListClass {
  int? id;
  String? name;
  String? tagLine;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  int? ibu;
  int? targetFg;
  int? targetOg;
  int? ebc;
  int? srm;
  double? ph;
  int? attenuationLevel;
  VolumeClass? volume;
  BoilVolumeClass? boilVolume;
  MethodClass? method;
  Ingredients? ingredients;
  List? foodPairing;
  String? brewersTips;
  String? contributedBy;

  BeersListClass({
    required this.id,
    required this.name,
    required this.tagLine,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    required this.ibu,
    required this.targetFg,
    required this.targetOg,
    required this.ebc,
    required this.srm,
    required this.ph,
    required this.attenuationLevel,
    required this.volume,
    required this.boilVolume,
    required this.method,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
    required this.contributedBy,
  });
  BeersListClass.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    tagLine = json["tagline"];
    firstBrewed = json["first_brewed"];
    description = json["description"];
    imageUrl = json["image_url"];
    abv = double.parse(json["abv"].toString());
    ibu = int.tryParse(json["ibu"].toString());
    targetFg = int.tryParse(json["target_fg"].toString());
    targetOg = int.tryParse(json["target_og"].toString());
    ebc = int.tryParse(json["ebc"].toString());
    srm = int.tryParse(json["srm"].toString());
    ph = double.tryParse(json["ph"].toString());
    attenuationLevel = int.tryParse(json["attenuation_level"].toString());

    volume = VolumeClass.fromJson(json["volume"]);

    boilVolume = BoilVolumeClass.fromJson(json["boil_volume"]);

    method = MethodClass.fromJson(json["method"]);

    ingredients = Ingredients.fromJson(json["ingredients"]);

    foodPairing = json["food_pairing"];
    brewersTips = json["brewers_tips"];
    contributedBy = json["contributed_by"];
  }
}

//^ volume class
class VolumeClass {
  int? value;
  String? unit;

  VolumeClass({
    required this.value,
    required this.unit,
  });

  VolumeClass.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    unit = json["unit"];
  }
}

//^ Boli volume class
class BoilVolumeClass {
  int? value;
  String? unit;

  BoilVolumeClass({
    required this.value,
    required this.unit,
  });

  BoilVolumeClass.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    unit = json["unit"];
  }
}

//^ method classes
class MethodClass {
  List<MashTemp>? mashTemp;
  Fermentation? fermentation;
  Null? twist;

  MethodClass({
    required this.mashTemp,
    required this.fermentation,
    required this.twist,
  });

  MethodClass.fromJson(Map<String, dynamic> json) {
    // list
    if (json["mash_temp"] != null) {
      mashTemp = <MashTemp>[];

      json["mash_temp"].forEach((f) {
        mashTemp?.add(MashTemp.fromJson(f));
      });
    }

    fermentation = Fermentation.fromJson(json["fermentation"]);
  }
}

// MashTemp
class MashTemp {
  Temp? temp;
  int? duration;

  MashTemp({
    required this.temp,
    required this.duration,
  });

  MashTemp.fromJson(Map<String, dynamic> json) {
    temp = Temp.fromJson(json["temp"]);
    duration = json["duration"];
  }
}

// temp of mash_temp
class Temp {
  int? value;
  String? unit;

  Temp({
    required this.value,
    required this.unit,
  });

  Temp.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    unit = json["unit"];
  }
}

// Fermentation
class Fermentation {
  TempF? tempf;

  Fermentation({required this.tempf});

  Fermentation.fromJson(Map<String, dynamic> json) {
    tempf = TempF.fromJson(json["temp"]);
  }
}

// temp of Fermentation
class TempF {
  int? value;
  String? unit;

  TempF({
    required this.value,
    required this.unit,
  });

  TempF.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    unit = json["unit"];
  }
}

//^ Ingredients class
class Ingredients {
  List<Malt>? malt;
  List<Hops>? hops;
  String? yeast;

  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  Ingredients.fromJson(Map<String, dynamic> json) {
    //list
    if (json["malt"] != null) {
      malt = <Malt>[];

      json["malt"].forEach((m) {
        malt?.add(Malt.fromJson(m));
      });
    }

    //list
    if (json["hops"] != null) {
      hops = <Hops>[];

      json["hops"].forEach((h) {
        hops?.add(Hops.fromJson(h));
      });
    }

    yeast = json["yeast"];
  }
}

//malt class
class Malt {
  String? name;
  Amount? amount;
  Malt({
    required this.name,
    required this.amount,
  });

  Malt.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    amount = Amount.fromJson(json["amount"]);
  }
}

class Amount {
  double? value;
  String? unit;

  Amount({
    required this.value,
    required this.unit,
  });

  Amount.fromJson(Map<String, dynamic> json) {
    // value = json["value"];
    unit = json["unit"];
  }
}

//hops class
class Hops {
  String? name;
  AmountH? amounth;
  String? add;
  String? attribute;

  Hops({
    required this.name,
    required this.amounth,
    required this.add,
    required this.attribute,
  });

  Hops.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    amounth = AmountH.fromJson(json["amount"]);
    add = json["add"];
    attribute = json["attribute"];
  }
}

class AmountH {
  double? value;
  String? unit;

  AmountH({
    required this.value,
    required this.unit,
  });

  AmountH.fromJson(Map<String, dynamic> json) {
    value = double.parse(json["value"].toString());
    unit = json["unit"];
  }
}
