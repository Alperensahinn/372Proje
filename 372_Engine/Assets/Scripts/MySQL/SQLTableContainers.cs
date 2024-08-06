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
    public int Sipari�ID;
    public int Tedarik�iID;
    public double Fiyat;
}

[System.Serializable]
public class Sipari�
{
    public int Sipari�ID;
    public int MateryalID;
    public double Miktar;
}

[System.Serializable]
public class Tedarik�i
{
    public int Tedarik�iID;
    public string FirmaAd�;
}