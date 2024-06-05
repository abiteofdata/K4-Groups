# K4-Groups
A collection of GAP code relating to construction and analysis of K4-solvable groups. Read about GAP [here.](https://www.gap-system.org/)

In the following examples, we will use $G = A_7$. 

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


## Orders of Subgroups
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

## Perfect Groups Library
GAP has a list of all perfect groups with orders smaller than $2 \cdot 10^6$. To access this library, we can use
```
DisplayInformationPerfectGroups(n);
```
for a positive integer $n \leq 2 \cdot 10^6$, and the library will display all perfect groups with that order. Alternatively, for a given group $H$, we can use
```
SizeNumbersPerfectGroups(H);
```
to find all perfect groups that have $H$ has a composition factor. This is quite useful, but the syntax for H is quite specific (see [GAP Manual 50.6](https://docs.gap-system.org/doc/ref/chap50_mj.html#X7A884ECF813C2026)).


