using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using TMPro;

public class loginFormNavigation : MonoBehaviour
{
    public Selectable usernameInputField;
    public Selectable passwordInputField;
    public Button loginButton;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            Selectable current = EventSystem.current.currentSelectedGameObject?.GetComponent<Selectable>();

            if (current == usernameInputField)
            {
                // If username is selected, move to password
                passwordInputField.Select();
                Debug.Log("Password input field selected");
            }
            else if (current == passwordInputField)
            {
                // If password is selected, move to username
               usernameInputField.Select();
            }
        }

        // Check if Enter key is pressed
        if (Input.GetKeyDown(KeyCode.Return) || Input.GetKeyDown(KeyCode.KeypadEnter))
        {
            Selectable current = EventSystem.current.currentSelectedGameObject?.GetComponent<Selectable>();

            // Check if either the username or password field is currently selected
            if (current == usernameInputField || current == passwordInputField)
            {
                // If yes, simulate a click on the login button
                if (loginButton != null)
                {
                    loginButton.onClick.Invoke();
                }
            }
            // This wouldn't happen in normal situation, but good to check
            else if (current == loginButton)
            {
                if (loginButton != null)
                {
                     loginButton.onClick.Invoke();
                }
            }
        }
    }
}
