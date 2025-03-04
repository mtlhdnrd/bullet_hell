using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class musicKit : MonoBehaviour
{
    [Header("artist")]
    public string artist;

    [Header("cover art")]
    public Sprite coverart;

    [Header("Fight 1")]
    public string titleF1;
    public AudioClip fight1;

    [Header("Fight 2")]
    public string titleF2;
    public AudioClip fight2;

    [Header("Fight 3")]
    public string titleF3;
    public AudioClip fight3;

    [Header("Menu 1")]
    public string titleM1;
    public AudioClip menu1;

    [Header("Menu 2")]
    public string titleM2;
    public AudioClip menu2;

    [Header("MVP")]
    public string titleMVP;
    public AudioClip MVP;

}
