function t_writer(t1, t2)
% Function to write 2 tables to to disk
fileID = fopen('iterations.dat', 'w')
lenMax = max(length(t1) , length(t2))
str = sprintf(',x1, x2\n')
fprintf(fileID,str);
for i=1:lenMax
    if (i <= length(t1)) & (i <= length(t2))
       str = sprintf('%d,%d,%d\n',i,t1(i),t2(i));
    elseif (i > length(t1)) & (i <= length(t2))
        str = sprintf('%d,,%d\n',i,t2(i));
    elseif (i <= length(t1)) & (i > length(t2))
        str = sprintf('%d,%d,\n',i,t1(i));
    end
    fprintf(fileID, str);
end
fclose(fileID);

end
