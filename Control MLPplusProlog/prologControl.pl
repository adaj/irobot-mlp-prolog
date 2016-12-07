perto(Value) :- Value < 0.4.

movimento(SEE,SE,SF,SD,SDD,ME,MD) :- perto(SEE), ME is 0.4, MD is 0.1.
movimento(SEE,SE,SF,SD,SDD,ME,MD) :- perto(SE), ME is 0.3, MD is 0.1.
movimento(SEE,SE,SF,SD,SDD,ME,MD) :- perto(SF), ME is 0.25, MD is -0.25.
movimento(SEE,SE,SF,SD,SDD,ME,MD) :- perto(SD), ME is 0.1, MD is 0.3.
movimento(SEE,SE,SF,SD,SDD,ME,MD) :- perto(SDD), ME is 0.1, MD is 0.4.
