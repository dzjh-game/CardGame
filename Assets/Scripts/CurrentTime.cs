using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class CurrentTime : MonoBehaviour
{
    public Text CurrentTimeText;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        DateTime NowTime = DateTime.Now.ToLocalTime();
        CurrentTimeText.text = NowTime.ToString("HH:mm");
    }
}
