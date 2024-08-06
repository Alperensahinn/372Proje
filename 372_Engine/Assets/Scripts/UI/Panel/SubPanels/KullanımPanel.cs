using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KullanımPanel : Panel 
{
    protected override void FillLines()
    {
        Page<Kullanım> pages = new Page<Kullanım>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].OperasyonID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].OperasyonAdı.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 2);
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalAdı.ToString(), 3);
                lines[i].SetTextField(pages.GetPages()[page_number, i].ToplamKullanım.ToString(), 4);
            }
            else
            {
                break;
            }
        }
    }
}
