using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InsertToTable : MonoBehaviour, IDataReceiver
{
    [SerializeField]
    private Line line;

    [SerializeField]
    private string insert_askeri_personel_php;
    [SerializeField]
    private string insert_depo_php;
    [SerializeField]
    private string insert_materyal_php;
    [SerializeField]
    private string insert_operasyon_php;
    [SerializeField]
    private string insert_siparis_php;
    [SerializeField]
    private string insert_sivil_personel_php;
    [SerializeField]
    private string insert_tedarikci_php;
    [SerializeField]
    private string insert_transfer_php;

    public void OnDataRecive(string json)
    {
        
    }

    public void OnInsertButtonPressed()
    {
        switch (UIManager.Instance.GetUIState())
        {
            case UIState.SivilPersonelPanel:
                InsertSivilPersonel();
                break;

            case UIState.MateryalPanel:
                InsertMateryal();
                break;

            case UIState.AskeriPersonelPanel:
                InsertAskeriPersonel();
                break;

            case UIState.OperasyonPanel:
                InsertOperasyon();
                break;

            case UIState.SipariþPanel:
                InsertSiparis();
                break;

            case UIState.TedarikçiPanel:
                InsertTedarikci();
                break;

            default:
                Debug.LogWarning("Unknown UI State");
                break;
        }
    }


    private void InsertAskeriPersonel()
    {
        if (line.GetTextField(0) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("Rütbe", line.GetTextField(0));
            form.AddField("Birlik", line.GetTextField(1));

            MySQLManager.Instance.ConnectAndPostData(this, insert_askeri_personel_php, form);
        }
    }

    private void InsertDepo()
    {
        if (line.GetTextField(0) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("Konum", line.GetTextField(0));

            MySQLManager.Instance.ConnectAndPostData(this, insert_depo_php, form);
        }
    }

    private void InsertMateryal()
    {
        if (line.GetTextField(0) != null && line.GetTextField(1) != null && line.GetTextField(2) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("MateryalAdý", line.GetTextField(0));
            form.AddField("Tür", line.GetTextField(1));
            form.AddField("Marka", line.GetTextField(2));

            MySQLManager.Instance.ConnectAndPostData(this, insert_materyal_php, form);
        }
    }

    private void InsertOperasyon()
    {
        if (line.GetTextField(0) != null && line.GetTextField(1) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("OperasyonAdý", line.GetTextField(0));
            form.AddField("Tarih", line.GetTextField(1));

            MySQLManager.Instance.ConnectAndPostData(this, insert_operasyon_php, form);
        }
    }

    private void InsertSiparis()
    {
        if (line.GetTextField(0) != null && line.GetTextField(1) != null && line.GetTextField(2) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("MateryalID", line.GetTextField(0));
            form.AddField("Miktar", line.GetTextField(1));
            form.AddField("DepoID", line.GetTextField(2));

            MySQLManager.Instance.ConnectAndPostData(this, insert_siparis_php, form);
        }
    }

    private void InsertSivilPersonel()
    {
        if (line.GetTextField(0) != null && line.GetTextField(1) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("Ad", line.GetTextField(0));
            form.AddField("Soyad", line.GetTextField(1));

            MySQLManager.Instance.ConnectAndPostData(this, insert_sivil_personel_php, form);
        }
    }

    private void InsertTedarikci()
    {
        if (line.GetTextField(0) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("FirmaAdý", line.GetTextField(0));

            MySQLManager.Instance.ConnectAndPostData(this, insert_tedarikci_php, form);
        }
    }

    private void InsertTransfer()
    {
        if (line.GetTextField(0) != null && line.GetTextField(1) != null && line.GetTextField(2) != null &&
            line.GetTextField(3) != null && line.GetTextField(4) != null && line.GetTextField(5) != null)
        {
            WWWForm form = new WWWForm();
            form.AddField("MateryalID", line.GetTextField(0));
            form.AddField("GöndericiDepoID", line.GetTextField(1));
            form.AddField("AlýcýDepoID", line.GetTextField(2));
            form.AddField("BaþlangýçTarihi", line.GetTextField(3));
            form.AddField("BitiþTarihi", line.GetTextField(4));
            form.AddField("Miktar", line.GetTextField(5));

            MySQLManager.Instance.ConnectAndPostData(this, insert_transfer_php, form);
        }
    }
}
