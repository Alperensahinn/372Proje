using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;

public class MySQLConnection : MonoBehaviour
{
    [SerializeField]
    TextMeshProUGUI m_TextMeshProUGUI;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(Connect());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    IEnumerator Connect() 
    {
        UnityWebRequest www = UnityWebRequest.Get("http://localhost/372Proje/Connection.php");
        yield return www.SendWebRequest();
        if (www.result == UnityWebRequest.Result.ConnectionError || www.result == UnityWebRequest.Result.ProtocolError)
        {
            Debug.LogError("Connection to Database is failed: " + www.error);
        }
        else
        {
            string json = www.downloadHandler.text;
            Debug.Log("Response from server: " + json);

            
            if (!string.IsNullOrEmpty(json))
            {
                SivilPersonel[] personelList = JsonHelper.FromJson<SivilPersonel>(json);
                foreach (SivilPersonel personel in personelList)
                {
                    m_TextMeshProUGUI.text += "ID: " + personel.PersonelID + ", Ad: " + personel.Ad + ", Soyad: " + personel.Soyad;
                    Debug.Log("ID: " + personel.PersonelID + ", Ad: " + personel.Ad + ", Soyad: " + personel.Soyad);
                }
            }
            else
            {
                Debug.LogError("No data received from database.");
            }
        }
    }
}
