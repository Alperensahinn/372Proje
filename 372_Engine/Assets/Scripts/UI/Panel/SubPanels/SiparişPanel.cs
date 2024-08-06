using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SiparişPanel : Panel
{
    [SerializeField]
    private string update_sipariş_php;

    protected override void FillLines()
    {
        Page<Sipariş> pages = new Page<Sipariş>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].SiparişID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Miktar.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateSipariş()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("SiparişID", line.GetTextField(0));
                form.AddField("MateryalID", line.GetTextField(1));
                form.AddField("Miktar", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_sipariş_php, form);
            }
        }
    }
}
