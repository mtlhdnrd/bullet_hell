using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.ExceptionServices;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class gunHolder : MonoBehaviour
{

    [Header("offset-sheet")]
    //values: posY, posX, angleZ
    public float[] HCO = new float[3];//hand close offset
    public float[] HFO = new float[3];//hand far offset
    public float[] WPO = new float[3];//weapon offset
    private char[] weaponHands;

    [Header("player refs")]
    public GameObject handClose;
    public GameObject handFar;
    public GameObject equipped = null;
    public GameObject meleeAnim;
    public GameObject player;
    public GameObject head;
    public bodyAnim playerAnim;
    public scanner scan;
    public TextMeshProUGUI equippedText;
    public GameObject magInfo;
    public TextMeshProUGUI magInfoText;
    public Vector3 offset;

    [Header("weapon script ref")]
    public weapon weaponScript;
    public float recoil;
    public float recoilBase;
    public float recoilSpeed;
    public void set()
    {
        offset = new Vector3(1f, -1f);
        hideMagInfo();
        equipped = null;
        weaponScript = null;
        meleeAnim.transform.localPosition = Vector2.zero;
        meleeAnim.transform.localRotation = Quaternion.Euler(0, 0, 0);
        bareHandsOffset();
    }
    private void updateMaginfo()
    {
        if (equipped != null && weaponScript.showMag)
        {
            magInfo.transform.position = player.transform.position + offset;
            magInfoText.SetText(weaponScript.magazine.ToString());
            magInfoText.color = new Color(1, 1, 1, 1);
        }
    }
    private void hideMagInfo()
    {
        magInfoText.color = new Color(1, 1, 1, 0);
    }
    public void lookAt(Vector2 direction)
    {
        if (direction.x < 0)
        {
            transform.rotation = Quaternion.AngleAxis(Mathf.Atan2(direction.y * -1, direction.x * -1) * Mathf.Rad2Deg - recoil, Vector3.forward);
        }
        else
        {
            transform.rotation = Quaternion.AngleAxis(Mathf.Atan2(direction.y * -1, direction.x * -1) * Mathf.Rad2Deg + recoil, Vector3.forward);
        }
        head.transform.rotation = Quaternion.AngleAxis(Mathf.Atan2(direction.y * -1, direction.x * -1) * Mathf.Rad2Deg, Vector3.forward);
        flip(direction.x < 0);
    }
    public void flip(bool right)
    {
        //Church: Well, give it a flip.
        //Tucker: I don't wanna flip it.
        //Church: What's the problem?
        //Tucker: It's in a weird place.
        //...
        //Church: Did you try wiggling it?
        //Tucker: No way, I'm not wiggling your dongle.
        //Church: Oh, stop being a baby. Just wiggle it.
        if (right)
        {

            //---HEAD---
            head.GetComponentInChildren<SpriteRenderer>().flipY = false;
            //---HANDCLOSE---
            handClose.transform.localRotation = Quaternion.Euler(0, 0, HCO[2]);
            handClose.transform.localPosition = new Vector3(HCO[0], HCO[1], handClose.transform.localPosition.z);
            handClose.transform.GetComponent<SpriteRenderer>().flipY = false;
            //---HANDFAR---
            handFar.transform.localRotation = Quaternion.Euler(0, 0, HFO[2]);
            handFar.transform.localPosition = new Vector3(HFO[0], HFO[1], handFar.transform.localPosition.z);
            handFar.transform.GetComponent<SpriteRenderer>().flipY = false;

            //---WEAPON---
            if (equipped != null)
            {
                equipped.transform.localRotation = Quaternion.Euler(0, 0, WPO[2]);
                equipped.transform.localPosition = new Vector3(WPO[0], WPO[1], equipped.transform.localPosition.z);
                weaponScript.flip(right);
            }
            if (weaponScript != null && !weaponScript.ranged)
            {
                meleeAnim.transform.localPosition = new Vector2(weaponScript.weaponAnimCurrent.x, weaponScript.weaponAnimCurrent.y);
                meleeAnim.transform.localRotation = Quaternion.Euler(0, 0, weaponScript.weaponAnimCurrent.z);
            }
        }
        else
        {
            //---HEAD---
            head.GetComponentInChildren<SpriteRenderer>().flipY = true;
            //---HANDCLOSE---
            handClose.transform.localRotation = Quaternion.Euler(0, 0, -HCO[2]);
            handClose.transform.localPosition = new Vector3(HCO[0], -HCO[1], handClose.transform.localPosition.z);
            handClose.transform.GetComponent<SpriteRenderer>().flipY = true;

            //---HANDFAR---
            handFar.transform.localRotation = Quaternion.Euler(0, 0, -HFO[2]);
            handFar.transform.localPosition = new Vector3(HFO[0], -HFO[1], handFar.transform.localPosition.z);
            handFar.transform.GetComponent<SpriteRenderer>().flipY = true;

            //---WEAPON---
            if (equipped != null)
            {
                weaponScript.flip(right);
                equipped.transform.localRotation = Quaternion.Euler(0, 0, -WPO[2]);
                equipped.transform.localPosition = new Vector3(WPO[0], -WPO[1], equipped.transform.localPosition.z);

            }
            if (weaponScript != null && !weaponScript.ranged)
            {
                meleeAnim.transform.localPosition = new Vector2(weaponScript.weaponAnimCurrent.x, weaponScript.weaponAnimCurrent.y);
                meleeAnim.transform.localRotation = Quaternion.Euler(0, 0, weaponScript.weaponAnimCurrent.z);
            }
        }
    }
    public void setOffset()//executes on Equip
    {
        //grab values from children
        HCO = weaponScript.handCloseOffset;
        HFO = weaponScript.handFarOffset;
        WPO = weaponScript.weaponOffset;

        //set grabbed values to sprites

        //close hand
        handClose.transform.localPosition = new Vector2(HCO[0], HCO[1]);
        handClose.transform.localRotation = Quaternion.Euler(0, 0, HCO[2]);

        //far hand
        handFar.transform.localPosition = new Vector2(HFO[0], HFO[1]);
        handFar.transform.localRotation = Quaternion.Euler(0, 0, HFO[2]);
        //equipped weapon
        equipped.transform.localPosition = new Vector2(WPO[0], WPO[1]);
        equipped.transform.localRotation = Quaternion.Euler(0, 0, WPO[2]);
    }
    private void bareHandsOffset()
    {
        HCO = new float[] { -.4f, .3f, -65 };
        HFO = new float[] { -.7f, .3f, -65 };
    }
    public void Fire()
    {
        if (equipped != null)
        {
            weaponScript.Fire();
        }
    }
    public void AltFire()
    {
        if (equipped != null)
        {
            weaponScript.AltFire();
        }
    }
    public void Equip()
    {
        GameObject toEquip = scan.getEquippable();
        if (toEquip != null)
        {
            Drop();
            equipped = toEquip;
            weaponScript = equipped.GetComponent<weapon>();//set weaponscript
            //weaponscript interactions
            weaponScript.equip(meleeAnim);
            equippedText.SetText(weaponScript.weaponName);
            //reset positions
            equipped.transform.localPosition = Vector3.zero;
            equipped.transform.localRotation = Quaternion.Euler(0, 0, 0);
            setOffset();
            weaponHands = weaponScript.weaponHands;
            playerAnim.updateHands(weaponHands[0], weaponHands[1]);
        }
    }
    public void Drop()
    {
        //set hands, forfeit control
        if (equipped != null)
        {
            weaponScript.equip(null);
            equipped = null;
            weaponScript = null;
            //UI+sprite updates
            equippedText.SetText("bare bands");
            playerAnim.updateHands('b', 'b');//fists
            hideMagInfo();
            bareHandsOffset();//fists offset
        }
    }
    private void Update()
    {
        updateMaginfo();
    }
    private void FixedUpdate()
    {
        if (weaponScript != null)
        {
            recoil = weaponScript.currentRecoil;
        }
    }
}