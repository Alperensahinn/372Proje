using UnityEngine;
using TMPro;

public class ColumnManager : MonoBehaviour
{
    public GameObject columnPrefab; // Parent Image ve �ocuk TextMeshPro i�eren prefab
    public Transform parentTransform; // Olu�turulacak column prefablar�n�n parent GameObject'i (Genellikle bir Canvas ya da Panel)

    public static ColumnManager Instance;

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

    // Verilen komuta g�re UI Text elemanlar�n� olu�turur
    public void CreateColumns(string data)
    {
        // �nceki column prefablar�n� temizle
        ClearColumns();

        // Veriyi ',' ile par�alayarak ay�r
        string[] columns = data.Split(',');

        foreach (string column in columns)
        {
            // Column prefab�ndan yeni bir column eleman� olu�tur
            GameObject newColumn = Instantiate(columnPrefab, parentTransform);

            // Olu�turulan column eleman�ndaki TextMeshPro componentini bul ve metni ata
            TMP_Text textComponent = newColumn.GetComponentInChildren<TMP_Text>();
            if (textComponent != null)
            {
                textComponent.text = column.Trim();
            }
            else
            {
                Debug.LogError("TextMeshPro componenti bulunamad�!");
            }
        }
    }

    // T�m column prefablar�n� silmek i�in bir metod
    public void ClearColumns()
    {
        foreach (Transform child in parentTransform)
        {
            Destroy(child.gameObject);
        }
    }
}
