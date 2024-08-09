using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class AskeriPersonelPanel : Panel
{
    [SerializeField]
    private string update_askeri_personel_php;

    protected override void FillLines()
    {
        Page<AskeriPersonel> pages = new Page<AskeriPersonel>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].PersonelID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Rütbe.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Birlik.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateAskeriPersonel()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("PersonelID", line.GetTextField(0));
                form.AddField("Rütbe", line.GetTextField(1));
                form.AddField("Birlik", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_askeri_personel_php, form);
            }
        }
    }


    public void UpdateRütbe(int personelID, string yeniRütbe)
    {
        WWWForm form = new WWWForm();
        form.AddField("PersonelID", personelID);
        form.AddField("Rütbe", yeniRütbe);

        MySQLManager.Instance.ConnectAndPostData(this, update_askeri_personel_php, form);
    }


    [SerializeField]
    private string update_birlik_php; // Birlik güncelleme için PHP dosyasýnýn adresi

    // Diðer mevcut metotlar...








    [SerializeField]
    private TMP_InputField eskiBirlikInputField; // Eski Birlik için input alaný
    [SerializeField]
    private TMP_InputField yeniBirlikInputField; // Yeni Birlik için input alaný
    [SerializeField]
    private TMP_InputField minimumBirlikBoyutuInputField; // Minimum birlik boyutu için input alaný

    public void BirlikleriBirlestir()
    {
        string eskiBirlik = eskiBirlikInputField.text;
        string yeniBirlik = yeniBirlikInputField.text;
        int minimumBirlikBoyutu;

        if (int.TryParse(minimumBirlikBoyutuInputField.text, out minimumBirlikBoyutu))
        {
            WWWForm form = new WWWForm();
            form.AddField("eskiBirlik", eskiBirlik);
            form.AddField("yeniBirlik", yeniBirlik);
            form.AddField("minimumBirlikBoyutu", minimumBirlikBoyutu);

            MySQLManager.Instance.ConnectAndPostData(this, update_birlik_php, form);
        }
        else
        {
            Debug.LogError("Invalid minimum birlik boyutu input.");
        }
    }

}
