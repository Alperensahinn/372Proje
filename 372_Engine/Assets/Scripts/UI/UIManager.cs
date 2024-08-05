using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum UIState
{
    SivilPersonelPanel,
    MateryalPanel
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
    }

    private void DeactivateAllPanels() 
    {
        sivilPersonelPanel.gameObject.SetActive(false);
        materyalPanel.gameObject.SetActive(false);
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
}
