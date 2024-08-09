using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum UIState
{
    SivilPersonelPanel,
    MateryalPanel,
    AskeriPersonelPanel,
    OperasyonPanel,
    BakýmPanel,
    KullanýmPanel,
    BulunPanel,
    DepoPanel,
    FiyatVerirPanel,
    SipariþPanel,
    TedarikçiPanel
}

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;

    [SerializeField]
    private UIState state;

    [SerializeField]
    private SivilPersonelPanel sivilPersonelPanel;
    [SerializeField]
    private MateryalPanel materyalPanel;
    [SerializeField]
    private AskeriPersonelPanel askeriPersonelPanel;
    [SerializeField]
    private OperasyonPanel operasyonPanel;
    [SerializeField]
    private BakýmPanel bakýmPanel;
    [SerializeField]
    private KullanýmPanel kullanýmPanel;
    [SerializeField]
    private BulunPanel bulunPanel;
    [SerializeField]
    private DepoPanel depoPanel;
    [SerializeField]
    private FiyatVerirPanel fiyatVerirPanel;
    [SerializeField]
    private SipariþPanel sipariþPanel;
    [SerializeField]
    private TedarikçiPanel tedarikçiPanel;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(this);
        }
        else
        {
            Instance = this;
            ChangeUIState(UIState.SivilPersonelPanel);
        }
    }

    public void ChangeUIState(UIState newState)
    {
        DeactivateAllPanels();

        state = newState;

        switch (state)
        {
            case UIState.SivilPersonelPanel:
                if (sivilPersonelPanel != null) sivilPersonelPanel.gameObject.SetActive(true);
                break;
            case UIState.MateryalPanel:
                if (materyalPanel != null) materyalPanel.gameObject.SetActive(true);
                break;
            case UIState.AskeriPersonelPanel:
                if (askeriPersonelPanel != null) askeriPersonelPanel.gameObject.SetActive(true);
                break;
            case UIState.OperasyonPanel:
                if (operasyonPanel != null) operasyonPanel.gameObject.SetActive(true);
                break;
            case UIState.BakýmPanel:
                if (bakýmPanel != null) bakýmPanel.gameObject.SetActive(true);
                break;
            case UIState.KullanýmPanel:
                if (kullanýmPanel != null) kullanýmPanel.gameObject.SetActive(true);
                break;
            case UIState.BulunPanel:
                if (bulunPanel != null) bulunPanel.gameObject.SetActive(true);
                break;
            case UIState.DepoPanel:
                if (depoPanel != null) depoPanel.gameObject.SetActive(true);
                break;
            case UIState.FiyatVerirPanel:
                if (fiyatVerirPanel != null) fiyatVerirPanel.gameObject.SetActive(true);
                break;
            case UIState.SipariþPanel:
                if (sipariþPanel != null) sipariþPanel.gameObject.SetActive(true);
                break;
            case UIState.TedarikçiPanel:
                if (tedarikçiPanel != null) tedarikçiPanel.gameObject.SetActive(true);
                break;
        }
    }
    
    public UIState GetUIState() 
    {
        return state;
    }

    private void DeactivateAllPanels()
    {
        if (sivilPersonelPanel != null) sivilPersonelPanel.gameObject.SetActive(false);
        if (materyalPanel != null) materyalPanel.gameObject.SetActive(false);
        if (askeriPersonelPanel != null) askeriPersonelPanel.gameObject.SetActive(false);
        if (operasyonPanel != null) operasyonPanel.gameObject.SetActive(false);
        if (bakýmPanel != null) bakýmPanel.gameObject.SetActive(false);
        if (kullanýmPanel != null) kullanýmPanel.gameObject.SetActive(false);
        if (bulunPanel != null) bulunPanel.gameObject.SetActive(false);
        if (depoPanel != null) depoPanel.gameObject.SetActive(false);
        if (fiyatVerirPanel != null) fiyatVerirPanel.gameObject.SetActive(false);
        if (sipariþPanel != null) sipariþPanel.gameObject.SetActive(false);
        if (tedarikçiPanel != null) tedarikçiPanel.gameObject.SetActive(false);
    }

    public void OnSivilPersonelPanelSelect()
    {
        sivilPersonelPanel?.OnPanelSelect();
        ChangeUIState(UIState.SivilPersonelPanel);
    }

    public void OnMateryalPanelSelect()
    {
        materyalPanel?.OnPanelSelect();
        ChangeUIState(UIState.MateryalPanel);
    }

    public void OnAskeriPersonelPanelSelect()
    {
        askeriPersonelPanel?.OnPanelSelect();
        ChangeUIState(UIState.AskeriPersonelPanel);
    }

    public void OnOperasyonPanelSelect()
    {
        operasyonPanel?.OnPanelSelect();
        ChangeUIState(UIState.OperasyonPanel);
    }

    public void OnBakýmPanelSelect()
    {
        bakýmPanel?.OnPanelSelect();
        ChangeUIState(UIState.BakýmPanel);
    }

    public void OnKullanýmPanelSelect()
    {
        kullanýmPanel?.OnPanelSelect();
        ChangeUIState(UIState.KullanýmPanel);
    }

    public void OnBulunPanelSelect()
    {
        bulunPanel?.OnPanelSelect();
        ChangeUIState(UIState.BulunPanel);
    }

    public void OnDepoPanelSelect()
    {
        depoPanel?.OnPanelSelect();
        ChangeUIState(UIState.DepoPanel);
    }

    public void OnFiyatVerirPanelSelect()
    {
        fiyatVerirPanel?.OnPanelSelect();
        ChangeUIState(UIState.FiyatVerirPanel);
    }

    public void OnSipariþPanelSelect()
    {
        sipariþPanel?.OnPanelSelect();
        ChangeUIState(UIState.SipariþPanel);
    }

    public void OnTedarikçiPanelSelect()
    {
        tedarikçiPanel?.OnPanelSelect();
        ChangeUIState(UIState.TedarikçiPanel);
    }






    public void OnRütbeGuncelleClick(int personelID, string yeniRütbe)
    {
        askeriPersonelPanel.UpdateRütbe(personelID, yeniRütbe);
    }

    public void OnIhaleYap()
    {
        fiyatVerirPanel.GetEnIyiFiyat(); // No parameter needed
    }



}
