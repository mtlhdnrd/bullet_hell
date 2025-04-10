using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class tileManager : MonoBehaviour
{
    [Header("skin tile refs")]
    //bull, butcher, knight, entity, rogue, samurai
    public Sprite bullBase;
    public Sprite bullSelected;
    public Sprite butcherBase;
    public Sprite butcherSelected;
    public Sprite knightBase;
    public Sprite knightSelected;
    public Sprite entityBase;
    public Sprite entitySelected;
    public Sprite rogueBase;
    public Sprite rogueSelected;
    public Sprite samuraiBase;
    public Sprite samuraiSelected;

    [Header("music tile refs")]
    //crt1, crt2, hellstar, mute + (dusqk, menyuto later)
    public Sprite crt1Base;
    public Sprite crt1Selected;
    public Sprite crt2Base;
    public Sprite crt2Selected;
    public Sprite hellstarBase;
    public Sprite hellstarSelected;
    public Sprite muteBase;
    public Sprite muteSelected;

    [Header("asset refs")]
    musicAssets musicAssets;
    passedData passedData;

    [Header("skin button refs")]
    //bull, butcher, knight, entity, rogue, samurai
    public Button btn_bull;
    public Button btn_butcher;
    public Button btn_knight;
    public Button btn_entity;
    public Button btn_rogue;
    public Button btn_samurai;


    [Header("music button refs")]
    //crt1, crt2, hellstar, mute + (dusqk, menyuto later)
    public Button btn_crt1;
    public Button btn_crt2;
    public Button btn_hellstar;
    public Button btn_mute;

    //ADD MORE SKINS/KITS:
    //add references in tileManager:
    //--init, enableTiles, setSkinTiles/setMusicTiles, selectSkin/selectSkin
    //add function in menuScript, and reference it onClick for the button:
    //--select...
    //add the pictures to the tile refs and the button itself

    public void init(musicAssets musicAssetsRef, passedData passedDataRef, string player)//called by menu
    {
        musicAssets = musicAssetsRef;
        passedData = passedDataRef;

        //disable everything first
        btn_bull.interactable = false;
        btn_butcher.interactable = false;
        btn_knight.interactable = false;
        btn_entity.interactable = false;
        //btn_rogue.interactable = false;
        //btn_samurai.interactable = false;

        //music buttons
        btn_crt1.interactable = false;
        btn_crt2.interactable = false;
        btn_hellstar.interactable = false;
        btn_mute.interactable = false;
        //deselect tiles
        setSkinTiles();
        setMusicTiles();

        //set active
        if (player == "p1")
        {
            enableTiles(passedData.p1Skins, passedData.p1Kits);
            selectKit("p1", passedData.p1Kit);
            selectSkin("p1", passedData.p1Skin);
        }
        else
        {
            enableTiles(passedData.p2Skins, passedData.p2Kits);
            selectKit("p2", passedData.p2Kit);
            selectSkin("p2", passedData.p2Skin);
        }
    }
    public void enableTiles(List<string> skins, List<musicKit> kits)//called by menu
    {
        //skins owned enable
        btn_bull.interactable = skins.Contains("bull");
        btn_butcher.interactable = skins.Contains("butcher");
        btn_knight.interactable = skins.Contains("knight");
        btn_entity.interactable = skins.Contains("entity");
        btn_rogue.interactable = skins.Contains("rogue");
        btn_samurai.interactable = skins.Contains("samurai");

        //kits owned enable
        btn_crt1.interactable = kits.Contains(musicAssets.crt1Kit);
        btn_crt2.interactable = kits.Contains(musicAssets.crt2Kit);
        btn_hellstar.interactable = kits.Contains(musicAssets.hellstarKit);
        btn_mute.interactable = kits.Contains(musicAssets.muteKit);

    }
    public void setSkinTiles()
    {
        btn_bull.image.sprite = bullBase;
        btn_butcher.image.sprite = butcherBase;
        btn_knight.image.sprite = knightBase;
        btn_entity.image.sprite = entityBase;
        btn_rogue.image.sprite = rogueBase;
        btn_samurai.image.sprite = samuraiBase;
    }
    public void setMusicTiles()//resets base images
    {
        btn_crt1.image.sprite = crt1Base;
        btn_crt2.image.sprite = crt2Base;
        btn_hellstar.image.sprite = hellstarBase;
        btn_mute.image.sprite = muteBase;
    }
    public void selectSkin(string player, string skin)
    {
        setSkinTiles();
        //passedData update
        if (player == "p1")
        {
            passedData.p1Skin = skin;
        }
        else
        {
            passedData.p2Skin = skin;
        }

        //visual representation
        if (skin == "bull")
        {
            refreshTile(btn_bull);
            btn_bull.image.sprite = bullSelected;
        }
        else if (skin == "butcher")
        {
            refreshTile(btn_butcher);
            btn_butcher.image.sprite = butcherSelected;
        }
        else if (skin == "knight")
        {
            refreshTile(btn_knight);
            btn_knight.image.sprite = knightSelected;
        }
        else if (skin == "entity")
        {
            refreshTile(btn_entity);
            btn_entity.image.sprite = entitySelected;
        }
        else if (skin == "rogue")
        {
            refreshTile(btn_rogue);
            btn_rogue.image.sprite = rogueSelected;
        }
        else if (skin == "samurai")
        {
            refreshTile(btn_samurai);
            btn_samurai.image.sprite = samuraiSelected;
        }

    }
    public void refreshTile(Button btn)
    {
        btn.interactable = false;
        btn.interactable = true;
    }
    public void selectKit(string player, musicKit kit)//called by menu
    {
        setMusicTiles();
        if (player == "p1")
        {
            passedData.p1Kit = kit;//passedData update
        }
        else
        {
            passedData.p2Kit = kit;//passedData update
        }

        //kits refresh
        if (kit == musicAssets.crt1Kit)
        {
            refreshTile(btn_crt1);
            btn_crt1.image.sprite = crt1Selected;
        }
        else if (kit == musicAssets.crt2Kit)
        {
            refreshTile(btn_crt2);
            btn_crt2.image.sprite = crt2Selected;
        }
        else if (kit == musicAssets.hellstarKit)
        {
            refreshTile(btn_hellstar);
            btn_hellstar.image.sprite = hellstarSelected;
        }
        else if (kit == musicAssets.muteKit)
        {
            refreshTile(btn_mute);
            btn_mute.image.sprite = muteSelected;
        }
    }
}
