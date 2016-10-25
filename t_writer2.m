function t_writer2(filename, absT, relT, rel2T)
% Writes a table to disk
%Input:
%   filename
%   absT = a matrix of absolut error.
%   relT = a matrix of relative errors.
%   rel2T = a matrix of square relative erros
    fileID = fopen(filename, 'w')
    lenMax = max(length(absT), length(relT))
    lenMax = max(lenMax, length(rel2T))

    str = sprintf(',abs,rel,rel2\n')
    fprintf(fileID, str)
    for i = 1:lenMax -1
        n = sprintf('%d,', i)
        if (i < length(absT))
            a = sprintf('%d,',absT(i))
        else
            a = ','
        end

        if (i < length(relT))
            b = sprintf('%d,',relT(i))
        else
            b = ','
        end

        if (i < length(rel2T))
            c = sprintf('%d',rel2T(i))
        else
            c = ''
        end
        d = '\n'
        row = strcat(n,a,b,c,d);
        fprintf(fileID, row);
    end
    fclose(fileID)
end
