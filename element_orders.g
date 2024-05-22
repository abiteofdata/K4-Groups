#Define a group G first
cl := ConjugacyClasses(G);; 
Set(cl, x-> Order(Representative(x)));