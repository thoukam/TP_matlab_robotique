%Exercice n°1 : Matrices

%1.1-Entrons la matrice M
M=[2 1 -1; 3 2 2; 5 4 3]

%1.2-Affichage de la 1ere colonne
M(1:3,1)

%1.3-Affichage de la 3e colonne
M(1:3,3)

%1.4- Affichage les éléments (2,2) et (2,3)
M(2,2)
M(2,3)

%1.5.Remplacons la valeur de l’élément (1,3) par 4
M(1,3)=4

%1.6.transposée de M
M_T=M.'

%1.7.déterminant de M
determinant=det(M)

%1.8. déduisons en l’inverse de M
M_inv=inv(M)

%trace et le rang de M
"le rang est: "
rank(M)
"la trace est: "
trace(M)


%eye(4), ones(5,4) and zeros(3)
eye(4) %matrice identité 4x4
ones(5,4) %matrice unitaire 5x4
zeros(3) %matrice null 3x3


