<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o pvsfwrite.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

;By Victor Lazzarini 2008

instr 1

asig oscili .5, 440, 1
fss  pvsanal asig, 1024,256,1024,0
pvsfwrite fss, "mypvs.pvx"
ase  pvsynth fss
outs ase,ase
endin

instr 2 ; must be called after instr 1 finishes

ktim timeinsts
fss  pvsfread ktim, "mypvs.pvx"
asig pvsynth fss
outs asig, asig

endin
</CsInstruments>
<CsScore> 
f1 0 16384 10 1

i1 0 1
i2 1 1
e
</CsScore>
</CsoundSynthesizer>
