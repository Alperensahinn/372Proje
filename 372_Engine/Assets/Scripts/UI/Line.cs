using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Line : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI[] input_fields;

    public string GetTextField(int index)
    {
        return input_fields[index].text;
    }

    public void SetTextField(string text, int index)
    {
        input_fields[index].text = text;
    }
}
