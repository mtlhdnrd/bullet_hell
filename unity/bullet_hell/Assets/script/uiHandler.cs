using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UIElements;

public class uiHandler : MonoBehaviour {
    public GameObject[] refsP1;
    //1st = name
    //2nd = rank
    //3rd = weapon

    public Vector2 position;
    public Vector2 lineheight;

    public void init(string[] passedData) {
        refsP1[0].GetComponent<TextMeshProUGUI>().SetText(passedData[0]);
        refsP1[1].GetComponent<TextMeshProUGUI>().SetText(passedData[1]);
        refsP1[2].GetComponent<TextMeshProUGUI>().SetText("bare hands");

    }

}
