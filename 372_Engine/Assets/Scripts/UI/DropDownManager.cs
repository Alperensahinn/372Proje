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
}
