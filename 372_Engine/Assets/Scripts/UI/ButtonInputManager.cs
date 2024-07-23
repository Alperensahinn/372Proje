using UnityEngine;
using UnityEngine.UI;

public class ButtonInputManager : MonoBehaviour
{
    public GameObject[] gameObjects; // 11 boyutundaki GameObject arrayi
    public Button myButton; // ��lemi ba�latacak olan buton
    public int selectedIndex; // Kullan�c�n�n se�ti�i index

    void Start()
    {
        // Butona t�klama olay�n� dinleyici olarak ekle
        myButton.onClick.AddListener(OnButtonClick);
    }

    void OnButtonClick()
    {
        // T�m GameObject'leri deaktif et
        for (int i = 0; i < gameObjects.Length; i++)
        {
            gameObjects[i].SetActive(false);
        }

        // Se�ilen indexteki GameObject'i aktif et
        if (selectedIndex >= 0 && selectedIndex < gameObjects.Length)
        {
            gameObjects[selectedIndex].SetActive(true);
        }
        else
        {
            Debug.LogError("Se�ilen index ge�ersiz!");
        }
    }
}
