# K4-Groups
A collection of GAP code relating to construction and analysis of K4-solvable groups. Read about GAP [here.](https://www.gap-system.org/)

To run the code below, a group $G$ must first be defined. 

## Order of Elements
As prime graphs are determined by the presence of orders of elements in a group, it is important to be able to retrieve the list of orders of elements of any given group.
This technique is used in constructing **Table 5** of Appendix B, as well as for testing conjectures in important extensions.

```
Set(ConjugacyClasses(G), x-> Order(Representative(x)));
```

## Orders of Subgroups
It is also important to find the exact orders of subgroups present in a group, as seen in many of the proofs of Section 3. See the following.

```
Set(ConjugacyClassesSubgroups(G), x->Size(Representative(x)));
```

Sometimes, this is not enough, and the identification of the subgroup of a given order is needed. For example, this is seen in the Relevant Subgroups section of Table 1 in Appendix B.
For a given order $n$, we can do
```
cc := ConjugacyClassesSubgroups(G);;
fcc := Filtered(cc, x->Size(Representative(x)) = n);;
IdGroup(Representative(fcc[1]))
#Can iterate the number inside [] if there are multiple groups of the same order. GAP is indexed from 1.
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
to find all perfect groups that have $H$ has a composition factor. This is useful, but the syntax for $H$ is quite specific (see [GAP Manual 50.6](https://docs.gap-system.org/doc/ref/chap50_mj.html#X7A884ECF813C2026)).

## Fixed Points of a Representation
Finding fixed points of complex irreducible representations was a crucial part of our methods. Given a group $G$ and the order of some element $n$, the following code outputs whether elements of order $n$ have fixed points.
```
G := Image(IsomorphismPermGroup(G),G);; chars := Irr(G);; cc := ConjugacyClasses(G);; q := n;;
for j in [1..Length(chars)] do
Print(List(Filtered(cc, x->Order(Representative(x)) = q), x -> 1/Order(Representative(x)) * Sum([1..Order(Representative(x))], k -> (Representative(x)^k)^chars[j])));
od;
```
If at least one of the outputted lists is entirely made up of zeros, then elements of that order can act Frobeniusly.

## Group Constructions
In Sections **3.5** and **3.6**, some important groups are used in the construction of certain prime graphs. The existence of these groups is justified here.
In Section **3.5**, the group $3^5.M_{11}$ is given by
```
G := PerfectGroup(1924560,1)
```
In Section **3.6**, the proof of $\text{PSL}(3,4)$ states the existence of distinct groups $E_1$ and $E_2$ isomorphic to $\text{PSL}(3,4) \rtimes C_2$ that produce important prime graphs. The construction of these groups are given as follows.
```
G := PSL(3,4);; H := AutomorphismGroup(G);;
H := Image(IsomorphismPermGroup(H),H);; cc := ConjugacyClassesSubgroups(H);;
fcc := Filtered(cc, x->Size(Representative(x)) = 40320);;
E1 := Representative(fcc[1]);; E2 := Representative(fcc[2]);;
```
The prime graph complements of $E_1$ and $E_2$ are what we need. Alternatively, permutation representations of the above groups are given here.

## Miscellaneous Tips
As the size of groups increase, so does the need for more efficient algorithms and computational methods. Here are some simple, but important examples. 

Suppose we want to find the order of maximal subgroups of a group $G$. Instead of computing
```
    AllSubgroups(G);
```
and getting the order of every group in the list, it is much more efficient to do
```
    ConjugacyClassesMaximalSubgroups(G);
```
as conjugacy classes of subgroups have the same order, and GAP has a special method for the maximal subgroups. In another case, suppose we want to work with the extension $G = 6.A_7$. GAP seems to be faster in working with permutation groups, and it is useful to execute
```
    G := Image(IsomorphismPermGroup(G),G);
```
before doing other computations with this group.





