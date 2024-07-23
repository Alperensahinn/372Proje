using UnityEngine;
using TMPro;
using System.Collections.Generic;

public class DropDownManager : MonoBehaviour
{
    public static DropDownManager Instance;

    public TMP_Dropdown[] dropdowns; // 11 adet TMP_Dropdown

    void Awake()
    {
        // Singleton kontrol�
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
        // Dropdown'lara onValueChanged listener'� ekle
        foreach (TMP_Dropdown dropdown in dropdowns)
        {
            dropdown.onValueChanged.AddListener(delegate { OnDropdownValueChanged(dropdown); });
        }
    }

    // Dropdown'lara se�enek eklemek i�in bir metod
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
            Debug.LogError("Ge�ersiz Dropdown indexi!");
        }
    }

    // Dropdown'lara birden fazla se�enek eklemek i�in bir metod
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
            Debug.LogError("Ge�ersiz Dropdown indexi!");
        }
    }

    // Dropdown'dan se�enekleri temizlemek i�in bir metod
    public void ClearOptions(int dropdownIndex)
    {
        if (dropdownIndex >= 0 && dropdownIndex < dropdowns.Length)
        {
            TMP_Dropdown dropdown = dropdowns[dropdownIndex];
            dropdown.options.Clear();
        }
        else
        {
            Debug.LogError("Ge�ersiz Dropdown indexi!");
        }
    }

    // Dropdown de�eri de�i�ti�inde �a�r�lan metod
    void OnDropdownValueChanged(TMP_Dropdown changedDropdown)
    {
        int index = changedDropdown.value;

        // Dropdown'�n yeni se�ene�ine g�re ColumnManager'� g�ncelle
        string selectedOption = changedDropdown.options[index].text;

        // Se�ilen opsiyona g�re ilgili veriyi kullanarak ColumnManager'� g�ncelle
        // Burada sadece bir �rnek veri kulland�m, ger�ek verinizi buraya eklemelisiniz
        string data = GetDataForOption(selectedOption);
        ColumnManager.Instance.CreateColumns(data);
    }

    // Se�ilen opsiyona g�re veriyi d�nd�ren bir metod
    string GetDataForOption(string option)
    {
        // Bu metod se�ilen opsiyona g�re ilgili veriyi d�nd�rmelidir
        // �rnek olarak sabit bir veri seti kulland�m
        switch (option)
        {
            case "Option1":
                return "PersonelID, DepoID, Bak�mTarihi, MateryalID, ��lemDetayi";
            case "Option2":
                return "2, 2, 2019-04-18, 3, Kokpit camlar� de�i�tirildi";
            // Daha fazla case ekleyebilirsiniz
            default:
                return "Unknown option";
        }
    }
}
