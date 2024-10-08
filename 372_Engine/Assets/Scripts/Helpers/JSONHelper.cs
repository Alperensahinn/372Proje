using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public static class JsonHelper
{
    public static T[] FromJson<T>(string json)
    {
        return JsonUtility.FromJson<Wrapper<T>>(WrapJsonArray(json)).items;
    }

    private static string WrapJsonArray(string json)
    {
        return "{\"items\":" + json + "}";
    }

    [System.Serializable]
    private class Wrapper<T>
    {
        public T[] items;
    }
}
