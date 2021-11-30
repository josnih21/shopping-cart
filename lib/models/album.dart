class Album {
  final String name;
  final String author;
  final String image;

  Album({
    required this.name,
    required this.author,
    required this.image,
  });

  static List<Album> generateAlbums() {
    return <Album>[
      Album(
        name: "Kill 'Em All",
        author: "Metallica",
        image:
            "https://img.discogs.com/UdAeIM73C4HY5RPB1qxbSKjM11s=/fit-in/596x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-5960693-1410363758-4530.jpeg.jpg",
      ),
      Album(
        name: "Carnaval de Finesse",
        author: "Rowjay",
        image:
            "https://www.spotlyrics.com/images/albums/37/rowjay-carnaval-de-finesse-2-les-chroniques-d-un-jeune-entrepreneur-36487.jpg",
      ),
      Album(
        name: "Davidian",
        author: "Machine Head",
        image: "https://i2.wp.com/www.scienceofnoise.net/wp-content/uploads/2020/12/710K0IpAK0L._SL1000_.jpg",
      ),
      Album(
        name: "LMF",
        author: "Freeze Corleone",
        image: "https://angartwork.akamaized.net/?id=130191197&size=640",
      ),
      Album(
        name: "S/O Flem",
        author: "Django",
        image: "https://m.media-amazon.com/images/I/A15HzGkkzPL._SS500_.jpg",
      ),
      Album(
        name: "Neovalladolor",
        author: "Erik Urano",
        image: "https://f4.bcbits.com/img/a3263150061_10.jpg",
      ),
      Album(
        name: "MILAGRO",
        author: "DELLAFUENTE",
        image: "https://images.genius.com/2450a8eeee6696a1acbfab1fcd8cd428.1000x1000x1.png",
      ),
      Album(
        name: "Versos Perversos",
        author: "Lil Bokeron",
        image: "https://i.scdn.co/image/ab67616d0000b273e0d95abe34aac6430f530137",
      ),
    ];
  }
}
