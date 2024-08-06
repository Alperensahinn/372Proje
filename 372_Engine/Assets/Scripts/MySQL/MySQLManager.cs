using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;

public class MySQLManager : MonoBehaviour
{
    public static MySQLManager Instance;

    private string connection_string;
    private WWWForm post_form;
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
            Debug.LogError("Error while sending request: " + www.error);
        }
        else
        {
            string responseText = www.downloadHandler.text;

            if (!string.IsNullOrEmpty(responseText))
            {
                receiver.OnDataRecive(responseText);
            }
            else
            {
                Debug.LogError("No data received from database.");
            }
        }
    }

    public IEnumerator PostData()
    {
        UnityWebRequest www = UnityWebRequest.Post(connection_string, post_form);

        yield return www.SendWebRequest();

        if (www.result == UnityWebRequest.Result.ConnectionError || www.result == UnityWebRequest.Result.ProtocolError)
        {
            Debug.LogError("Error while sending request: " + www.error);
        }
        else
        {
            string responseText = www.downloadHandler.text;

            if (string.IsNullOrEmpty(responseText))
            {
                Debug.LogError("No data received from server.");
            }

        }
    }

    public void ConnectAndGetData(IDataReceiver dataReceiver, string connection_php_address) 
    {
        connection_string = connection_php_address;
        receiver = dataReceiver;

        StartCoroutine(Connect());
    }

    public void ConnectAndPostData(IDataReceiver dataReceiver, string connection_php_address, WWWForm postForm)
    {
        connection_string = connection_php_address;
        post_form = postForm;
        receiver = dataReceiver;

        StartCoroutine(PostData());
    }
}
