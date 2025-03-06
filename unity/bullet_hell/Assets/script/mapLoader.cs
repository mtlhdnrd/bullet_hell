using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class mapLoader : MonoBehaviour
{
    [Header("misc")]
    public Light2D global;
    public Light2D emission;
    public string activeMap;
    public int current1, current2;
    public int i = 0;
    public int divide;
    public GameObject a1, a2, b1, b2, c1, c2, c3;


    [Header("ham_factory refs")]
    [SerializeField] Sprite ham_A1;
    [SerializeField] Sprite ham_A2;
    [SerializeField] Sprite ham_B1;
    [SerializeField] Sprite ham_B2;
    [SerializeField] Sprite ham_C1;
    [SerializeField] Sprite ham_C2;
    [SerializeField] Sprite ham_C3;
    [SerializeField] Sprite ham_emission;
    public PolygonCollider2D ham_coll;
    public Color ham_ecolor;

    [Header("practice_refs")]
    [SerializeField] Sprite prac_A1;
    [SerializeField] Sprite prac_A2;
    [SerializeField] Sprite prac_B1;
    [SerializeField] Sprite prac_B2;
    public PolygonCollider2D prac_coll;
    public Color prac_ecolor;
    public Sprite[] prac_C1;
    public Sprite[] prac_C2;
    public Sprite[] prac_emission;


    [Header("medieval_japan_refs")]
    [SerializeField] Sprite jap_A2;
    [SerializeField] Sprite jap_B1;
    [SerializeField] Sprite jap_B2;
    [SerializeField] Sprite jap_C1;
    [SerializeField] Sprite jap_C2;
    public PolygonCollider2D jap_coll;
    public PolygonCollider2D jap_parkour;
    public Color jap_ecolor;
    public Sprite[] jap_A1;
    public Sprite[] jap_emission;


    public void init(fightRefs fightRefs)
    {
        a1 = fightRefs.a1;
        a2 = fightRefs.a2;
        b1 = fightRefs.b1;
        b2 = fightRefs.b2;
        c1 = fightRefs.c1;
        c2 = fightRefs.c2;
        c3 = fightRefs.c3;
        emission = fightRefs.emission;
        global = fightRefs.global;

        prac_coll = fightRefs.prac_coll;
        ham_coll= fightRefs.ham_coll;
        jap_coll = fightRefs.jap_coll;
        jap_parkour = fightRefs.jap_parkour;
        
    }
    public bool loadMap(string mapName)
    {
        i = 0;
        current1 = 0;
        current2 = 0;
        if (mapName == "ham")
        {
            //level layers
            layerUpdate("A1", a1, ham_A1);
            layerUpdate("A2", a2, ham_A2);
            layerUpdate("B1", b1, ham_B1);
            layerUpdate("B2", b2, ham_B2);
            layerUpdate("C1", c1, ham_C1);
            layerUpdate("C2", c2, ham_C2);
            layerUpdate("C3", c3, ham_C3);

            //collision
            collUpdate(mapName);

            //lights
            emission.intensity = 1;
            emission.color = ham_ecolor;
            emission.lightCookieSprite = ham_emission;

            //active map
            activeMap = "ham";
            return true;
        }
        else if (mapName == "prac")
        {
            //level layers
            layerUpdate("A1", a1, prac_A1);
            layerUpdate("A2", a2, prac_A2);
            layerUpdate("B1", b1, prac_B1);
            layerUpdate("B2", b2, prac_B2);
            //c1,c2 are managed by a per-frame basis
            layerUpdate("C3", c3, null);

            //collision
            collUpdate(mapName);

            //lights
            emission.intensity = .85f;
            emission.color = prac_ecolor;

            //active map
            activeMap = "prac";
            return true;
        }
        else if (mapName == "jap")
        {
            //level layers
            layerUpdate("A2", a2, jap_A2);
            layerUpdate("B1", b1, jap_B1);
            layerUpdate("B2", b2, jap_B2);
            layerUpdate("C1", c1, jap_C1);
            layerUpdate("C2", c2, jap_C2);
            layerUpdate("C3", c3, null);

            //collision
            collUpdate(mapName);

            //lights
            emission.intensity = 1;
            emission.color = jap_ecolor;

            //active map
            activeMap = "jap";
            return true;
        }
        else
        {
            return false;
        }
    }

    private void layerUpdate(string name, GameObject obj, Sprite toLoad)
    {
        obj.GetComponent<SpriteRenderer>().sprite = toLoad;
    }

    private void collUpdate(string mapName)
    {
        if (mapName == "ham")
        {
            ham_coll.enabled = true;
            prac_coll.enabled = false;
            jap_parkour.enabled = false;
            jap_coll.enabled = false;

        }
        else if (mapName == "prac")
        {
            ham_coll.enabled = false;
            prac_coll.enabled = true;
            jap_parkour.enabled = false;
            jap_coll.enabled = false;
        }
        else if (mapName == "jap")
        {
            ham_coll.enabled = false;
            prac_coll.enabled = false;
            jap_parkour.enabled = true;
            jap_coll.enabled = true;
        }
    }

    private void layerAnim(int frame)
    {

        if (activeMap == "prac")
        {
            if (frame % 4 == 0 && current1 < 5)
            {
                current1++;
            }
            else if (frame % 4 == 0)
            {
                current1 = 0;
            }
            layerUpdate("C1", c1, prac_C1[current1]);
            layerUpdate("C2", c2, prac_C2[current1]);
            emission.lightCookieSprite = prac_emission[current1];
        }
        else if (activeMap == "jap")
        {
            if (frame % 4 == 0 && current1 < jap_A1.Length - 1)
            {
                current1++;
            }
            else if (frame % 4 == 0)
            {
                current1 = 0;
            }
            if (frame % 4 == 0 && current2 < jap_emission.Length - 1)
            {
                current2++;
            }
            else if (frame % 4 == 0)
            {
                current2 = 0;
            }
            layerUpdate("A1", a1, jap_A1[current1]);
            emission.lightCookieSprite = jap_emission[current2];
        }
    }

    //for dynamic/animated stuff on any map
    private void FixedUpdate()
    {
        i++;
        layerAnim(i);
    }
}
