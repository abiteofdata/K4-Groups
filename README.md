# K4-Groups
A collection of GAP code relating to construction and analysis of K4-solvable groups.

## Order of Elements
As prime graphs are determined by the presence of orders of elements in a group, it is important to be able to retrieve the list of orders of elements of any given group.
This technique is used in constructing **Table 5** of Appendix B, as well as for testing conjectures in important extensions.
See [here.](elementsorders.g)

## Orders of subgroups
It is also important to find the exact orders of subgroups present in a group, as seen in many of the proofs of Section 3.
This is done [here.](subgroup_orders_1.g)
Sometimes, this is not enough, and the identification of the subgroup of that order is needed. For example, this is seen in the Relevant Subgroups section of Table 1 in Appendix B. 
This is done [here.](subgroup_orders_2.g).
