using UnityEngine;
using UnityEngine.UI;

public class ButtonInputManager : MonoBehaviour
{
    public GameObject[] gameObjects; // 11 boyutundaki GameObject arrayi
    public Button myButton; // Ýþlemi baþlatacak olan buton
    public int selectedIndex; // Kullanýcýnýn seçtiði index

    void Start()
    {
        // Butona týklama olayýný dinleyici olarak ekle
        myButton.onClick.AddListener(OnButtonClick);
    }

    void OnButtonClick()
    {
        // Tüm GameObject'leri deaktif et
        for (int i = 0; i < gameObjects.Length; i++)
        {
            gameObjects[i].SetActive(false);
        }

        // Seçilen indexteki GameObject'i aktif et
        if (selectedIndex >= 0 && selectedIndex < gameObjects.Length)
        {
            gameObjects[selectedIndex].SetActive(true);
        }
        else
        {
            Debug.LogError("Seçilen index geçersiz!");
        }
    }
}
