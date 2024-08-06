using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FiyatVerirPanel : Panel
{
    [SerializeField]
    private string update_fiyat_verir_php;

    protected override void FillLines()
    {
        Page<FiyatVerir> pages = new Page<FiyatVerir>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].Sipari�ID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Tedarik�iID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Fiyat.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateFiyatVerir()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("Sipari�ID", line.GetTextField(0));
                form.AddField("Tedarik�iID", line.GetTextField(1));
                form.AddField("Fiyat", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_fiyat_verir_php, form);
            }
        }
    }
}
