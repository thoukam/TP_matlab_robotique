function inverse_kinematics_NR
    % Demande de saisie des paramètres par l'utilisateur
    x = input('Entrez la coordonnée x: ');
    y = input('Entrez la coordonnée y: ');
    l1 = input('Entrez la longueur du premier segment l1: ');
    l2 = input('Entrez la longueur du deuxième segment l2: ');

    % Vérifier les valeurs initiales
    if x == 0 && y == 0
        error('Les coordonnées x et y ne peuvent pas être toutes les deux nulles');
    end

    % Estimation initiale des angles
    q1 = atan2(y, x);
    q2 = acos((x^2 + y^2 - l1^2 - l2^2) / (2 * l1 * l2));

    if isnan(q2)
        error('Les paramètres fournis ne permettent pas de calculer des angles réels');
    end

    % Newton-Raphson
    tol = 1e-6;
    max_iter = 100;
    iter = 0;

    while iter < max_iter
        iter = iter + 1;
        
        % Calcul des fonctions
        f1 = l1 * cos(q1) + l2 * cos(q1 + q2) - x;
        f2 = l1 * sin(q1) + l2 * sin(q1 + q2) - y;
        
        % Jacobienne
        J = [-l1 * sin(q1) - l2 * sin(q1 + q2), -l2 * sin(q1 + q2);
              l1 * cos(q1) + l2 * cos(q1 + q2),  l2 * cos(q1 + q2)];
        
        % Vérifier si la Jacobienne est singulière
        if abs(det(J)) < tol
            error('La matrice Jacobienne est singulière ou presque singulière');
        end
        
        % Calcul de l'inverse de la Jacobienne
        delta_q = -J \ [f1; f2];
        
        % Mise à jour des angles
        q1 = q1 + delta_q(1);
        q2 = q2 + delta_q(2);
        
        % Condition d'arrêt
        if norm([f1; f2]) < tol
            break;
        end
    end

    if iter == max_iter
        error('La méthode de Newton-Raphson n''a pas convergé');
    end

    % Conversion des angles en degrés
    q1 = rad2deg(q1);
    q2 = rad2deg(q2);

    % Affichage des résultats
    fprintf('L''angle q1 est: %.2f degrés\n', q1);
    fprintf('L''angle q2 est: %.2f degrés\n', q2);
end

% Appel de la fonction
inverse_kinematics_NR;
