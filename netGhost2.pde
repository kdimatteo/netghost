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

void setup(){
  
  size(600, 400);
  background(000);
  Log.setDebug(true);
  tts = new TTS();
  tts.setPitchShift(-1); 
  carnivore = new CarnivoreP5(this);
}

void packetEvent(CarnivorePacket myPacket){
  tts.speak(myPacket.ascii()); 
}


void draw(){}

void stop(){
  super.stop();
}




