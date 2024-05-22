#Define G first
cc := ConjugacyClassesSubgroups(G);;
fcc := Filtered(cc, x->Size(Representative(x)) = n);;
#Can iterate the number inside [] if there are multiple groups of the same order. GAP is 1-indexed.
IdGroup(Representative(fcc[1]))
