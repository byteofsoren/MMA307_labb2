function [Ei Er Er2] = calcerror(approx_list, value)
    len = length(approx_list);
    %Ei = zeros(len);
    %Er = zeros(len);
    %Er2 = zeros(len);
    for i = 1:len
        Ei(i) = abs(value - approx_list(i));
    end

    for i = 1:len-2
            Er(i) = Ei(i+1)/(Ei(i));
            Er2(i) = Ei(i+1)/((Ei(i)).^2);
    end


end
