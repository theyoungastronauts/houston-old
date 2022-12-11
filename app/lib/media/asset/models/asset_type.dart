class MediaType {
  final String type;
  final String subtype;

  MediaType({
    required this.type,
    required this.subtype,
  });

  String get name {
    return "$type/$subtype";
  }

  String get ext {
    if (subtype == 'jpeg') {
      return 'jpg';
    }

    return subtype.toLowerCase();
  }

  factory MediaType.fromName(String name) {
    assert(name.contains("/"));
    final parts = name.split('/');
    assert(parts.length == 2);
    return MediaType(type: parts.first, subtype: parts.last);
  }

  factory MediaType.fromExtension(String ext) {
    if (ext == 'jpg') {
      ext = 'jpeg';
    }

    switch (ext) {
      case "mp3":
      case "wav":
      case "m4a":
        return MediaType(type: "audio", subtype: ext);
      case "jpeg":
      case "png":
      case "gif":
        return MediaType(type: "image", subtype: ext);
      case "mp4":
      case "mov":
        return MediaType(type: "video", subtype: ext);
      default:
        return MediaType.binary();
    }
  }

  factory MediaType.mp3() {
    return MediaType.fromName("audio/mp3");
  }

  factory MediaType.wav() {
    return MediaType.fromName("audio/wav");
  }

  factory MediaType.jpg() {
    return MediaType.fromName("image/jpeg");
  }

  factory MediaType.binary() {
    return MediaType.fromName("application/binary");
  }
}
