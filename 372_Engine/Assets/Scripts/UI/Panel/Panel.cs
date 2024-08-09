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

    public virtual void OnPageChange()
    {
        ClearPanel();
        FillLines();
    }

    protected void ClearPanel() 
    {
        foreach(var line in lines) 
        {
            line.Clear();
        }
    }

    public void NextPage() 
    {
        page_number++;
        OnPageChange();
    }

    public void PrevPage()
    {
        if(page_number > 0) 
        {
            page_number--;
            OnPageChange();
        }
    }

    public int GetPageNumber() 
    {
        return page_number;
    }
}
