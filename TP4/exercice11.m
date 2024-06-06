function inverse_kinematics_RR
    % Entrée des paramètres de l'utilisateur
    x = input('Entrez la coordonnée x de l''effecteur : ');
    y = input('Entrez la coordonnée y de l''effecteur : ');

    % Calcul des angles des articulations
    q2 = sqrt(x^2 + y^2 ); % Deux solutions: -sqrt(x^2 + y^2) ou +sqrt(x^2 + y^2)
    q1 = atan2(y, x);

    % Conversion en degrés
    q1 = rad2deg(q1);
    q2 = rad2deg(q2);

    % Affichage des résultats
    fprintf('Les angles des articulations sont :\n');
    fprintf('q1: %.2f degrés\n', q1);
    fprintf('q2: %.2f degrés\n', q2);
end

% Vérification avec des valeurs d'exemple
inverse_kinematics_RR;
