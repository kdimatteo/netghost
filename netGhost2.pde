/** 
 * netGhost2 - TTS version
 * don't forget to allow read access for Carnivore:
 * $sudo chmod 777 /dev/bpf*
 */

import org.rsg.carnivore.*;
import org.rsg.lib.Log;
import guru.ttslib.*;


CarnivoreP5 carnivore;
TTS tts;
String alpha;

void setup(){
  size(600, 400);
  background(000);
  
  Log.setDebug(true);
  alpha = "abcdefghijklmnopqrstuvwyz";
  
  tts = new TTS();
  //  tts.setPitchShift(0); 
  carnivore = new CarnivoreP5(this);
  carnivore.setShouldSkipUDP(true);
}

void packetEvent(CarnivorePacket myPacket){
  String s = myPacket.ascii().replace(" ", "");
  s = s.replaceAll("[^A-Za-z]", "");
  //s = s.replaceAll("[\\W]|_", "");  
  println(s);
  tts.speak(s); 
}


void draw(){}

void stop(){
  super.stop();
}




