using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulunPanel : Panel
{
    [SerializeField]
    private string update_bulun_php;

    protected override void FillLines()
    {
        Page<Bulun> pages = new Page<Bulun>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].DepoID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Miktar.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateBulun()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("MateryalID", line.GetTextField(0));
                form.AddField("DepoID", line.GetTextField(1));
                form.AddField("Miktar", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_bulun_php, form);
            }
        }
    }
}
