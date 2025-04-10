using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class musicAssets : MonoBehaviour
{
    [Header("crt_head1")]
    public musicKit crt1Kit;

    [Header("crt_head2")]//default
    public musicKit crt2Kit;

    [Header("hellstar.plus")]
    public musicKit hellstarKit;

    [Header("mute city")]
    public musicKit muteKit;

    public musicKit GetAssetByName(string name)
    {
        switch (name)
        {
            case "CRT_HEAD1":
                return crt1Kit;
            case "CRT_HEAD2":
                return crt2Kit;
            case "Dusqk":
                return null;
            case "hellstar plus":
                return hellstarKit;
            case "Mute City":
                return muteKit;
            default:
                return null;

        }
    }
}
