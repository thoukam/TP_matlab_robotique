function inverse_kinematics
    % Demande de saisie des paramètres par l'utilisateur
    x = input('Entrez la coordonnée x: ');
    y = input('Entrez la coordonnée y: ');
    l1 = input('Entrez la longueur du premier segment l1: ');
    l2 = input('Entrez la longueur du deuxième segment l2: ');

    % Calcul de q2
    q2 = acos((x^2 + y^2 - l1^2 - l2^2) / (2 * l1 * l2));
    
    % Calcul de q1
    q1 = atan2(y * (l1 + l2 * cos(q2)) - x * l2 * sin(q2), x * (l1 + l2 * cos(q2)) + y * l2 * sin(q2));

    % Conversion des angles en degrés
    q1 = rad2deg(q1);
    q2 = rad2deg(q2);

    % Affichage des résultats
    fprintf('L''angle q1 est: %.2f degrés\n', q1);
    fprintf('L''angle q2 est: %.2f degrés\n', q2);
end

% Appel de la fonction
inverse_kinematics;

