using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DepoPanel : Panel
{
    [SerializeField]
    private string update_depo_php;

    protected override void FillLines()
    {
        Page<Depo> pages = new Page<Depo>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].DepoID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Konum.ToString(), 1);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateDepo()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("DepoID", line.GetTextField(0));
                form.AddField("Konum", line.GetTextField(1));

                MySQLManager.Instance.ConnectAndPostData(this, update_depo_php, form);
            }
        }
    }
}
