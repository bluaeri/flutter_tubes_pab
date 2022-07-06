import 'package:flutter/material.dart';

class groupData {
  List<groupModel> groupList;

  groupData() {
    groupList = [];
    groupList.add(
      groupModel(
          id: 0,
          name: 'EXO',
          fandom: "EXO-L",
          tentang:
              "Exo (엑소) dibentuk oleh SM Entertainment pada tahun 2011 dan debut pada tahun 2012. Merupakan grup yang menempati posisi lima besar sebagai selebritas paling berpengaruh dalam daftar Forbes Korea Power Celebrity tiap tahun dari 2014 sampai 2018, dan telah dijuluki sebagai 'boy band terbesar di dunia' dan 'kings of K-pop' oleh media. Grup ini sekarang beranggotakan sembilan orang yaitu: Suho, Baekhyun, Chanyeol, D.O., Kai, Sehun, Xiumin, Lay, dan Chen.",
          image: Image.asset("assets/image/exo.jpg"),
          imageText: Image.asset("assets/image/exo-title.png"),
          videoClipPath: "assets/video/dolittleclip.mp4",
          videoClipReflectionPath: "assets/video/dolittleclip-reflection.mp4",
          memberList: [
            groupMemberModel(
              name: "Suho",
              photo: Image.asset("assets/image/member/suho.jpg"),
            ),
            groupMemberModel(
              name: "Baekhyun",
              photo: Image.asset("assets/image/member/baek.jpg"),
            ),
            groupMemberModel(
              name: "Chanyeol",
              photo: Image.asset("assets/image/member/chan.jpg"),
            ),
            groupMemberModel(
              name: "D.O.",
              photo: Image.asset("assets/image/member/diyo.jpg"),
            ),
            groupMemberModel(
              name: "Kai",
              photo: Image.asset("assets/image/member/kai.jpg"),
            ),
            groupMemberModel(
              name: "Sehun",
              photo: Image.asset("assets/image/member/sehun.jpg"),
            ),
            groupMemberModel(
              name: "Xiumin",
              photo: Image.asset("assets/image/member/xiu.jpg"),
            ),
            groupMemberModel(
              name: "Lay",
              photo: Image.asset("assets/image/member/lay.jpg"),
            ),
            groupMemberModel(
              name: "Chen",
              photo: Image.asset("assets/image/member/chen.jpg"),
            )
          ]),
    );
    groupList.add(
      groupModel(
          id: 1,
          name: 'RED VELVET',
          fandom: "ReVeluv",
          tentang:
              "Red Velvet (레드벨벳) dibentuk oleh SM Entertainment pada tahun 2014. Red Velvet berpartisipasi dalam film animasi musikal Trolls World Tour (2020) mewakili troll K-pop, dengan lagu 'Russian Roulette' yang muncul di film tersebut. dan terdiri dari lima anggota yaitu : Irene, Seulgi, Wendy, Joy, dan Yeri.",
          image: Image.asset("assets/image/rv.jpg"),
          imageText: Image.asset("assets/image/rv-title.png"),
          videoClipPath: "assets/video/mulanclip.mp4",
          videoClipReflectionPath: "assets/video/mulanclip-reflection.mp4",
          memberList: [
            groupMemberModel(
              name: "Irene",
              photo: Image.asset("assets/image/member/irene.jpg"),
            ),
            groupMemberModel(
              name: "Seulgi",
              photo: Image.asset("assets/image/member/seulgi.jpg"),
            ),
            groupMemberModel(
              name: "Wendy",
              photo: Image.asset("assets/image/member/wendy.jpg"),
            ),
            groupMemberModel(
              name: "Joy",
              photo: Image.asset("assets/image/member/joy.jpg"),
            ),
            groupMemberModel(
              name: "Yeri",
              photo: Image.asset("assets/image/member/yeri.jpg"),
            )
          ]),
    );
    groupList.add(
      groupModel(
          id: 2,
          name: 'AESPA',
          fandom: "'MY",
          tentang:
              "Aespa (에스파) dibentuk oleh SM Entertainment. Mereka melakukan debut pada 17 November 2020 dengan single 'Black Mamba'. Pada 10 Februari 2021, Aespa menjadi duta merek Givenchy, artis K-POP pertama yang dipilih oleh rumah mode Prancis. Pada 10 Februari 2021, Aespa menjadi duta merek Givenchy, artis K-POP pertama yang dipilih oleh rumah mode Prancis. Grup ini terdiri dari empat anggota: Karina, Giselle, Winter dan Ningning.",
          image: Image.asset("assets/image/aespa.jpg"),
          imageText: Image.asset("assets/image/aespa-title.png"),
          videoClipPath: "assets/video/blackwidowclip.mp4",
          videoClipReflectionPath: "assets/video/blackwidowclip-reflection.mp4",
          memberList: [
            groupMemberModel(
              name: "Karina",
              photo: Image.asset("assets/image/member/karina.jpg"),
            ),
            groupMemberModel(
              name: "Winter",
              photo: Image.asset("assets/image/member/winter.jpg"),
            ),
            groupMemberModel(
              name: "Ningning",
              photo: Image.asset("assets/image/member/ningning.jpg"),
            ),
            groupMemberModel(
              name: "Giselle",
              photo: Image.asset("assets/image/member/giselle.jpg"),
            )
          ]),
    );
  }
}

class groupModel {
  int id;
  String name;
  String fandom;
  String tentang;
  Image image;
  Image imageText;
  String videoClipPath;
  String videoClipReflectionPath;
  List<groupMemberModel> memberList = [];

  groupModel(
      {this.id,
      this.fandom,
      this.name,
      this.tentang,
      this.image,
      this.imageText,
      this.memberList,
      this.videoClipPath,
      this.videoClipReflectionPath});
}

class groupMemberModel {
  String name;
  Image photo;

  groupMemberModel({this.name, this.photo});
}
