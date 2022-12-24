class Odev2{
 //SORU 1
  double icAci(int kenarSayi){
    return ((kenarSayi-2) * 180) / kenarSayi;
  }
  //SORU 2
  int hesapla(int gunSayisi) {
    int mesai = 8 * gunSayisi;
    if(mesai < 150){
      int maas = mesai * 40;
      return maas;
    }
    else{
      int mesaiGun = mesai - 150;
      int mesaiMaas = mesaiGun * 80;

      return (150*40) + mesaiMaas;
    }
  }
  //SORU 3
  int otoparkUcret(int sure){
    if(sure <= 1){
      return 50;
    }
    else{
      int otoparkSure = sure - 1;
      return (otoparkSure * 10) + 50;
    }
  }

  //SORU 4
  double derece(double derece){
    return (derece * 1.8) + 32;
  }

  //SORU 5
  int cevre(int a , int b){
    return (a + b) * 2;
  }

  //SORU 6
  int faktoriyel(int sayi) {
    int sonuc = 1;
    for (int i = 1; i <= sayi; i++) {
      sonuc *= i;
    }
    return sonuc;
  }

  //SORU 7

  int aSayisi(String kelime) {
    int sonuc = 0;
    for (int i = 0; i < kelime.length; i++) {
      if (kelime[i] == 'a') {
        sonuc++;
      }
    }
    return sonuc;
  }
}