using UnityEngine;
using TMPro;

public class ColumnManager : MonoBehaviour
{
    public GameObject columnPrefab; // Parent Image ve çocuk TextMeshPro içeren prefab
    public Transform parentTransform; // Oluþturulacak column prefablarýnýn parent GameObject'i (Genellikle bir Canvas ya da Panel)

    public static ColumnManager Instance;

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

    // Verilen komuta göre UI Text elemanlarýný oluþturur
    public void CreateColumns(string data)
    {
        // Önceki column prefablarýný temizle
        ClearColumns();

        // Veriyi ',' ile parçalayarak ayýr
        string[] columns = data.Split(',');

        foreach (string column in columns)
        {
            // Column prefabýndan yeni bir column elemaný oluþtur
            GameObject newColumn = Instantiate(columnPrefab, parentTransform);

            // Oluþturulan column elemanýndaki TextMeshPro componentini bul ve metni ata
            TMP_Text textComponent = newColumn.GetComponentInChildren<TMP_Text>();
            if (textComponent != null)
            {
                textComponent.text = column.Trim();
            }
            else
            {
                Debug.LogError("TextMeshPro componenti bulunamadý!");
            }
        }
    }

    // Tüm column prefablarýný silmek için bir metod
    public void ClearColumns()
    {
        foreach (Transform child in parentTransform)
        {
            Destroy(child.gameObject);
        }
    }
}
