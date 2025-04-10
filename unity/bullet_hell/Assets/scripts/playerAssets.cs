using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerAssets : MonoBehaviour {

    //HAM FACTORY SKINS

    [Header("BULL REFS")]
    public Sprite bull_head;
    public Sprite bull_handCloseA;
    public Sprite bull_handCloseB;
    public Sprite bull_handFarA;
    public Sprite bull_handFarB;
    public Sprite bull_idle;
    public Sprite[] bull_walk;
    public string bull_desc;

    [Header("BUTCHER REFS")]
    public Sprite butcher_head;
    public Sprite butcher_handCloseA;
    public Sprite butcher_handCloseB;
    public Sprite butcher_handFarA;
    public Sprite butcher_handFarB;
    public Sprite butcher_idle;
    public Sprite[] butcher_walk;
    public string butcher_desc;

    //PRACTICE SKINS

    [Header("KNIGHT REFS")]
    public Sprite knight_head;
    public Sprite knight_handCloseA;
    public Sprite knight_handCloseB;
    public Sprite knight_handFarA;
    public Sprite knight_handFarB;
    public Sprite knight_idle;
    public Sprite[] knight_walk;
    public string knight_desc;

    [Header("ENTITY REFS")]
    public Sprite entity_head;
    public Sprite entity_handCloseA;
    public Sprite entity_handCloseB;
    public Sprite entity_handFarA;
    public Sprite entity_handFarB;
    public Sprite entity_idle;
    public Sprite[] entity_walk;
    public string entity_desc;

    //MEDIEVAL JAPAN SKINS

    [Header("ROGUE REFS")]
    public Sprite rogue_head;
    public Sprite rogue_handCloseA;
    public Sprite rogue_handCloseB;
    public Sprite rogue_handFarA;
    public Sprite rogue_handFarB;
    public Sprite rogue_idle;
    public Sprite[] rogue_walk;
    public string rogue_desc;

    [Header("SAMURAI REFS")]
    public Sprite samurai_head;
    public Sprite samurai_handCloseA;
    public Sprite samurai_handCloseB;
    public Sprite samurai_handFarA;
    public Sprite samurai_handFarB;
    public Sprite samurai_idle;
    public Sprite[] samurai_walk;
    public string samurai_desc;

    [Header("FX REFS")]
    public List<GameObject> ink_damageFx;
    public List<GameObject> zap_damageFx;
}
