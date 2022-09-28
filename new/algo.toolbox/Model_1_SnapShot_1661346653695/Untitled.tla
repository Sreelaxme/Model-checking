------------------------------ MODULE Untitled ------------------------------
EXTENDS Integers
VARIABLES s0,s1,inst0,inst1,turn

TypeOK == s0 \in 0..7 /\ s1 \in 0..7 /\ turn \in 0..1 /\inst0 \in {TRUE, FALSE} /\ inst1 \in {TRUE, FALSE}
Init0 == (inst0=FALSE /\ s0=0)
Init1 == (inst1=FALSE /\ s1=0)
Init2 == (turn = 0)

Init == (Init0 /\ Init1 /\ Init2)
P01 == (s0=0 /\ s0' = 1) /\ UNCHANGED<<turn,inst0,inst1>>
P12 == (s0=1 /\ s0' = 2) /\ UNCHANGED<<turn,inst0,inst1>>
P23 == (s0=2 /\ s0' = 3) /\ inst0'=TRUE /\ UNCHANGED<<turn,inst1>>
P34 == (s0=3 /\ s0' = 4) /\turn'=1 /\ UNCHANGED<<inst0,inst1>>
P44 == (s0=4 /\ s0' = 4) /\turn=1 /\inst1=TRUE /\ UNCHANGED<<inst0,inst1,turn>>
P45 == (s0=4 /\ s0' = 5) /\ (turn=0 \/inst1=FALSE ) /\ UNCHANGED<<inst0,turn,inst1>>
P56 == (s0=5 /\ s0' = 6) /\ UNCHANGED<<turn,inst0,inst1>>
P67 == (s0=6 /\ s0' = 7) /\ inst0'=FALSE /\ UNCHANGED<<turn,inst1>>
P70 == (s0=7 /\ s0' = 0) /\ UNCHANGED<<turn,inst0,inst1>>

P == P01 \/ P12 \/ P23 \/ P34 \/ P44 \/ P45 \/ P56 \/ P67 \/ P70 
Q01 == (s1=0 /\ s1' = 1) /\ UNCHANGED<<turn,inst0,inst1>>
Q12 == (s1=1 /\ s1' = 2) /\ UNCHANGED<<turn,inst0,inst1>>
Q23 == (s1=2 /\ s1' = 3) /\ inst1'=TRUE /\ UNCHANGED<<turn,inst0>>
Q34 == (s1=3 /\ s1' = 4) /\turn'=0 /\ UNCHANGED<<inst0,inst1>>
Q44 == (s1=4 /\ s1' = 4) /\turn=0 /\inst1=TRUE /\ UNCHANGED<<inst0,inst1,turn>>
Q45 == (s1=4 /\ s1' = 5) /\(turn=1 \/inst1=FALSE )/\ UNCHANGED<<inst0,inst1,turn>>
Q56 == (s1=5 /\ s1' = 6) /\ UNCHANGED<<turn,inst0,inst1>>
Q67 == (s1=6 /\ s1' = 7) /\ inst1'=FALSE /\ UNCHANGED<<turn,inst0>>
Q70 == (s1=7 /\ s1' = 0) /\ UNCHANGED<<turn,inst0,inst1>>

Q == Q01 \/ Q12 \/ Q23 \/ Q34 \/ Q44 \/ Q45 \/ Q56 \/ Q67 \/ Q70

Next == (P /\ UNCHANGED<<s1>>) \/ (Q /\ UNCHANGED <<s0>>)
INVARIANT == (~(s0=5 /\ s1=5))


=============================================================================
\* Modification History
\* Last modified Wed Aug 24 18:40:48 IST 2022 by 112001042
\* Created Wed Aug 24 18:39:56 IST 2022 by 112001042
