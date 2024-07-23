using UnityEngine;
using TMPro;
using System.Collections.Generic;

public class DropDownManager : MonoBehaviour
{
    public static DropDownManager Instance;

    public TMP_Dropdown[] dropdowns; // 11 adet TMP_Dropdown

    void Awake()
    {
        // Singleton kontrolü
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void Start()
    {
        // Dropdown'lara onValueChanged listener'ý ekle
        foreach (TMP_Dropdown dropdown in dropdowns)
        {
            dropdown.onValueChanged.AddListener(delegate { OnDropdownValueChanged(dropdown); });
        }
    }

    // Dropdown'lara seçenek eklemek için bir metod
    public void AddOption(int dropdownIndex, string option)
    {
        if (dropdownIndex >= 0 && dropdownIndex < dropdowns.Length)
        {
            TMP_Dropdown dropdown = dropdowns[dropdownIndex];
            TMP_Dropdown.OptionData newOption = new TMP_Dropdown.OptionData(option);
            dropdown.options.Add(newOption);
        }
        else
        {
            Debug.LogError("Geçersiz Dropdown indexi!");
        }
    }

    // Dropdown'lara birden fazla seçenek eklemek için bir metod
    public void AddOptions(int dropdownIndex, List<string> options)
    {
        if (dropdownIndex >= 0 && dropdownIndex < dropdowns.Length)
        {
            TMP_Dropdown dropdown = dropdowns[dropdownIndex];
            List<TMP_Dropdown.OptionData> newOptions = new List<TMP_Dropdown.OptionData>();

            foreach (string option in options)
            {
                newOptions.Add(new TMP_Dropdown.OptionData(option));
            }

            dropdown.options.AddRange(newOptions);
        }
        else
        {
            Debug.LogError("Geçersiz Dropdown indexi!");
        }
    }

    // Dropdown'dan seçenekleri temizlemek için bir metod
    public void ClearOptions(int dropdownIndex)
    {
        if (dropdownIndex >= 0 && dropdownIndex < dropdowns.Length)
        {
            TMP_Dropdown dropdown = dropdowns[dropdownIndex];
            dropdown.options.Clear();
        }
        else
        {
            Debug.LogError("Geçersiz Dropdown indexi!");
        }
    }

    // Dropdown deðeri deðiþtiðinde çaðrýlan metod
    void OnDropdownValueChanged(TMP_Dropdown changedDropdown)
    {
        int index = changedDropdown.value;

        // Dropdown'ýn yeni seçeneðine göre ColumnManager'ý güncelle
        string selectedOption = changedDropdown.options[index].text;

        // Seçilen opsiyona göre ilgili veriyi kullanarak ColumnManager'ý güncelle
        // Burada sadece bir örnek veri kullandým, gerçek verinizi buraya eklemelisiniz
        string data = GetDataForOption(selectedOption);
        ColumnManager.Instance.CreateColumns(data);
    }

    // Seçilen opsiyona göre veriyi döndüren bir metod
    string GetDataForOption(string option)
    {
        // Bu metod seçilen opsiyona göre ilgili veriyi döndürmelidir
        // Örnek olarak sabit bir veri seti kullandým
        switch (option)
        {
            case "Option1":
                return "PersonelID, DepoID, BakýmTarihi, MateryalID, ÝþlemDetayi";
            case "Option2":
                return "2, 2, 2019-04-18, 3, Kokpit camlarý deðiþtirildi";
            // Daha fazla case ekleyebilirsiniz
            default:
                return "Unknown option";
        }
    }
}
