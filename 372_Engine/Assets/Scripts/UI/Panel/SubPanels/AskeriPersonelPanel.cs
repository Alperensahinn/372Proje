using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AskeriPersonelPanel : Panel
{
    [SerializeField]
    private string update_askeri_personel_php;

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

    public void UpdateAskeriPersonel()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("PersonelID", line.GetTextField(0));
                form.AddField("Rütbe", line.GetTextField(1));
                form.AddField("Birlik", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_askeri_personel_php, form);
            }
        }
    }


    public void UpdateRütbe(int personelID, string yeniRütbe)
    {
        WWWForm form = new WWWForm();
        form.AddField("PersonelID", personelID);
        form.AddField("Rütbe", yeniRütbe);

        MySQLManager.Instance.ConnectAndPostData(this, update_askeri_personel_php, form);
    }

}
