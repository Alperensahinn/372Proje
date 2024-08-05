using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class SivilPersonelPanel : MonoBehaviour, IDataReceiver
{
    [SerializeField]
    private string connectionh_php_address;

    [SerializeField]
    private List<Line> lines = new List<Line>();

    private string recived_data;

    public void OnDataRecive(string json)
    {
        recived_data = json;
        FillLines();
    }

    public void OnPanelSelect() 
    {
        MySQLManager.Instance.ConnectAndGetData(this, connectionh_php_address);
    }
    
    private void FillLines() 
    {
        SivilPersonel[] personelList = JsonHelper.FromJson<SivilPersonel>(recived_data);
        for(int i = 0; i < personelList.Length; i++) 
        {
            lines[i].SetTextField(personelList[i].PersonelID.ToString(), 0);
            lines[i].SetTextField(personelList[i].Ad.ToString(), 1);
            lines[i].SetTextField(personelList[i].Soyad.ToString(), 2);
        }
    }
}
