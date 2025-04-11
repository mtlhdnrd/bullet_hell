using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class displaySkin : MonoBehaviour
{
    [Header("spriterenderer refs")]
    public SpriteRenderer head;
    public SpriteRenderer handClose;
    public SpriteRenderer handFar;
    public SpriteRenderer body;


    public void skinSwitch(playerAssets playerAssets, string selected)//own-check by menuscript 
    {
        if (selected == "rogue")
        {
            batch(playerAssets.rogue_head, playerAssets.rogue_handCloseB, playerAssets.rogue_handFarB, playerAssets.rogue_idle);
        }
        else if (selected == "samurai")
        {
            batch(playerAssets.samurai_head, playerAssets.samurai_handCloseB, playerAssets.samurai_handFarB, playerAssets.samurai_idle);
        }
        else if (selected == "bull")
        {
            batch(playerAssets.bull_head, playerAssets.bull_handCloseB, playerAssets.bull_handFarB, playerAssets.bull_idle);
        }
        else if (selected == "butcher")
        {
            batch(playerAssets.butcher_head, playerAssets.butcher_handCloseB, playerAssets.butcher_handFarB, playerAssets.butcher_idle);
        }
        else if (selected == "entity")
        {
            batch(playerAssets.entity_head, playerAssets.entity_handCloseB, playerAssets.entity_handFarB, playerAssets.entity_idle);
        }
        else
        {
            batch(playerAssets.knight_head, playerAssets.knight_handCloseB, playerAssets.knight_handFarB, playerAssets.knight_idle);
        }
    }

    private void batch(Sprite hRef, Sprite hcRef, Sprite hfRef, Sprite bodyRef)
    {
        head.sprite = hRef;
        handClose.sprite = hcRef;
        handFar.sprite = hfRef;
        body.sprite = bodyRef;
    }
}
