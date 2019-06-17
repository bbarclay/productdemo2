/******************************************************************************
Copyright © 2016 Capgemini Group of companies. All rights reserved
(Subject to Limited Distribution and Restricted Disclosure Only.)
THIS SOURCE FILE MAY CONTAIN INFORMATION WHICH IS THE PROPRIETARY
INFORMATION OF Capgemini GROUP OF COMPANIES AND IS INTENDED FOR USE
ONLY BY THE ENTITY WHO IS ENTITLED TO AND MAY CONTAIN
INFORMATION THAT IS PRIVILEGED, CONFIDENTIAL, OR EXEMPT FROM
DISCLOSURE UNDER APPLICABLE LAW.
YOUR ACCESS TO THIS SOURCE FILE IS GOVERNED BY THE TERMS AND
CONDITIONS OF AN AGREEMENT BETWEEN YOU AND Capgemini GROUP OF COMPANIES.
The USE, DISCLOSURE REPRODUCTION OR TRANSFER OF THIS PROGRAM IS
RESTRICTED AS SET FORTH THEREIN.
******************************************************************************/

package com.cg.digi.utilities;

import java.util.Locale;

import javax.speech.Central;
import javax.speech.synthesis.SpeakableListener;
import javax.speech.synthesis.Synthesizer;
import javax.speech.synthesis.SynthesizerModeDesc;
import javax.speech.synthesis.Voice;

import com.cg.digi.logger.DigiLoggerUtils;
import com.cg.digi.logger.DigiLoggerUtils.LEVEL;

public class TexttoSpeech {


	public static void dospeak(String speak, String voicename) {
		String speaktext;
		speaktext = speak;
		String voiceName = voicename;
 
		try {
			SynthesizerModeDesc desc = new SynthesizerModeDesc(null, "general",
					Locale.US, null, null);
			Synthesizer synthesizer = Central.createSynthesizer(desc);
			synthesizer.allocate();
			synthesizer.resume();
			desc = (SynthesizerModeDesc) synthesizer.getEngineModeDesc();
			Voice[] voices = desc.getVoices();
			Voice voice = null;
			for (int i = 0; i < voices.length; i++) {
				if (voices[i].getName().equals(voiceName)) {
					voice = voices[i];
					break;
				}
			}
			synthesizer.getSynthesizerProperties().setVoice(voice);
			DigiLoggerUtils.log("Speaking Voice -->"+speak, LEVEL.info);
			//synthesizer.speakPlainText(speaktext, null);
			synthesizer.speak(speaktext, null);
			synthesizer.waitEngineState(Synthesizer.QUEUE_EMPTY);
			synthesizer.removeSpeakableListener((SpeakableListener) synthesizer);
		 
			
			
			synthesizer.deallocate();
	 
			
			
		} catch (Exception e) {
		/*	e.printStackTrace();
			String message = " missing speech.properties in " + System.getProperty("user.home") + "\n";*/
			DigiLoggerUtils.log("Unable to Speak Meassage : In TexttoSpeech API :: ", LEVEL.error);
		}
	}


}
