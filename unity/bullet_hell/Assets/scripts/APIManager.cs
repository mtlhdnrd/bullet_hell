using SimpleJSON;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;
using UnityEngine.Networking;
//using System.Web.Script.Serialization;

public class APIManager : MonoBehaviour
{
    static public string baseUrl = "http://localhost/bullet_hell/web";
    public class Response{
        public bool success;
        public string player; // "p1" or "p2"
        public string data; // Stores the returned data
        public Response(bool success, string player, string data)
        {
            this.success = success;
            this.player = player;
            this.data = data;
        }
        public Response(bool success, string player)
        {
            this.success = success;
            this.player = player;
        }
    }

    public class LoginResponse : Response
    {
        public int points;
        public string username;
        public LoginResponse(bool success, string username, int points, string player) : base(success, player)
        {
            this.username = username;
            this.points = points;
        }
    }
    public class AssetResponse : Response
    {
        public Dictionary<string, bool> ownedAssetName;
        public AssetResponse(Dictionary<string, bool> ownedAssetName, bool success, string player):base(success, player)
        {
            this.ownedAssetName = ownedAssetName;
            this.success = success;
            this.player = player;
        }
    }
    static public IEnumerator RecordGameResult(string player1, string player2, int p1kills, int p1deaths, int p2kills, int p2deaths, Action<Response> callback){
        //Api endpoint
        string endpoint=$"/src/php/record_game_result.php";
        WWWForm form = new WWWForm();
        form.AddField("player1", player1);
        form.AddField("player2", player2);
        form.AddField("p1kills", p1kills.ToString()); // Send numbers as strings
        form.AddField("p1deaths", p1deaths.ToString());
        form.AddField("p2kills", p2kills.ToString());
        form.AddField("p2deaths", p2deaths.ToString());

        UnityWebRequest uwr = UnityWebRequest.Post(baseUrl + endpoint, form);
        yield return uwr.SendWebRequest();
        Response response = new Response(false, "", "");
        response.success = (uwr.result == UnityWebRequest.Result.Success);
        callback?.Invoke(response);
    }
    static public IEnumerator GetOwnedCharacters(string username, string player, Action<AssetResponse> callback)
    {
        //Define the api endpoint
        string endpoint = $"/profile/get_player_characters.php?username={username}";
        UnityWebRequest uwr = UnityWebRequest.Get(baseUrl + endpoint);
        yield return uwr.SendWebRequest();
        AssetResponse response = new AssetResponse(new Dictionary<string, bool>(), false, ""); // Initialize dictionary

        if (uwr.result == UnityWebRequest.Result.Success)
        {

            //Parse JSON using SimpleJSON
            JSONNode json = JSON.Parse(uwr.downloadHandler.text);
            if (json != null)
            {
                //Extract data from JSON
                response.success = true;
                response.player = player;

                if (json.IsArray)
                {
                    foreach (JSONNode item in json.AsArray)
                    {
                        // Check for both "name" and "active" keys, and their correct types.
                        if (item.HasKey("name") && item["name"].IsString &&
                            item.HasKey("active") && item["active"].IsNumber)
                        {
                            string name = item["name"];
                            int active = item["active"];
                            response.ownedAssetName.Add(name, Convert.ToBoolean(active)); // Add both name and active status
                        }
                        else
                        {
                            Debug.LogWarning("Item in array is missing 'name' or 'active' property, or has incorrect types: " + item.ToString());
                        }
                    }
                }
                else
                {
                    Debug.LogError("Expected JSON array, but received: " + json.Tag.ToString());
                    response.success = false;
                }
            }
            else
            {
                Debug.LogError("Failed to parse JSON response.");
                response.success = false;
            }
        }
        else
        {
            Debug.Log("Error: " + uwr.error + " - " + username);
            response.success = false;
        }
        callback(response); // Call the callback
    }
    static public IEnumerator AddMusicLoot(string username, string musicKit)
    {
        string endpoint = $"/src/php/add_music_pack_to_player.php";
        WWWForm form = new WWWForm();
        form.AddField("username", username);
        form.AddField("musicKit", musicKit);
        UnityWebRequest uwr = UnityWebRequest.Post(baseUrl + endpoint, form);
        yield return uwr.SendWebRequest();
        Response response = new Response(false, "", "");
        response.success = (uwr.result == UnityWebRequest.Result.Success);
    }
    static public IEnumerator AddSkinLoot(string username, string skinName)
    {
        string endpoint = $"/src/php/add_skin_to_player.php";
        WWWForm form = new WWWForm();
        form.AddField("username", username);
        form.AddField("skinName", skinName);
        UnityWebRequest uwr = UnityWebRequest.Post(baseUrl + endpoint, form);
        yield return uwr.SendWebRequest();
        Response response = new Response(false, "", "");
        response.success = (uwr.result == UnityWebRequest.Result.Success);
    }
    static public IEnumerator GetOwnedMusic(string username, string player, Action<AssetResponse> callback)
    {
        //Define the api endpoint
        string endpoint = $"/profile/get_player_musics.php?username={username}";
        UnityWebRequest uwr = UnityWebRequest.Get(baseUrl + endpoint);
        yield return uwr.SendWebRequest();
        AssetResponse response = new AssetResponse(new Dictionary<string, bool>(), false, ""); // Initialize dictionary

        if (uwr.result == UnityWebRequest.Result.Success)
        {
            //Debug.Log("Received: " + uwr.downloadHandler.text);

            //Parse JSON using SimpleJSON
            JSONNode json = JSON.Parse(uwr.downloadHandler.text);
            if (json != null)
            {
                //Extract data from JSON
                response.success = true;
                response.player = player;

                if (json.IsArray)
                {
                    foreach (JSONNode item in json.AsArray)
                    {
                        // Check for both "name" and "active" keys, and their correct types.
                        if (item.HasKey("name") && item["name"].IsString &&
                            item.HasKey("active") && item["active"].IsNumber)
                        {
                            string name = item["name"];
                            int active = item["active"];
                            Debug.Log("Asset: " + name + "\t Active: " + active);
                            response.ownedAssetName.Add(name, Convert.ToBoolean(active)); // Add both name and active status
                        }
                        else
                        {
                            Debug.LogWarning("Item in array is missing 'name' or 'active' property, or has incorrect types: " + item.ToString());
                        }
                    }
                }
                else
                {
                    Debug.LogError("Expected JSON array, but received: " + json.Tag.ToString());
                    response.success = false;
                }
            }
            else
            {
                Debug.LogError("Failed to parse JSON response.");
                response.success = false;
            }
        }
        else
        {
            Debug.Log("Error: " + uwr.error + " - " + username);
            response.success = false;
        }
        callback(response); // Call the callback
    }
    static public IEnumerator Login(string username, string password, string player, Action<LoginResponse> onSuccess, Action<LoginResponse> onFailure)
    {
        //Hashing the password
        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
        SHA512 shaM = new SHA512Managed();
        byte[] hashBytes = shaM.ComputeHash(passwordBytes);

        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < hashBytes.Length; i++)
        {
            builder.Append(hashBytes[i].ToString("x2"));
        }
        string hash = builder.ToString();

        string loginEndpoint = $"/login/login_check.php?username={username}&password={hash}";

        //Sending request
        UnityWebRequest uwr = UnityWebRequest.Get(baseUrl + loginEndpoint);
        yield return uwr.SendWebRequest();

        LoginResponse response = new LoginResponse(false, "null", 0, player);

        if (uwr.result == UnityWebRequest.Result.Success)
        {
            //Parse JSON using SimpleJSON
            JSONNode json = JSON.Parse(uwr.downloadHandler.text);

            if (json != null)
            {
                //Extract data from JSON
                response.success = true;
                response.username = json["username"];
                response.points = json["points"].AsInt;
            }
            else
            {
                Debug.LogError("Failed to parse JSON response.");
                response.success = false;
            }
            onSuccess?.Invoke(response);
        }
        else
        {
            Debug.Log("Error in login: " + uwr.error);
            response.success = false;
            onFailure?.Invoke(response);
        }
    }
}