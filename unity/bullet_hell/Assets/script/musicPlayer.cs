using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class musicPlayer : MonoBehaviour
{
    private string scenario;
    public Sprite activeCover;//cover of current music
    public string activeTitle;
    public AudioSource player;
    public musicKit packP1;
    public musicKit packP2;
    //ui element for showing what we play
    //ui element for the artwork


    public void init(musicKit activePack1, musicKit activePack2, float vol, string scenarioRef)
    {
        scenario = scenarioRef;
        player.volume = vol;
        player.loop = false;
        packP1 = activePack1;
        packP2 = activePack2;
        playMusic(scenario);
    }

    public void changePack(musicKit newPack, int pNum)
    {
        //pnum1 -> player1
        if (pNum == 1)
        {
            packP1 = newPack;
        }
        //pnum2+any -> player2 
        else
        {
            packP2 = newPack;
        }
    }

    public void playMusic(string scenario)
    {
        player.Stop();
        player.clip = null;

        if (scenario == "p1win" && packP1 != null)
        {
            activeCover = packP1.coverart;
            activeTitle = packP1.titleMVP;
            player.clip = packP1.MVP;
        }
        else if (scenario == "p2win" && packP2 != null)
        {
            activeCover = packP2.coverart;
            activeTitle = packP2.titleMVP;
            player.clip = packP2.MVP;

        }
        else if (scenario == "p1win" || scenario == "p2win")//p1,p2 is null
        {
            //default kit
        }


        else if (scenario == "fight")
        {
            int current = UnityEngine.Random.Range(0, 2);
            //random if p1 or p2 every time
            if (UnityEngine.Random.Range(0, 1) == 1 && packP1 != null)
            {
                //which music from pack1
                activeCover = packP1.coverart;
                if (current == 0)
                {
                    activeTitle = packP1.titleF1;
                    player.clip = packP1.fight1;
                }
                else if (current == 1)
                {
                    activeTitle = packP1.titleF2;
                    player.clip = packP1.fight2;
                }
                else
                {
                    activeTitle = packP1.titleF3;
                    player.clip = packP1.fight3;
                }
            }
            else if (packP2 != null)
            {
                //which music from pack2
                activeCover = packP2.coverart;
                if (current == 0)
                {

                    activeTitle = packP2.titleF1;
                    player.clip = packP2.fight1;
                }
                else if (current == 1)
                {
                    activeTitle = packP2.titleF2;
                    player.clip = packP2.fight2;
                }
                else
                {
                    activeTitle = packP2.titleF3;
                    player.clip = packP2.fight3;
                }
            }
        }
        else if (scenario == "menu")
        {
            //random track number
            int current = UnityEngine.Random.Range(0, 1);

            //random player number
            if (UnityEngine.Random.Range(0, 1) == 1 && packP1 != null)
            {
                //random from pack1
                activeCover = packP1.coverart;
                if (current == 0)
                {
                    activeTitle = packP1.titleM1;
                    player.clip = packP1.menu1;
                }
                else
                {
                    activeTitle = packP1.titleM2;
                    player.clip = packP1.menu2;

                }

            }
            else if (packP2 != null)
            {
                //random from pack2
                activeCover = packP2.coverart;
                if (current == 0)
                {
                    activeTitle = packP2.titleM1;
                    player.clip = packP2.menu1;
                }
                else
                {
                    activeTitle = packP2.titleM2;
                    player.clip = packP2.menu2;

                }
            }
        }
        player.Play();
    }

    private void Update()
    {
        //music. always.
        if (!player.isPlaying)
        {
            playMusic(scenario);
        }
    }
}
