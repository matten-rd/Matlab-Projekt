function [t, y] = runge_kutta_hopp(f, tinit, yinit, tfinal, h)
    % Runge-Kutta för andra ordningens diffekvation
        % f är derivatan
    
    % antal "delar"
    n = (tfinal-tinit)/h;

    % Initialisera/förallokera tid och resultat (y) vektor
    t = [tinit; NaN(n,1)];
    y = [yinit; NaN(n,2)];
    

    % Runge-Kutta delen
    for i = 1:n
        t(i+1) = t(i) + h;
        
        k1 = f(t(i), y(i,:));
        k2 = f(t(i) + h/2, y(i,:) + h*k1/2);
        k3 = f(t(i) + h/2, y(i,:) + h*k2/2);
        k4 = f(t(i) + h, y(i,:) + h*k3);
        
        y(i+1,:) = y(i,:) + h/6 * (k1+2*k2+2*k3+k4);
        
        % Stanna när man når marken
        if y(i,1) < 0
            break
        end
    end
    
end

