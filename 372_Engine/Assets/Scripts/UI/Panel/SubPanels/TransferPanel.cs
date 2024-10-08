using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TransferPanel : Panel
{
    [SerializeField]
    private string update_transfer_php; // URL to the PHP script for updating transfer

    protected override void FillLines()
    {
        Page<Transfer> pages = new Page<Transfer>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].TransferID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].MateryalID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].G�ndericiDepoID.ToString(), 2);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Al�c�DepoID.ToString(), 3);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Ba�lang��Tarihi.ToString(), 4);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Biti�Tarihi.ToString(), 5);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Miktar.ToString(), 6);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateTransfer()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("TransferID", line.GetTextField(0));
                form.AddField("MateryalID", line.GetTextField(1));
                form.AddField("G�ndericiDepoID", line.GetTextField(2));
                form.AddField("Al�c�DepoID", line.GetTextField(3));
                form.AddField("Ba�lang��Tarihi", line.GetTextField(4));
                form.AddField("Biti�Tarihi", line.GetTextField(5));
                form.AddField("Miktar", line.GetTextField(6));

                MySQLManager.Instance.ConnectAndPostData(this, update_transfer_php, form);
            }
        }
    }
}
