using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public enum UIState
{
    SivilPersonelPanel,
    MateryalPanel,
    AskeriPersonelPanel,
    OperasyonPanel,
    Bak�mPanel,
    Kullan�mPanel,
    BulunPanel,
    DepoPanel,
    FiyatVerirPanel,
    Sipari�Panel,
    Tedarik�iPanel,
    TransferPanel // Added TransferPanel here
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
    private Bak�mPanel bak�mPanel;
    [SerializeField]
    private Kullan�mPanel kullan�mPanel;
    [SerializeField]
    private BulunPanel bulunPanel;
    [SerializeField]
    private DepoPanel depoPanel;
    [SerializeField]
    private FiyatVerirPanel fiyatVerirPanel;
    [SerializeField]
    private Sipari�Panel sipari�Panel;
    [SerializeField]
    private Tedarik�iPanel tedarik�iPanel;
    [SerializeField]
    private TransferPanel transferPanel; 

    [SerializeField]
    private Panel currentPanel;

    [SerializeField]
    private TMP_Text pageNumber;

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

        if(currentPanel != null) 
        {
            pageNumber.text = currentPanel.GetPageNumber().ToString();
        }

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
            case UIState.Bak�mPanel:
                if (bak�mPanel != null) bak�mPanel.gameObject.SetActive(true);
                break;
            case UIState.Kullan�mPanel:
                if (kullan�mPanel != null) kullan�mPanel.gameObject.SetActive(true);
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
            case UIState.Sipari�Panel:
                if (sipari�Panel != null) sipari�Panel.gameObject.SetActive(true);
                break;
            case UIState.Tedarik�iPanel:
                if (tedarik�iPanel != null) tedarik�iPanel.gameObject.SetActive(true);
                break;
            case UIState.TransferPanel: // Added TransferPanel case here
                if (transferPanel != null) transferPanel.gameObject.SetActive(true);
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
        if (bak�mPanel != null) bak�mPanel.gameObject.SetActive(false);
        if (kullan�mPanel != null) kullan�mPanel.gameObject.SetActive(false);
        if (bulunPanel != null) bulunPanel.gameObject.SetActive(false);
        if (depoPanel != null) depoPanel.gameObject.SetActive(false);
        if (fiyatVerirPanel != null) fiyatVerirPanel.gameObject.SetActive(false);
        if (sipari�Panel != null) sipari�Panel.gameObject.SetActive(false);
        if (tedarik�iPanel != null) tedarik�iPanel.gameObject.SetActive(false);
        if (transferPanel != null) transferPanel.gameObject.SetActive(false); // Added deactivation for TransferPanel
    }

    public void OnSivilPersonelPanelSelect()
    {
        currentPanel = sivilPersonelPanel;
        sivilPersonelPanel?.OnPanelSelect();
        ChangeUIState(UIState.SivilPersonelPanel);
    }

    public void OnMateryalPanelSelect()
    {
        currentPanel = materyalPanel;
        materyalPanel?.OnPanelSelect();
        ChangeUIState(UIState.MateryalPanel);
    }

    public void OnAskeriPersonelPanelSelect()
    {
        currentPanel = askeriPersonelPanel;
        askeriPersonelPanel?.OnPanelSelect();
        ChangeUIState(UIState.AskeriPersonelPanel);
    }

    public void OnOperasyonPanelSelect()
    {
        currentPanel = operasyonPanel;
        operasyonPanel?.OnPanelSelect();
        ChangeUIState(UIState.OperasyonPanel);
    }

    public void OnBak�mPanelSelect()
    {
        currentPanel = bak�mPanel;
        bak�mPanel?.OnPanelSelect();
        ChangeUIState(UIState.Bak�mPanel);
    }

    public void OnKullan�mPanelSelect()
    {
        currentPanel = kullan�mPanel;
        kullan�mPanel?.OnPanelSelect();
        ChangeUIState(UIState.Kullan�mPanel);
    }

    public void OnBulunPanelSelect()
    {
        currentPanel = bulunPanel;
        bulunPanel?.OnPanelSelect();
        ChangeUIState(UIState.BulunPanel);

    }

    public void OnDepoPanelSelect()
    {
        currentPanel = depoPanel;
        depoPanel?.OnPanelSelect();
        ChangeUIState(UIState.DepoPanel);
    }

    public void OnFiyatVerirPanelSelect()
    {
        currentPanel = fiyatVerirPanel;
        fiyatVerirPanel?.OnPanelSelect();
        ChangeUIState(UIState.FiyatVerirPanel);
    }

    public void OnSipari�PanelSelect()
    {
        currentPanel = sipari�Panel;
        sipari�Panel?.OnPanelSelect();
        ChangeUIState(UIState.Sipari�Panel);
    }

    public void OnTedarik�iPanelSelect()
    {
        currentPanel = tedarik�iPanel;
        tedarik�iPanel?.OnPanelSelect();
        ChangeUIState(UIState.Tedarik�iPanel);
    }

    public void OnTransferPanelSelect() // Added OnTransferPanelSelect method
    {
        currentPanel = transferPanel;
        transferPanel?.OnPanelSelect();
        ChangeUIState(UIState.TransferPanel);
    }


    public void OnR�tbeGuncelleClick()
    {
        askeriPersonelPanel.UpdateR�tbe();
    }


    public void OnIhaleYap()
    {
        fiyatVerirPanel.GetEnIyiFiyat(); // No parameter needed
    }


    public void OnBirlikleriBirlestirClick()
    {
        askeriPersonelPanel.BirlikleriBirlestir();
    }


    public void OnMateryalAktarimiBaslat()
    {
        bulunPanel.BaslatMateryalAktarimi(); // Parametreler InputField'lardan al�nacak
    }

    public void OnMateryalAktarimiTamamla()
    {
        bulunPanel.TamamlaMateryalAktarimi(); // Parametreler InputField'lardan al�nacak
    }

    public void GotoNextPage()
    {
        currentPanel.NextPage();
        pageNumber.text = currentPanel.GetPageNumber().ToString();
    }

    public void GoPrevPage() 
    {
        currentPanel.PrevPage();
        pageNumber.text = currentPanel.GetPageNumber().ToString();
    }
}
