using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class SivilPersonelPanel : Panel
{
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
}
