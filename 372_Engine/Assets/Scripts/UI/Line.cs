using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine.UI;
using UnityEngine;

public class Line : MonoBehaviour
{
    [SerializeField]
    private TMP_InputField[] input_fields;

    public string GetTextField(int index)
    {
        if (input_fields[index].enabled == true)
            return input_fields[index].text;
        else
            return "";
    }

    public void SetTextField(string text, int index)
    {
        input_fields[index].text = text;
        input_fields[index].enabled = true;
    }

    public void Clear() 
    {
        for (int i = 0; i < input_fields.Length; i++) 
        {
            input_fields[i].text = "";
            input_fields[i].enabled = false;
        }
    }
}
