using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class SivilPersonelPanel : Panel
{
    [SerializeField]
    private string update_personel_php;

    protected override void FillLines() 
    {
        Page<SivilPersonel> pages = new Page<SivilPersonel>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].PersonelID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Ad.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Soyad.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateSivilPersonel() 
    {
        foreach(var line in lines) 
        {
            if(line.GetTextField(0) != null) 
            {
                WWWForm form = new WWWForm();
                form.AddField("PersonelID", line.GetTextField(0));
                form.AddField("Ad", line.GetTextField(1));
                form.AddField("Soyad", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_personel_php, form);
            }
        }
    }
}
