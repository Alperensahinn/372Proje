using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InsertToTable : MonoBehaviour, IDataReceiver
{
    [SerializeField]
    private Line line;

    [SerializeField]
    private string insert_askeri_personel_php;

    public void OnDataRecive(string json)
    {
        
    }

    public void OnInsertButtonPressed() 
    {
        if (UIManager.Instance.GetUIState() == UIState.AskeriPersonelPanel)
            InsertAskeriPersonel();
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
}
