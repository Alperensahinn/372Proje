using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AskeriPersonelPanel : Panel
{
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
}
