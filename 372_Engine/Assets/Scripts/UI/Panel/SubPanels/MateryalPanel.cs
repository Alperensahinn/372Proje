using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MateryalPanel : Panel
{
    protected override void FillLines()
    {
        Page<Materyal> pages = new Page<Materyal>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if(pages.GetPages()[page_number, i] != null) 
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalAdý.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Tür.ToString(), 2);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Marka.ToString(), 3);
            }
            else 
            {
                break;
            }
        }
    }
}
