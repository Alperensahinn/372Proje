using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MateryalPanel : Panel
{
    [SerializeField]
    private string update_materyal_php;

    protected override void FillLines()
    {
        Page<Materyal> pages = new Page<Materyal>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
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

    public void UpdateMateryal()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("MateryalID", line.GetTextField(0));
                form.AddField("MateryalAdý", line.GetTextField(1));
                form.AddField("Tür", line.GetTextField(2));
                form.AddField("Marka", line.GetTextField(3));

                MySQLManager.Instance.ConnectAndPostData(this, update_materyal_php, form);
            }
        }
    }
}
