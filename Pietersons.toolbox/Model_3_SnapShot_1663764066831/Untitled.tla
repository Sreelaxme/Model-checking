
------------------------------ MODULE Untitled ------------------------------
EXTENDS Integers
VARIABLES s0, s1, turn, inter0,inter1
vars == <<s0,s1,turn,inter0,inter1>>
TypeOK == s0 \in 0..7
        /\ s1 \in 0..7
        /\ turn \in 0..1
        /\inter0 \in BOOLEAN
        /\inter1 \in BOOLEAN
Init0 ==  (s0 = 0)/\(inter0=FALSE)
Init1 ==   (s1=0) /\ (inter1=FALSE)
Init == Init0 /\ (turn=0) /\ Init1
P01 == (s0=0)/\(s0'=1)/\ UNCHANGED<<turn,inter1,inter0>>
P12 == (s0=1)/\(s0'=2)/\ UNCHANGED<<turn,inter1,inter0>>
P23 == (s0=2)/\(s0'=3)/\(inter0'=TRUE)/\ UNCHANGED<<turn,inter1>>
P34 == (s0=3)/\(s0'=4)/\(turn'=1)/\ UNCHANGED<<inter1,inter0>>
P44 == (s0=4)/\(turn=1)/\(inter1=TRUE) /\UNCHANGED<<turn,inter1,inter0,s0>>
P45 == (s0=4)/\(turn =0 \/ inter1 = FALSE)/\(s0'=5)/\UNCHANGED<<turn,inter1,inter0>>
P56 == (s0=5)/\(s0'=6)/\UNCHANGED<<turn,inter1,inter0>>
P67 == (s0=6)/\(s0'=7)/\(inter0'=FALSE)/\UNCHANGED<<turn,inter1>>
P70 == (s0=7)/\(s0'=0)/\(UNCHANGED<<turn,inter1,inter0>>)

nextP == \/ P01 \/ P12 \/ P23 \/ P34 \/ P44 \/ P45 \/ P56 \/ P67 \/ P70

Q01 == (s1=0)/\(s1'=1)/\ UNCHANGED<<turn,inter1,inter0>>
Q12 == (s1=1)/\(s1'=2)/\ UNCHANGED<<turn,inter1,inter0>>
Q23 == (s1=2)/\(s1'=3)/\(inter1'=TRUE)/\ UNCHANGED<<turn,inter0>>
Q34 == (s1=3)/\(s1'=4)/\(turn'=1)/\ UNCHANGED<<inter1,inter0>>
Q44 == (s1=4)/\(s1'=4)/\(turn=0)/\(inter0=TRUE) /\ UNCHANGED<<turn,inter1,inter0>>
Q45 == (s1=4)/\(turn =1 \/ inter0 = FALSE)/\(s1'=5)/\UNCHANGED<<turn,inter1,inter0>>
Q56 == (s1=5)/\(s1'=6)/\UNCHANGED<<turn,inter1,inter0>>
Q67 == (s1=6)/\(s1'=7)/\(inter1'=FALSE)/\UNCHANGED<<turn,inter0>>
Q70 == (s1=7)/\(s1'=0)/\(UNCHANGED<<turn,inter1,inter0>>)

nextQ == \/Q01 \/ Q12 \/ Q23 \/ Q34 \/ Q44 \/ Q45 \/ Q56 \/ Q67 \/ Q70

Next == \/(nextP/\UNCHANGED<<s1>>)\/(nextQ/\UNCHANGED<<s0>>)\/UNCHANGED<<s0, s1, turn, inter0,inter1>>
invar == (~(s0=5 /\ s1=5))


Fairness == WF_ s0(P01) 
          /\WF_ s0(P23)
          /\WF_ s0(P34)
          /\WF_ s0(P45)
          /\WF_ s0(P56)
          /\WF_ s0(P67)
          /\WF_ s0(P70)
          /\WF_ s1(Q01) 
          /\WF_ s1(Q23)
          /\WF_ s1(Q34)
          /\WF_ s1(Q45)
          /\WF_ s1(Q56)
          /\WF_ s1(Q67)
          /\WF_ s1(Q70)
 FairSpec == Init /\ [][Next]_vars /\ Fairness
 
 Wait1 == []((inter0=TRUE)=> <> (s0=5))
 Wait2 == []((inter1=TRUE)=> <> (s1=5))

 ============================================================================
\* Modification History
\* Last modified Wed Sep 21 16:13:36 IST 2022 by 112001042
\* Created Wed Aug 24 16:59:58 IST 2022 by 112001042
