<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o pvsfread.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100 
ksmps = 32 
0dbfs  = 1 
nchnls = 2

; analyze sound file, creating a PVOC-EX file
ires1 system_i 1,{{ pvanal stereoJungle.wav stereoJungle.pvx }} ; default settings

instr 1
; create a PVOC-EX (*.pvx) file with PVANAL first
idur  filelen   "stereoJungle.pvx"      ;find duration of (stereo) analysis file
kpos  line      0,p3,idur               ;to ensure we process whole file
fsigr pvsfread  kpos,"stereoJungle.pvx", 1  ;create fsig from right channel
aout  pvsynth   fsigr                   ;resynthesise it
      outs  aout, aout

endin
</CsInstruments>
<CsScore>

i 1 0 20    ; slow down
i 1 21 1    ; speed up
e
</CsScore>
</CsoundSynthesizer>
