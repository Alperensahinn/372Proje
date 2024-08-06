using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BakımPanel : Panel
{
    [SerializeField]
    private string bakimi_yaklasan_php;

    private bool state = false;

    public override void OnPanelSelect()
    {
        state = false;
        MySQLManager.Instance.ConnectAndGetData(this, connectionh_php_address);
    }

    protected override void FillLines()
    {
        Page<Bakım> pages = new Page<Bakım>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].DepoID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].BakımTarihi.ToString(), 2);
                lines[i].SetTextField(pages.GetPages()[page_number, i].İşlemDetayi.ToString(), 3);
                lines[i].SetTextField(pages.GetPages()[page_number, i].PersonelID.ToString(), 4);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Ad.ToString(), 5);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Soyad.ToString(), 6);
            }
            else
            {
                break;
            }
        }
    }

    private void FillLines2()
    {
        Page<BakımıYaklaşan> pages = new Page<BakımıYaklaşan>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].BakımTarihi.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].İşlemDetayi.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].PersonelID.ToString(), 2);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Ad.ToString(), 3);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Soyad.ToString(), 4);
            }
            else
            {
                break;
            }
        }
    }

    public override void OnDataRecive(string json) 
    {
        ClearPanel();

        recived_data = json;

        if(state == false) 
        {
            FillLines();
        }
        else 
        {
            FillLines2();
        }
    }

    public void GetBakimiYaklasan()
    {
        MySQLManager.Instance.ConnectAndGetData(this, bakimi_yaklasan_php);
        state = true;
    }


    [SerializeField]
    private string update_bakım_php;

    public void UpdateBakım()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("MateryalID", line.GetTextField(0));
                form.AddField("DepoID", line.GetTextField(1));
                form.AddField("BakımTarihi", line.GetTextField(2));
                form.AddField("İşlemDetayi", line.GetTextField(3));
                form.AddField("PersonelID", line.GetTextField(4));

                MySQLManager.Instance.ConnectAndPostData(this, update_bakım_php, form);
            }
        }
    }
}
