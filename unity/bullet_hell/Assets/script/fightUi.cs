using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UIElements;

public class fightUi : MonoBehaviour {
    public GameObject[] refsP1;
    public GameObject[] refsP2;
    //1st = name
    //2nd = rank
    //3rd = weapon


    public void init(passedData passedData) {

        //p1 ui elements
        refsP1[0].GetComponent<TextMeshProUGUI>().SetText(passedData.p1Name);
        refsP1[1].GetComponent<TextMeshProUGUI>().SetText(passedData.p1Rank);
        refsP1[2].GetComponent<TextMeshProUGUI>().SetText("bare hands");

        //p2 ui elements
        refsP2[0].GetComponent<TextMeshProUGUI>().SetText(passedData.p2Name);
        refsP2[1].GetComponent<TextMeshProUGUI>().SetText(passedData.p2Rank);
        refsP2[2].GetComponent<TextMeshProUGUI>().SetText("bare hands");
    }

}
