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
    public string MateryalAd�;
    public string T�r;
    public string Marka;
}

[System.Serializable]
public class AskeriPersonel
{
    public int PersonelID;
    public string R�tbe;
    public string Birlik;
}

[System.Serializable]
public class Operasyon
{
    public int OperasyonID;
    public string OperasyonAd�;
    public string Tarih;
}

[System.Serializable]
public class Bak�m
{
    public int MateryalID;
    public int DepoID;
    public string Bak�mTarihi;
    public string ��lemDetayi;
    public int PersonelID;
    public string Ad;
    public string Soyad;
}

[System.Serializable]
public class Bak�m�Yakla�an
{
    public string Bak�mTarihi;
    public string ��lemDetayi;
    public int PersonelID;
    public string Ad;
    public string Soyad;
}

[System.Serializable]
public class Kullan�m
{
    public int OperasyonID;
    public string OperasyonAd�;
    public int MateryalID;
    public string MateryalAd�;
    public int ToplamKullan�m;
}