require 'spec_helper'

module Iambic
  module Commands
    describe FindViolations do
      it 'finds violations' do
        stdin = StringIO.new Sample.find('to_be_or_not_to_be').text
        stdout = StringIO.new
        FindViolations.run [], stdin, stdout

        stdout.string.should == <<-end_stdout
Found violations on 26 lines:

1: QUESTION (K W EH1 S CH AH0 N, K W EH1 SH AH0 N) in "TO BE OR NOT TO BE THAT IS THE QUESTION"
2: WHETHER (W EH1 DH ER0, HH W EH1 DH ER0) in "WHETHER 'TIS NOBLER IN THE MIND TO SUFFER"
3: FORTUNE (F AO1 R CH AH0 N, F AO1 R CH UW0 N) in "THE SLINGS AND ARROWS OF OUTRAGEOUS FORTUNE"
4: TAKE (T EY1 K) in "OR TO TAKE ARMS AGAINST A SEA OF TROUBLES"
5: DIE (D AY1) in "AND BY OPPOSING END THEM TO DIE TO SLEEP"
6: NO (N OW1) in "NO MORE AND BY A SLEEP TO SAY WE END"
7: ACHE (EY1 K) in "THE HEART ACHE AND THE THOUSAND NATURAL SHOCKS"
8: CONSUMMATION (K AA2 N S AH0 M EY1 SH AH0 N) in "THAT FLESH IS HEIR TO 'TIS A CONSUMMATION"
10: AYE (AY1) in "TO SLEEP PERCHANCE TO DREAM AYE THERE'S THE RUB"
13: MUST (M AH1 S T) in "MUST GIVE US PAUSE THERE'S THE RESPECT"
14: CALAMITY (K AH0 L AE1 M AH0 T IY0, K AH0 L AE1 M IH0 T IY0) in "THAT MAKES CALAMITY OF SO LONG LIFE"
16: OPPRESSOR'S (AH0 P R EH1 S ER0 Z) in "THE OPPRESSOR'S WRONG THE PROUD MAN'S CONTUMELY"
17: DESPISED (D IH0 S P AY1 Z D) in "THE PANGS OF DESPISED LOVE THE LAW S DELAY"
18: INSOLENCE (IH1 N S AH0 L AH0 N S) in "THE INSOLENCE OF OFFICE AND THE SPURNS"
19: UNWORTHY (AH0 N W ER1 DH IY0) in "THAT PATIENT MERIT OF THE UNWORTHY TAKES"
20: MIGHT (M AY1 T) in "WHEN HE HIMSELF MIGHT HIS QUIETUS MAKE"
21: BARE (B EH1 R) in "WITH A BARE BODKIN WHO WOULD FARDELS BEAR"
22: UNDER (AH1 N D ER0) in "TO GRUNT AND SWEAT UNDER A WEARY LIFE"
24: UNDISCOVERED (AH2 N D IH0 S K AH1 V ER0 D) in "THE UNDISCOVERED COUNTRY FROM WHOSE BOURN"
25: NO (N OW1) in "NO TRAVELLER RETURNS PUZZLES THE WILL"
28: THUS (DH AH1 S) in "THUS CONSCIENCE DOES MAKE COWARDS OF US ALL"
29: RESOLUTION (R EH2 Z AH0 L UW1 SH AH0 N) in "AND THUS THE NATIVE HUE OF RESOLUTION"
30: PALE (P EY1 L) in "IS SICKLIED O'ER WITH THE PALE CAST OF THOUGHT"
31: ENTERPRISES (EH1 N T ER0 P R AY2 Z AH0 Z, EH1 N T ER0 P R AY2 Z IH0 Z, EH1 N ER0 P R AY2 Z AH0 Z, EH1 N ER0 P R AY2 Z IH0 Z, EH1 N T ER0 P R AY2 Z IH0 Z, EH1 N ER0 P R AY2 Z IH0 Z) in "AND ENTERPRISES OF GREAT PITCH AND MOMENT"
34: ORISONS (AO1 R IH0 S AH0 N Z) in "THE FAIR OPHELIA NYMPH IN THY ORISONS"
35: MY (M AY1) in "BE ALL MY SINS REMEMBERED"
        end_stdout
      end
    end
  end
end

