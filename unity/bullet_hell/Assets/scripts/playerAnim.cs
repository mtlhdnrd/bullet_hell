using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;

public class bodyAnim : MonoBehaviour
{

    [Header("script refs")]
    [SerializeField] playerController player;
    [SerializeField] playerAssets playerAssets;

    [Header("static pose refs")]
    [SerializeField] Sprite stationary;
    [SerializeField] Sprite head;
    [SerializeField] Sprite handCloseA;
    [SerializeField] Sprite handCloseB;
    [SerializeField] Sprite handFarA;
    [SerializeField] Sprite handFarB;

    [Header("gameobject refs")]
    [SerializeField] GameObject bodyObj;
    [SerializeField] GameObject handCloseObj;
    [SerializeField] GameObject handFarObj;
    [SerializeField] GameObject headObj;


    [Header("walkcycle refs")]
    [SerializeField] Sprite walk1;
    [SerializeField] Sprite walk2;
    [SerializeField] Sprite walk3;
    [SerializeField] Sprite walk4;
    [SerializeField] Sprite walk5;
    [SerializeField] Sprite walk6;

    public Sprite[] walk;
    public int current = 0;
    public int i;
    private void Awake()
    {
        //init("knight");
    }
    public void init(string startingCharacter, playerAssets assetsRef)
    {
        i = 0;
        walk = new Sprite[] { walk1, walk2, walk3, walk4, walk5, walk6 };
        playerAssets = assetsRef;
        playerAssets = GameObject.FindGameObjectWithTag("gameManager").GetComponent<playerAssets>();

        //base skin
        skinSwitch(startingCharacter);
        updateHands('b', 'b');
    }

    //walkcycle 6 frames
    public void skinSwitch(string toSkin)
    {
        //set refs
        if (toSkin == "rogue")
        {
            walk = playerAssets.rogue_walk;
            head = playerAssets.rogue_head;
            handCloseA = playerAssets.rogue_handCloseA;
            handFarA = playerAssets.rogue_handFarA;
            handCloseB = playerAssets.rogue_handCloseB;
            handFarB = playerAssets.rogue_handFarB;
            stationary = playerAssets.rogue_idle;
        }
        else if (toSkin == "butcher")
        {
            walk = playerAssets.butcher_walk;
            head = playerAssets.butcher_head;
            handCloseA = playerAssets.butcher_handCloseA;
            handFarA = playerAssets.butcher_handFarA;
            handCloseB = playerAssets.butcher_handCloseB;
            handFarB = playerAssets.butcher_handFarB;
            stationary = playerAssets.butcher_idle;
        }
        else if (toSkin == "samurai")
        {
            walk = playerAssets.samurai_walk;
            head = playerAssets.samurai_head;
            handCloseA = playerAssets.samurai_handCloseA;
            handFarA = playerAssets.samurai_handFarA;
            handCloseB = playerAssets.samurai_handCloseB;
            handFarB = playerAssets.samurai_handFarB;
            stationary = playerAssets.samurai_idle;
        }
        else if (toSkin == "knight")
        {
            walk = playerAssets.knight_walk;
            head = playerAssets.knight_head;
            handCloseA = playerAssets.knight_handCloseA;
            handFarA = playerAssets.knight_handFarA;
            handCloseB = playerAssets.knight_handCloseB;
            handFarB = playerAssets.knight_handFarB;
            stationary = playerAssets.knight_idle;
        }
        else if (toSkin == "bull")
        {
            walk = playerAssets.bull_walk;
            head = playerAssets.bull_head;
            handCloseA = playerAssets.bull_handCloseA;
            handFarA = playerAssets.bull_handFarA;
            handCloseB = playerAssets.bull_handCloseB;
            handFarB = playerAssets.bull_handFarB;
            stationary = playerAssets.bull_idle;
        }
        else if (toSkin == "entity")
        {
            walk = playerAssets.entity_walk;
            head = playerAssets.entity_head;
            handCloseA = playerAssets.entity_handCloseA;
            handFarA = playerAssets.entity_handFarA;
            handCloseB = playerAssets.entity_handCloseB;
            handFarB = playerAssets.entity_handFarB;
            stationary = playerAssets.entity_idle;
        }

        headObj.GetComponent<SpriteRenderer>().sprite = head;
    }
    public void updateHands(char close, char far)
    {
        if (close == 'a')
        {
            handCloseObj.GetComponent<SpriteRenderer>().sprite = handCloseA;
        }
        else if (close == 'b')
        {
            handCloseObj.GetComponent<SpriteRenderer>().sprite = handCloseB;
        }
        if (far == 'a')
        {
            handFarObj.GetComponent<SpriteRenderer>().sprite = handFarA;
        }
        else if (far == 'b')
        {
            handFarObj.GetComponent<SpriteRenderer>().sprite = handFarB;
        }

    }
    private void moveAnim(int frame, bool forward)
    {

        //moving forward
        if (forward)
        {
            if (frame % 4 == 0 && current < 5)
            {
                current++;
            }
            else if (frame % 4 == 0)
            {
                current = 0;
            }
        }
        //moving backwards
        else
        {
            if (frame % 4 == 0 && current > 0)
            {
                current--;
            }
            else if (frame % 4 == 0)
            {
                current = 5;
            }
        }
        bodyObj.GetComponent<SpriteRenderer>().sprite = walk[current];
    }
    private void idleAnim()
    {
        current = 0;
        if (bodyObj != null) { bodyObj.GetComponent<SpriteRenderer>().sprite = stationary; }

    }
    private void FixedUpdate()
    {
        i++;
        if (player.moving && player.forwardMotion)
        {
            moveAnim(i, true);
        }
        else if (player.moving && !player.forwardMotion)
        {
            moveAnim(i, false);
        }
        else
        {
            idleAnim();
        }

    }

}
