using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Page<T> where T : new()
{
    private T[] data;
    private T[,] pages;

    public void MakePage(string recived_data) 
    {
        data = JsonHelper.FromJson<T>(recived_data);

        pages = new T[1000, 11];

        int j = 0;
        int k = 0;

        for(int i = 0; i < data.Length; i++) 
        {
            if(j < 11) 
            {
                pages[k, j] = data[i];
                j++;
            }
            else if(j == 11) 
            {
                j = 0;
                k++;
            }
        }
    }

    public T[,] GetPages() 
    {
        return pages;
    }
}
