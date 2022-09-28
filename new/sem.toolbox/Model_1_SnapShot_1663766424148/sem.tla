-------------------------------- MODULE sem --------------------------------
EXTENDS Integers
VARIABLES sem, l0, l1
TypeOK == (l0 \in 0..5)/\(l1 \in 0..5) /\ (sem \in 0..1)
vars == <<sem,l0,l1>>
Init == (l0=0)/\ (l1 = 0) /\ (sem =1)

P01 == (l0=0) /\ (l0' = 1) /\ UNCHANGED<<sem>>
P12 == (l0=1) /\ (l0' = 2) /\ UNCHANGED<<sem>>
P23 == (l0=2) /\ (l0' = 3) /\ (sem =1) /\ (sem'=0)
P34 == (l0=3) /\ (l0' = 4) /\ UNCHANGED<<sem>>
P45 == (l0=4) /\ (l0' = 5) /\ (sem=0)/\(sem'=1)
P50 == (l0=5) /\ (l0' = 0) /\ UNCHANGED<<sem>>
Pstall== UNCHANGED<<sem,l0>> 

P == P01 \/ P12 \/ P23 \/ P34 \/ P45 \/ P50\/Pstall

Q01 == (l1=0) /\ (l1' = 1) /\ UNCHANGED<<sem>>
Q12 == (l1=1) /\ (l1' = 2) /\ UNCHANGED<<sem>>
Q23 == (l1=2) /\ (l1' = 3) /\ (sem =1) /\ (sem'=0)
Q34 == (l1=3) /\ (l1' = 4) /\ UNCHANGED<<sem>>
Q45 == (l1=4) /\ (l1' = 5) /\ (sem = 0)/\(sem'=1)
Q50 == (l1=5) /\ (l1' = 0) /\ UNCHANGED<<sem>>
Qstall== UNCHANGED<<sem,l1>> 
Q == Q01 \/ Q12 \/ Q23 \/ Q34 \/ Q45 \/ Q50 \/Qstall

Next == (P /\ UNCHANGED<<l1>> )\/ (Q /\ UNCHANGED<<l0>>) 
Inv == ~((l0=3) /\ (l1=3))

StrongFairness == WF_ l0(P01)
            /\SF_ l0(P23)
            /\WF_ l0(P34)
            /\WF_ l0(P45)
            /\WF_ l0(P50)
            /\WF_ l1(Q01)
            /\SF_ l1(Q23)
            /\WF_ l1(Q34)
            /\WF_ l1(Q45)
            /\WF_ l1(Q50)


Wait1 == []((l0=2) => (<>(l0=3)))
Wait2 == []((l1=2) => (<>(l1=3)))

Fairness == WF_ l0(P01)
            /\WF_ l0(P23)
            /\WF_ l0(P34)
            /\WF_ l0(P45)
            /\WF_ l0(P50)
            /\WF_ l1(Q01)
            /\WF_ l1(Q23)
            /\WF_ l1(Q34)
            /\WF_ l1(Q45)
            /\WF_ l1(Q50)

Fairspec == Init /\ [][Next]_vars /\ Fairness 
            
            
            
=============================================================================
\* Modification History
\* Last modified Wed Sep 21 18:49:50 IST 2022 by 112001042
\* Created Wed Sep 21 17:10:05 IST 2022 by 112001042
