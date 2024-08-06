using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class SivilPersonel
{
    public int PersonelID;
    public string Ad;
    public string Soyad;
}

[System.Serializable]
public class Materyal
{
    public int MateryalID;
    public string MateryalAdý;
    public string Tür;
    public string Marka;
}

[System.Serializable]
public class AskeriPersonel
{
    public int PersonelID;
    public string Rütbe;
    public string Birlik;
}

[System.Serializable]
public class Operasyon
{
    public int OperasyonID;
    public string OperasyonAdý;
    public string Tarih;
}

[System.Serializable]
public class Bakým
{
    public int MateryalID;
    public int DepoID;
    public string BakýmTarihi;
    public string ÝþlemDetayi;
    public int PersonelID;
    public string Ad;
    public string Soyad;
}

[System.Serializable]
public class BakýmýYaklaþan
{
    public string BakýmTarihi;
    public string ÝþlemDetayi;
    public int PersonelID;
    public string Ad;
    public string Soyad;
}


[System.Serializable]
public class Bulun
{
    public int MateryalID;
    public int DepoID;
    public double Miktar;
}

[System.Serializable]
public class Depo
{
    public int DepoID;
    public string Konum;
}

[System.Serializable]
public class FiyatVerir
{
    public int SipariþID;
    public int TedarikçiID;
    public double Fiyat;
}

[System.Serializable]
public class Sipariþ
{
    public int SipariþID;
    public int MateryalID;
    public double Miktar;
}

[System.Serializable]
public class Tedarikçi
{
    public int TedarikçiID;
    public string FirmaAdý;
}



[System.Serializable]
public class Kullaným
{
    public int OperasyonID;
    public string OperasyonAdý;
    public int MateryalID;
    public string MateryalAdý;
    public int ToplamKullaným;
}
