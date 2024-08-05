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
    KullanýmPanel
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

        if (state == UIState.SivilPersonelPanel) 
        {
            sivilPersonelPanel.gameObject.SetActive(true);

        }
        else if (state == UIState.MateryalPanel)
        {
            materyalPanel.gameObject.SetActive(true);
        }
        else if (state == UIState.AskeriPersonelPanel)
        {
            askeriPersonelPanel.gameObject.SetActive(true);
        }
        else if (state == UIState.OperasyonPanel)
        {
            operasyonPanel.gameObject.SetActive(true);
        }
        else if (state == UIState.BakýmPanel)
        {
            bakýmPanel.gameObject.SetActive(true);
        }
        else if (state == UIState.KullanýmPanel)
        {
            kullanýmPanel.gameObject.SetActive(true);
        }
    }

    private void DeactivateAllPanels() 
    {
        sivilPersonelPanel.gameObject.SetActive(false);
        materyalPanel.gameObject.SetActive(false);
        askeriPersonelPanel.gameObject.SetActive(false);
        operasyonPanel.gameObject.SetActive(false);
        bakýmPanel.gameObject.SetActive(false);
        kullanýmPanel.gameObject.SetActive(false);
    }

    public void OnSivilPersonelPanelSelect() 
    {
        sivilPersonelPanel.OnPanelSelect();
        ChangeUIState(UIState.SivilPersonelPanel);
    }

    public void OnMateryalPanelSelect()
    {
        materyalPanel.OnPanelSelect();
        ChangeUIState(UIState.MateryalPanel);
    }

    public void OnAskeriPersonelPanelSelect()
    {
        askeriPersonelPanel.OnPanelSelect();
        ChangeUIState(UIState.AskeriPersonelPanel);
    }

    public void OnOperasyonPanelSelect()
    {
        operasyonPanel.OnPanelSelect();
        ChangeUIState(UIState.OperasyonPanel);
    }

    public void OnBakýmPanelSelect()
    {
        bakýmPanel.OnPanelSelect();
        ChangeUIState(UIState.BakýmPanel);
    }

    public void OnKullanýmPanelSelect()
    {
        kullanýmPanel.OnPanelSelect();
        ChangeUIState(UIState.KullanýmPanel);
    }
}
