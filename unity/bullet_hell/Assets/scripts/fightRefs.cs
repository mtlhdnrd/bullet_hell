using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class fightRefs : MonoBehaviour
{
    [Header("common")]

    //for gameManager
    public healthbar healthbarP1;
    public healthbar healthbarP2;
    public GameObject player1;
    public GameObject player2;
    public fightUi fightUi;
    public musicPlayer musicPlayer;//!!!!
    public musicShowFight musicShow;

    //for mapLoader
    public Light2D global, emission;
    public GameObject a1, a2, b1, b2, c1, c2, c3;

    [Header("specific")]
    public PolygonCollider2D ham_coll;
    public PolygonCollider2D ham_ladder;
    public PolygonCollider2D prac_coll;
    public PolygonCollider2D jap_coll;
    public PolygonCollider2D jap_parkour;
    public PolygonCollider2D jap_ladder;

}
