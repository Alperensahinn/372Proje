using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OperasyonPanel : Panel
{
    [SerializeField]
    private string update_operasyon_php;

    protected override void FillLines()
    {
        Page<Operasyon> pages = new Page<Operasyon>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].OperasyonID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].OperasyonAdý.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Tarih.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateOperasyon()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("OperasyonID", line.GetTextField(0));
                form.AddField("OperasyonAdý", line.GetTextField(1));
                form.AddField("Tarih", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_operasyon_php, form);
            }
        }
    }
}
