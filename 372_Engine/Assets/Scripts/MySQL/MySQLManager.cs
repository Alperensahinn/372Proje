using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;

public class MySQLManager : MonoBehaviour
{
    public static MySQLManager Instance;

    private string connection_string;
    private IDataReceiver receiver;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(this);
        }
        else
        {
            Instance = this;
        }
    }

    IEnumerator Connect()
    {
        UnityWebRequest www = UnityWebRequest.Get(connection_string);
        yield return www.SendWebRequest();
        if (www.result == UnityWebRequest.Result.ConnectionError || www.result == UnityWebRequest.Result.ProtocolError)
        {
            Debug.LogError("Connection to Database is failed: " + www.error);
        }
        else
        {
            string json = www.downloadHandler.text;

            if (!string.IsNullOrEmpty(json))
            {
                receiver.OnDataRecive(json);
            }
            else
            {
                Debug.LogError("No data received from database.");
            }
        }
    }

    public void ConnectAndGetData(IDataReceiver dataReceiver, string connection_php_address) 
    {
        connection_string = connection_php_address;
        receiver = dataReceiver;

        StartCoroutine(Connect());
    }
}
