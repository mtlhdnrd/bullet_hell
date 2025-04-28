using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.UIElements;

public class menu : MonoBehaviour
{
    [Header("maps")]
    public List<string> maps;//for matchmaking

    [Header("script refs")]
    public passedData passedData;
    public musicPlayer musicPlayer;
    public musicAssets musicAssets;
    public playerAssets playerAssets;
    public tileManager tileManager;

    [Header("gameobject refs")]
    public GameObject uiMenu;
    public GameObject uiCustomize;
    public GameObject uiSettings;
    public GameObject uiLogin;

    [Header("playerbody menu refs")]
    public displaySkin playerbodyP1;
    public displaySkin playerbodyP2;

    [Header("ownership refs")]
    public List<musicKit> p1Kits;
    public List<musicKit> p2Kits;
    public List<string> p1Skins;
    public List<string> p2Skins;

    [Header("login refs")]
    public TMP_InputField field_username;
    public TMP_InputField field_password;

    [Header("button refs menu")]
    public UnityEngine.UI.Button btn_fight;
    public UnityEngine.UI.Button btn_player1;//login + customize
    public UnityEngine.UI.Button btn_player2;//login + customize

    [Header("Customize refs")]
    //middle part
    public displaySkin skinInv;
    public TextMeshProUGUI nameInv;
    public SpriteRenderer kitInv;
    //right part
    public TextMeshProUGUI itemName;
    public TextMeshProUGUI itemDesc;

    [Header("Settings refs")]
    public List<Sprite> clickerSprites;

    public UnityEngine.UI.Slider volumeSlider;
    public UnityEngine.UI.Button btn_assign;
    public UnityEngine.UI.Button btn_devMode;
    public GameObject txt_warning;


    [Header("some help")]
    public string activePlayer;

    public void init(passedData passedDataRef, musicPlayer musicPlayerRef, musicAssets musicAssetsRef, playerAssets playerAssetsRef)
    {
        passedData = passedDataRef;
        musicPlayer = musicPlayerRef;
        musicAssets = musicAssetsRef;
        playerAssets = playerAssetsRef;
        menuScreen();
        assign();
    }

    //home screen
    public void menuScreen()//btn_menu
    {
        uiMenu.SetActive(true);
        uiCustomize.SetActive(false);
        uiSettings.SetActive(false);
        uiLogin.SetActive(false);
        menuUpdate();
    }
    public void fight()//btn_fight
    {
        passedData.map = maps[UnityEngine.Random.Range(0, maps.Count)];
        SceneManager.LoadScene("fight");
    }
    public void LoadOwnedMusic(APIManager.AssetResponse response)
    {
        if (!response.success)
            return;
        if (response.player == "p1")
        {
            List<musicKit> kits = new List<musicKit>();
            musicKit activeKit = null;
            foreach (KeyValuePair<string, bool> kit in response.ownedAssetName)
            {
                kits.Add(musicAssets.GetAssetByName(kit.Key));
                if (kit.Value)
                {
                    activeKit = musicAssets.GetAssetByName(kit.Key);
                }
            }
            //set owned kits
            if (kits != null)
            {
                passedData.p1Kits = kits;
            }

            //set active kit
            if (activeKit != null)
            {
                passedData.p1Kit = activeKit;
            }
        }
        else
        {
            List<musicKit> kits = new List<musicKit>();
            musicKit activeKit = null;
            foreach (KeyValuePair<string, bool> kit in response.ownedAssetName)
            {
                kits.Add(musicAssets.GetAssetByName(kit.Key));
                if (kit.Value)
                    activeKit = musicAssets.GetAssetByName(kit.Key);
            }
            //set owned kits
            if (kits != null)
            {
                passedData.p2Kits = kits;
            }

            //set active kit
            if (activeKit != null)
            {
                passedData.p2Kit = activeKit;
            }
        }
    }
    public void LoadOwnedCharacters(APIManager.AssetResponse response)
    {
        if (!response.success)
            return;
        if (response.player == "p1")
        {
            List<string> skins = new List<string>();
            string activeSkin = null;
            foreach (KeyValuePair<string, bool> skin in response.ownedAssetName)
            {

                skins.Add(skin.Key.ToLower());
                if (skin.Value)
                {
                    activeSkin = skin.Key;
                }
            }
            if (skins != null)
            {
                passedData.p1Skins = skins;
                foreach (var data in passedData.p1Skins)
                {
                    Debug.Log("p1 skin: " + data);
                }
            }
            else
            {
                passedData.p1Skins = new List<string> { "knight" };
            }

            if (activeSkin != null)
            {
                passedData.p1Skin = activeSkin;
            }
            else
            {
                passedData.p1Skin = "knight";
            }
        }
        else//p2
        {
            List<string> skins = new List<string>();
            string activeSkin = null;
            foreach (KeyValuePair<string, bool> skin in response.ownedAssetName)
            {
                skins.Add(skin.Key.ToLower());
                if (skin.Value)
                {
                    activeSkin = skin.Key;
                }
            }
            if (skins != null)
            {
                passedData.p2Skins = skins;
            }
            else
            {
                passedData.p2Skins = new List<string> { "knight" };
            }

            if (activeSkin != null)
            {
                passedData.p2Skin = activeSkin;
            }
            else
            {
                passedData.p2Skin = "knight";
            }
        }
    }
    public void loginP1()//btn_player1
    {
        if (passedData.p1Login)//if logged in
        {
            customizeScreen("p1");
        }
        else//first pressed
        {
            loginScreen("p1");
        }
    }
    public void loginP2()//btn_player2
    {
        if (passedData.p2Login)//if logged in
        {
            customizeScreen("p2");
        }
        else//first pressed
        {
            loginScreen("p2");
        }
    }
    public void loginScreen(string player)
    {
        uiMenu.SetActive(false);
        uiCustomize.SetActive(false);
        uiSettings.SetActive(false);
        uiLogin.SetActive(true);
        activePlayer = player;
        field_username.text = null;
        field_password.text = null;
    }
    public void checkLogin()//btn_login on loginScreen
    {
        Debug.Log(field_username.text + " and " + field_password.text);
        loginPlayer(field_username.text, field_password.text);
    }
    public void loginSuccess(APIManager.LoginResponse response)
    {
        if (!response.success)
            return;

        if (response.player == "p1")
            passedData.p1Login = true;
        else
            passedData.p2Login = true;
        if (response.player == "p1")
        {
            passedData.p1Name = response.username;
            passedData.p1Rank = response.points;
            menuScreen();
            //Loading owned music
            StartCoroutine(APIManager.GetOwnedMusic(response.username, "p1", LoadOwnedMusic));
            //Loading owned characters
            StartCoroutine(APIManager.GetOwnedCharacters(response.username, "p1", LoadOwnedCharacters));
            //"if playerPrefs.p1name==p1Name{} then set the following:
            //CURRENTLY SET PREFS
            passedData.p1Login = true;
            btn_player1.gameObject.GetComponentInChildren<TextMeshProUGUI>().text = "edit";
            musicPlayer.changePack(passedData.p1Kit, "p1");
            playerbodyP1.skinSwitch(playerAssets, passedData.p1Skin);//in-menu playerbody
        }
        else
        {
            passedData.p2Name = response.username;
            passedData.p2Rank = response.points;
            menuScreen();
            //Loading owned music
            StartCoroutine(APIManager.GetOwnedMusic(response.username, "p2", LoadOwnedMusic));
            //Load owned characters
            StartCoroutine(APIManager.GetOwnedCharacters(response.username, "p2", LoadOwnedCharacters));
            //"if playerPrefs.p1name==p1Name{} then set the following:
            //CURRENTLY SET PREFS
            passedData.p2Login = true;
            btn_player2.gameObject.GetComponentInChildren<TextMeshProUGUI>().text = "edit";
            musicPlayer.changePack(passedData.p2Kit, "p2");
            playerbodyP2.skinSwitch(playerAssets, passedData.p2Skin);//in-menu playerbody
        }

    }
    public void loginFailure(APIManager.LoginResponse response)
    {
        loginScreen(activePlayer);
        Debug.Log("Login authentication failed");
    }
    public void loginPlayer(string username, string password)
    {
        if (username != passedData.p1Name && username != passedData.p2Name)
        {
            //Getting hold of username and password
            if (passedData.devMode)
            {
                loginSuccess(new APIManager.LoginResponse(true, username, 50, activePlayer));
            }
            else
            {
                //LOGIN REQUEST
                StartCoroutine(APIManager.Login(username, password, activePlayer, loginSuccess, loginFailure));
            }
        }
        else
        {
            // Show login error
            Debug.Log("This user is already logged in");
        }
    }
    public void quit()//btn_quit
    {
        Application.Quit();
        Debug.Log("game closed");
    }
    //customize
    public void customizeScreen(string player)//called by logins (when logged in)
    {
        activePlayer = player;
        uiMenu.SetActive(false);
        uiCustomize.SetActive(true);
        uiSettings.SetActive(false);
        uiLogin.SetActive(false);

        customUpdate();//displayed items update
        tileManager.init(musicAssets, passedData, activePlayer);

        itemName.text = "inventory";
        itemDesc.text = "you will want to look your best when your opponent looks into your eyes in despair...";
    }
    public void customUpdate()
    {
        if (activePlayer == "p1")
        {
            //skin update
            skinInv.skinSwitch(playerAssets, passedData.p1Skin);
            //name update
            nameInv.text = passedData.p1Name;
            //musicKit update
            kitInv.sprite = passedData.p1Kit.coverart;
        }
        else if (activePlayer == "p2")
        {
            //skin update
            skinInv.skinSwitch(playerAssets, passedData.p2Skin);
            //name update
            nameInv.text = passedData.p2Name;
            //musicKit update
            kitInv.sprite = passedData.p2Kit.coverart;
        }
    }
    public void menuUpdate()
    {

        if (passedData.p2Login && passedData.p1Login)//if both logged in
        {
            btn_fight.interactable = true;
        }
        if (passedData.p1Name != "p1")
        {
            playerbodyP1.skinSwitch(playerAssets, passedData.p1Skin);
        }
        if (passedData.p2Name != "p2")
        {
            playerbodyP2.skinSwitch(playerAssets, passedData.p2Skin);
        }
    }
    //---music selection---
    public void selectBull()
    {
        tileManager.selectSkin(activePlayer, "bull");//passedData update here
        itemName.text = "bull";
        itemDesc.text = playerAssets.bull_desc;
        customUpdate();
    }
    public void selectButcher()
    {
        tileManager.selectSkin(activePlayer, "butcher");
        itemName.text = "butcher";
        itemDesc.text = playerAssets.butcher_desc;
        customUpdate();
    }
    public void selectKnight()
    {
        tileManager.selectSkin(activePlayer, "knight");
        itemName.text = "knight";
        itemDesc.text = playerAssets.knight_desc;
        customUpdate();
    }
    public void selectEntity()
    {
        tileManager.selectSkin(activePlayer, "entity");
        itemName.text = "entity";
        itemDesc.text = playerAssets.entity_desc;
        customUpdate();
    }
    public void selectRogue()
    {
        tileManager.selectSkin(activePlayer, "rogue");
        itemName.text = "rogue";
        itemDesc.text = playerAssets.rogue_desc;
        customUpdate();
    }
    public void selectSamurai()
    {
        tileManager.selectSkin(activePlayer, "samurai");
        itemName.text = "samurai";
        itemDesc.text = playerAssets.samurai_desc;
        customUpdate();
    }
    //--------------------
    //---music selection---
    public void selectCrt1()
    {
        tileManager.selectKit(activePlayer, musicAssets.crt1Kit);
        itemName.text = "crt kit";
        itemDesc.text = musicAssets.crt1Kit.desc;
        customUpdate();
    }
    public void selectCrt2()
    {
        tileManager.selectKit(activePlayer, musicAssets.crt2Kit);
        itemName.text = "crt kit 2";
        itemDesc.text = musicAssets.crt2Kit.desc;
        customUpdate();
    }
    public void selectHellstar()
    {
        tileManager.selectKit(activePlayer, musicAssets.hellstarKit);
        itemName.text = "hellstar kit";
        itemDesc.text = musicAssets.hellstarKit.desc;
        customUpdate();
    }
    public void selectMute()
    {
        tileManager.selectKit(activePlayer, musicAssets.muteKit);
        itemName.text = "mute kit";
        itemDesc.text = musicAssets.muteKit.desc;
        customUpdate();
    }
    //--------------------
    public void reshuffle()//btn_reshuffle
    {
        musicPlayer.playMusic("menu");
    }
    //settings
    public void settingsScreen()//btn_settings
    {
        uiMenu.SetActive(false);
        uiCustomize.SetActive(false);
        uiSettings.SetActive(true);
        //update buttons n things here
        updateSettings();
    }
    public void setVolume()
    {
        passedData.musicVolume = volumeSlider.value;
        musicPlayer.changeVolume(passedData.musicVolume);
    }
    public void assign()//inputDevices for players (gamepad or mouse)
    {
        Debug.Log("----ASSIGNING DEVICES----");
        List<InputDevice> devices = new List<InputDevice>();
        //devices fill
        foreach (InputDevice device in Gamepad.all)
        {
            Debug.Log("gamepad found");
            devices.Add(device);
        }

        if (devices.Count == 0)
        {
            //fallback -> mouse for p1
            passedData.p1Gamepad = null;
            passedData.p2Gamepad = null;
            Debug.Log("no gamepads detected");
        }
        else if (devices.Count == 1)
        {
            //mouse for p1, gamepad for p2
            passedData.p1Gamepad = null;
            passedData.p2Gamepad = devices[0];
            Debug.Log("gamepad for p2");
        }
        else if (devices.Count > 1)
        {
            //gamepad[0] for p1, gamepad[1] for p2
            passedData.p1Gamepad = devices[0];
            passedData.p2Gamepad = devices[1];
            Debug.Log("gamepads for both");
        }
        Debug.Log("-------------------------");
        updateSettings();
    }

    private void updateSettings()
    {
        if (passedData.devMode)
        {
            btn_devMode.image.sprite = clickerSprites[0];
        }
        else
        {
            btn_devMode.image.sprite = clickerSprites[1];
        }

        if (passedData.p2Gamepad == null)
        {
            txt_warning.GetComponent<TextMeshProUGUI>().text = "p1: mouse+keyboard, p2: nothing";
        }
        else if (passedData.p1Gamepad == null)
        {
            txt_warning.GetComponent<TextMeshProUGUI>().text = "p1: mouse+keyboard, p2: gamepad";
        }
        else
        {
            txt_warning.GetComponent<TextMeshProUGUI>().text = "p1: gamepad, p2: gamepad";
        }
    }
    public void devMode()
    {
        if (passedData.devMode)
        {
            //turn off
            passedData.devMode = false;
        }
        else
        {
            //turn on
            passedData.devMode = true;
        }
        updateSettings();
    }
}