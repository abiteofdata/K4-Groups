# K4-Groups
A collection of GAP code relating to construction and analysis of K4-solvable groups. Read about GAP [here.](https://www.gap-system.org/)

In the following examples, we will use G as the alternating group on 7 elements. 

```
G := AlternatingGroup(7);
```

## Order of Elements
As prime graphs are determined by the presence of orders of elements in a group, it is important to be able to retrieve the list of orders of elements of any given group.
This technique is used in constructing **Table 4** of Appendix B, as well as for testing conjectures in important extensions.

```
cc := ConjugacyClasses(G);; 
Set(cc, x-> Order(Representative(x)));
```


## Orders of subgroups
It is also important to find the exact orders of subgroups present in a group, as seen in many of the proofs of Section 3. See the following.

```
Set(ConjugacyClassesSubgroups(G), x->Size(Representative(x)));
```

Sometimes, this is not enough, and the identification of the subgroup of a given order is needed. For example, this is seen in the Relevant Subgroups section of Table 1 in Appendix B.

```
cc := ConjugacyClassesSubgroups(G);;
fcc := Filtered(cc, x->Size(Representative(x)) = n);;
IdGroup(Representative(fcc[1]))
#Can iterate the number inside [] if there are multiple groups of the same order. GAP is 1-indexed.
```

The group ID can be searched online to find the exact description of the group. StructureDescription can also be used, but it can be inaccurate.


