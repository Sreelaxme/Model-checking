------------------------------ MODULE Untitled ------------------------------
EXTENDS Integers
VARIABLES s1,s2,x

TypeOK == s1 \in 0..1 /\ s2 \in 0..1 /\ x \in 0..20

init0 == x=0
init1 == s1=0
init2 == s2=1

Init == init0 /\ init1 /\ init2

P0 == s1=0 /\ (IF x<20 THEN (x'=x+1 /\ UNCHANGED<<s1>>)
                ELSE (x'=0 /\ s1'=1))
P1 == s1=1 /\ (IF x<20 THEN (x'=x+1 /\ UNCHANGED<<s1>>)
                ELSE (x'=0 /\ s1'=0))
Q0 == s2=0 /\ (IF x<20 THEN (x'=x+1 /\ UNCHANGED<<s2>>)
                ELSE (x'=0 /\ s2'=1))
Q1 == s2=1 /\ (IF x<20 THEN (x'=x+1 /\ UNCHANGED<<s2>>)
                ELSE (x'=0 /\ s2'=0))

P == P0 \/ P1
Q == Q0 \/ Q1

Next == P /\ Q

invar == ~((s1=0/\s2=0)\/(s1=1/\s2=1))
=============================================================================
\* Modification History
\* Last modified Wed Aug 31 16:21:01 IST 2022 by 112001042
\* Created Wed Aug 31 16:07:05 IST 2022 by 112001042
