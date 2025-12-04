
Wir haben keine ref zu den UIs

Option 1. GameManager scene die dann manuel alle globalen UI bekoomt per export, dumm wegen der Scene

Option 2. Eine nicht globale UI scene in der alle globalen UIs drin sind aufgebaut wie die state mashine... managed dann auch dass die UIs aufhoeren zu updatet wenn sie nicht mehr sichtbar sind.

Klingt bis jetzt am coolsten
Option 3. UI Referenz .tres die alle packed UI scenen hat und dann wieder von dem GameManager uebernommen wird dann holen sich alle sachen die eine referenz zu einem UI brauchen per z.B get_ui_via_Identifier(): einfach das UI und koennen den restlichen shit machen.
Kisten oeffenen interktions_comp fragt bei dim GameManager an wegen dem UI und dann setzt er auf das Inv den character und das ItemInv
oder du drueckst "M" und kommst in die Karte, die comp fuer das fragt an, bekommt, und "manages" das UI bis es wieder geschlossen wird.
Die globel kann auch tracken wer das UI gerade nutzt und verhindern dass zwei angezeit werden oder irgentwelche Bugs entstehen.