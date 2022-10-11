class Story {
  final String name;
  final String image;
  final int number;
  final List<StoryModel> stories;
  Story(
      {required this.name,
      required this.image,
      required this.number,
      required this.stories});
}

List<Story> storyList = [
  Story(
      name: "Abel Cassinda",
      image:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/261499639_3045673165673451_9191703099093231326_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFbALzKqg6EEsRd2mG17ws4KOQRgD2Uqa8o5BGAPZSpr17ZmSz7iddbjmJK1ucamMgx8qXxSBabhgNczaSEFK8i&_nc_ohc=8gWPOgJAbOIAX8XY9NH&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b064875f60179b3af3bc6284eaf4640c&oe=61B0A585',
      number: 2,
      stories: [
        StoryModel(
            'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/261499639_3045673165673451_9191703099093231326_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFbALzKqg6EEsRd2mG17ws4KOQRgD2Uqa8o5BGAPZSpr17ZmSz7iddbjmJK1ucamMgx8qXxSBabhgNczaSEFK8i&_nc_ohc=8gWPOgJAbOIAX8XY9NH&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b064875f60179b3af3bc6284eaf4640c&oe=61B0A585'),
        StoryModel(
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/261499639_3045673165673451_9191703099093231326_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFbALzKqg6EEsRd2mG17ws4KOQRgD2Uqa8o5BGAPZSpr17ZmSz7iddbjmJK1ucamMgx8qXxSBabhgNczaSEFK8i&_nc_ohc=8gWPOgJAbOIAX8XY9NH&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b064875f60179b3af3bc6284eaf4640c&oe=61B0A585',
        ),
      ]),
  Story(
      name: "Nelton Metana",
      image:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
      number: 3,
      stories: [
        StoryModel(
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
        ),
        StoryModel(
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
        ),
        StoryModel(
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
        )
      ]),
  Story(
      name: "Tanilton Fernandes",
      image:
          "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B",
      number: 5,
      stories: [
        StoryModel(
            "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B"),
        StoryModel(
            "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B"),
        StoryModel(
            "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B"),
        StoryModel(
            "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B"),
        StoryModel(
            "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B")
      ]),
  Story(
      name: "Manas",
      image: "http://lorempixel.com/200/200/people/3",
      number: 2,
      stories: [
        StoryModel("http://lorempixel.com/200/400/people"),
        StoryModel("http://lorempixel.com/200/400/nature")
      ]),
  Story(
      name: "Prajjwal",
      image: "http://lorempixel.com/200/200/people/4",
      number: 1,
      stories: [
        StoryModel("http://lorempixel.com/200/400/people"),
      ])
];

class Post {
  final String name;
  final String profile;
  final String time;
  final String title;
  final String image;
  final int like;
  final bool likeStatus;
  final int comment;

  Post(
      {required this.name,
      required this.profile,
      required this.time,
      required this.title,
      required this.image,
      required this.like,
      this.likeStatus = false,
      required this.comment});
}

List<Post> postList = [
  Post(
      name: "Abel Cassinda",
      profile:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/261499639_3045673165673451_9191703099093231326_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFbALzKqg6EEsRd2mG17ws4KOQRgD2Uqa8o5BGAPZSpr17ZmSz7iddbjmJK1ucamMgx8qXxSBabhgNczaSEFK8i&_nc_ohc=8gWPOgJAbOIAX8XY9NH&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b064875f60179b3af3bc6284eaf4640c&oe=61B0A585',
      time: "08:16 pm",
      title:
          "Fazer tapenade caseiro é muito simples! Comece picando as azeitonas com a ajuda de uma faca. Não precisa picar muito finamente, pode deixar a azeitona bem rústica mesmo.",
      image:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.18169-9/fr/cp0/e15/q65/15078732_1709007936083137_8046008593886327223_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFgfbhBt9gcPVd0YT6fulzH1eJnSDLzPibV4mdIMvM-JrsVynPGbV-Nx-y6Y3r5RT8yEp0cAxoZBMGk9QDhLBGl&_nc_ohc=xgtGApUealIAX_VWVj9&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=5dfbac41537842a5ec0a7fd762d34c45&oe=61C7808A',
      like: 1341,
      likeStatus: true,
      comment: 76),
  Post(
      name: "Nelton Metana",
      profile:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
      time: "09:26 pm",
      title:
          "Fazer diferença, faz parte do mundo, então viva como se fosse o ultimo dia da sua vida.",
      image:
          'https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/263151972_916551775731690_1351089294733894922_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeFM9T0tYEwj3DPvOmMEf_j6VRTYEKIy07tVFNgQojLTu_pQO6Djd5yVbYotiM0K783D-DKH_PSa4Gr6VbV8FJ7o&_nc_ohc=vuYR1gL1vukAX9ZpGG7&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=e9a200be6bb7e0606acbb5c43faddedd&oe=61D28023',
      like: 131,
      comment: 76),
  Post(
      name: "Tanilton Fernandes",
      profile:
          "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t39.30808-6/fr/cp0/e15/q65/260929957_1320128461749635_921411425780388648_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeElYPvI4K_GxPbP1USoSLG_uXCh_mi1EZW5cKH-aLURlVI75xkABuzVrCZjju07HAsi4UyHuB69N13mEDvkfzK6&_nc_ohc=_eqqmuPQhskAX-nHnUh&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=b514053091fc6edc1b471d3c217ee388&oe=61B1800B",
      time: "12:26 am",
      title: "Viva com estilo!!!",
      image:
          "https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/261455975_4079813645454015_5086579899463024417_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeHTmlfjFW41xwI6jY3Oxk_rSWc70TmGUM5JZzvROYZQzrVdAWEh5z9rTTi-zv2hF2r-XDerE6-omnBzzn1cNEUF&_nc_ohc=-whyFzT201IAX9mqHgr&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=53b642d58d6e258ecbfa88b8f16d3ee6&oe=61CE8808",
      like: 341,
      comment: 36),
  Post(
      name: "Saude",
      profile: "http://lorempixel.com/200/200/people/3",
      time: "04:36 pm",
      title: "Corra, e vive a vida",
      image:
          'https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/261662805_2777693502529085_8183219009782725104_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoibyJ9&_nc_eui2=AeHqxAa-GpA9BVLdxGcMtuiIgdxPGlJ7sCuB3E8aUnuwK_26_nL0SMO9PEeI-CEJNPBooK-I0U5nPjMMTSfVQCEs&_nc_ohc=X7G_csZ0-xcAX-6wq7M&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=9ea848f14c43679895845e14779a277a&oe=61CDF6F3',
      like: 134,
      likeStatus: true,
      comment: 96),
];

class StoryModel {
  StoryModel(this.imageUrl);
  final String imageUrl;
}
