using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro; // TextMeshPro için ekleme

public class BulunPanel : Panel
{
    [SerializeField]
    private string update_bulun_php;

    // TMP_InputField'ler ekleniyor
    [SerializeField]
    private TMP_InputField materyalIDInputField;
    [SerializeField]
    private TMP_InputField miktarInputField;
    [SerializeField]
    private TMP_InputField gondericiDepoIDInputField;
    [SerializeField]
    private TMP_InputField aliciDepoIDInputField;
    [SerializeField]
    private TMP_InputField transferIDInputField;

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

    [SerializeField]
    private string start_transfer_php; // Transfer baþlatma için PHP dosyasýnýn adresi
    [SerializeField]
    private string complete_transfer_php; // Transfer tamamlama için PHP dosyasýnýn adresi

    // TMP_InputField verileri kullanýlarak transfer baþlatma iþlemi
    public void BaslatMateryalAktarimi()
    {
        int materyalID, miktar, gondericiDepoID, aliciDepoID, transferID;

        if (int.TryParse(materyalIDInputField.text, out materyalID) &&
            int.TryParse(miktarInputField.text, out miktar) &&
            int.TryParse(gondericiDepoIDInputField.text, out gondericiDepoID) &&
            int.TryParse(aliciDepoIDInputField.text, out aliciDepoID) &&
            int.TryParse(transferIDInputField.text, out transferID))
        {
            WWWForm form = new WWWForm();
            form.AddField("materyalID", materyalID);
            form.AddField("miktar", miktar);
            form.AddField("gondericiDepoID", gondericiDepoID);
            form.AddField("aliciDepoID", aliciDepoID);
            form.AddField("transferID", transferID);

            MySQLManager.Instance.ConnectAndPostData(this, start_transfer_php, form);
        }
        else
        {
            Debug.LogError("Geçersiz giriþ deðerleri.");
        }
    }

    // TMP_InputField verileri kullanýlarak transfer tamamlama iþlemi
    public void TamamlaMateryalAktarimi()
    {
        int transferID, materyalID, miktar, aliciDepoID;

        if (int.TryParse(transferIDInputField.text, out transferID) &&
            int.TryParse(materyalIDInputField.text, out materyalID) &&
            int.TryParse(miktarInputField.text, out miktar) &&
            int.TryParse(aliciDepoIDInputField.text, out aliciDepoID))
        {
            WWWForm form = new WWWForm();
            form.AddField("transferID", transferID);
            form.AddField("materyalID", materyalID);
            form.AddField("miktar", miktar);
            form.AddField("aliciDepoID", aliciDepoID);

            MySQLManager.Instance.ConnectAndPostData(this, complete_transfer_php, form);
        }
        else
        {
            Debug.LogError("Geçersiz giriþ deðerleri.");
        }
    }
}
