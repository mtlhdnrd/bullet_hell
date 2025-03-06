using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class fightRefs : MonoBehaviour
{
    //for gameManager
    public healthbar healthbarP1;
    public healthbar healthbarP2;
    public GameObject player1;
    public GameObject player2;
    public fightUi fightUi;
    public musicPlayer musicPlayer;//!!!!

    //for mapLoader
    public Light2D global, emission;
    public GameObject a1, a2, b1, b2, c1, c2, c3;
    public PolygonCollider2D prac_coll;
    public PolygonCollider2D ham_coll;
    public PolygonCollider2D jap_coll;
    public PolygonCollider2D jap_parkour;
 

}
