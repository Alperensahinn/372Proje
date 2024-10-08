using TMPro; // Add this for TMP support
using UnityEngine;

public class FiyatVerirPanel : Panel
{
    [SerializeField]
    private string update_fiyat_verir_php;

    [SerializeField]
    private string get_en_iyi_fiyat_php;

    [SerializeField]
    private TMP_InputField siparisIDInputField; // Use TMP_InputField for TextMeshPro support

    protected override void FillLines()
    {
        Page<FiyatVerir> pages = new Page<FiyatVerir>();
        pages.MakePage(recived_data);

        for (int i = 0; i < pages.GetPages().GetLength(1); i++)
        {
            if (pages.GetPages()[page_number, i] != null)
            {
                lines[i].SetTextField(pages.GetPages()[page_number, i].Sipari�ID.ToString(), 0);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Tedarik�iID.ToString(), 1);
                lines[i].SetTextField(pages.GetPages()[page_number, i].Fiyat.ToString(), 2);
            }
            else
            {
                break;
            }
        }
    }

    public void UpdateFiyatVerir()
    {
        foreach (var line in lines)
        {
            if (line.GetTextField(0) != null)
            {
                WWWForm form = new WWWForm();
                form.AddField("Sipari�ID", line.GetTextField(0));
                form.AddField("Tedarik�iID", line.GetTextField(1));
                form.AddField("Fiyat", line.GetTextField(2));

                MySQLManager.Instance.ConnectAndPostData(this, update_fiyat_verir_php, form);
            }
        }
    }


    public void GetEnIyiFiyat()
    {
        int siparisID;

        if (int.TryParse(siparisIDInputField.text, out siparisID))
        {
            WWWForm form = new WWWForm();
            form.AddField("Sipari�ID", siparisID);

            MySQLManager.Instance.ConnectAndGetData(this, get_en_iyi_fiyat_php);
        }
        else
        {
            Debug.LogError("Invalid Sipari� ID entered.");
        }
    }

    public override void OnDataRecive(string json)
    {
        // Gelen JSON verisini i�le ve en iyi fiyat� g�ster.
        FiyatVerir[] fiyatVerirArray = JsonHelper.FromJson<FiyatVerir>(json);
        if (fiyatVerirArray.Length > 0)
        {
            // En iyi fiyat� alan tedarik�iyi TextMeshPro UI eleman�nda g�ster
            enIyiFiyatText.text = "En iyi fiyat: " + fiyatVerirArray[0].Fiyat + " TL\nTedarik�i ID: " + fiyatVerirArray[0].Tedarik�iID;
        }
        else
        {
            enIyiFiyatText.text = "Hi�bir teklif bulunamad�.";
        }
    }








    [SerializeField]
    private TMP_Text enIyiFiyatText; // En iyi fiyat� g�sterecek TextMeshPro eleman�
}
