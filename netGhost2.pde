/** 
 *  sudo chmod 777 /dev/bpf*
 */

import ddf.minim.*;
import org.rsg.carnivore.*;
import org.rsg.lib.Log;
import guru.ttslib.*;


Minim minim;
AudioSample a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
CarnivoreP5 carnivore;
String ls;
String letters[];
HashMap <String, AudioSample> hm = new HashMap(); 
TTS tts;

void setup(){
  
  size(600, 400);
  background(000);
  Log.setDebug(true);
  tts = new TTS();
  
  minim = new Minim(this);
  carnivore = new CarnivoreP5(this);
//  ls = "abcdefghijklmnopqrstuvwyz"; //something is wrong with x.mp3
//  letters = ls.split("");

  for(String index : ls.split("")){
    if(index.length()>=1){
      String asset = index + ".mp3";
      
      hm.put(index, minim.loadSample(asset, 512));
      println("loaded " + asset);
    }  
  } 
  
}

void packetEvent(CarnivorePacket myPacket){
  tts.speak(myPacket.ascii()); 
}

/*
void sayIt(AudioSample sample){
  sample.trigger();
  delay(200); //spread them out
}

void packetEvent(CarnivorePacket myPacket){
  String myP = myPacket.ascii();   
  if(myP.length() > 1){
    for(String letter : myP.split("")){
      if(ls.indexOf(letter) != -1){
      
        AudioSample sample = hm.get(letter);
        
        if(sample != null){
          sayIt(sample);
          println(letter);
         
        }
        
      }
    }  
  }
}
*/

void draw(){}

void stop(){
  for(String letter : ls.split("")){
    if(ls.indexOf(letter) != -1){
      AudioSample sample = hm.get(letter);
      if(sample != null){
        sample.close();
      }  
  }
  }  
  minim.stop();
  super.stop();
}




