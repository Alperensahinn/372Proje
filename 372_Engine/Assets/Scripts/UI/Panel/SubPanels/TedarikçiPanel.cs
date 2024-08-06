using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TedarikçiPanel : Panel
{
    [SerializeField]
    private string update_tedarikçi_php;

    protected override void FillLines()
    {
        Page<Tedarikçi> pages = new Page<Tedarikçi>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].TedarikçiID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].FirmaAdı.ToString(), 1);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateTedarikçi()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("TedarikçiID", line.GetTextField(0));
                form.AddField("FirmaAdı", line.GetTextField(1));

                MySQLManager.Instance.ConnectAndPostData(this, update_tedarikçi_php, form);
            }
        }
    }
}
