using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Panel : MonoBehaviour, IDataReceiver
{
    [SerializeField]
    protected string connectionh_php_address;

    [SerializeField]
    protected List<Line> lines = new List<Line>();

    protected string recived_data;

    [SerializeField]
    protected int page_number = 0;

    public virtual void OnDataRecive(string json)
    {
        ClearPanel();
        recived_data = json;
        FillLines();
    }

    public virtual void OnPanelSelect()
    {
        MySQLManager.Instance.ConnectAndGetData(this, connectionh_php_address);
    }

    protected virtual void FillLines()
    {
    }

    public virtual void OnPageChange(int page_number)
    {
        this.page_number = page_number;
        FillLines();
    }

    protected void ClearPanel() 
    {
        foreach(var line in lines) 
        {
            line.Clear();
        }
    }
}
