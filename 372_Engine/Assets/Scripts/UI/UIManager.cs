using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum UIState
{
    SivilPersonelPanel,
    MateryalPanel,
    AskeriPersonelPanel,
    OperasyonPanel,
    BakımPanel,
    KullanımPanel
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
    private BakımPanel bakımPanel;
    [SerializeField]
    private KullanımPanel kullanımPanel;

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
        else if (state == UIState.BakımPanel)
        {
            bakımPanel.gameObject.SetActive(true);
        }
        else if (state == UIState.KullanımPanel)
        {
            kullanımPanel.gameObject.SetActive(true);
        }
    }

    private void DeactivateAllPanels() 
    {
        sivilPersonelPanel.gameObject.SetActive(false);
        materyalPanel.gameObject.SetActive(false);
        askeriPersonelPanel.gameObject.SetActive(false);
        operasyonPanel.gameObject.SetActive(false);
        bakımPanel.gameObject.SetActive(false);
        kullanımPanel.gameObject.SetActive(false);
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

    public void OnBakımPanelSelect()
    {
        bakımPanel.OnPanelSelect();
        ChangeUIState(UIState.BakımPanel);
    }

    public void OnKullanımPanelSelect()
    {
        kullanımPanel.OnPanelSelect();
        ChangeUIState(UIState.KullanımPanel);
    }
}
