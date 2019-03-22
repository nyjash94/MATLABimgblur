function [blurredImage] = imageBlur(level, image)
[m,n,z] = size(image);
blurredImage = image;
zeroImg = zeros(m+2,n+2,z);
for countZ = 1:z
for countR = 1:m
    for countC = 1:n
        zeroImg(countR+1,countC+1,countZ) = image(countR,countC,countZ);
    end
end
end
for countZimg = 1:z

    for countRimg = 2:m+1
    
    for countCimg = 2:n+1
    n0 = zeroImg(countRimg, countCimg, countZimg);
    n1 = zeroImg(countRimg, countCimg+1, countZimg);
    n2 = zeroImg(countRimg, countCimg-1, countZimg);
    n3 = zeroImg(countRimg+1, countCimg, countZimg);
    n4 = zeroImg(countRimg-1, countCimg-1, countZimg);
    n5 = zeroImg(countRimg+1, countCimg-1, countZimg);
    n6 = zeroImg(countRimg+1, countCimg+1, countZimg);
    n7 = zeroImg(countRimg-1, countCimg-1, countZimg);
    n8 = zeroImg(countRimg-1, countCimg+1, countZimg);
    if level == 8
       blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3+n4+n5+n6+n7+n8)/level+1;
    elseif level == 7
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3+n4+n5+n6+n7)/level+1;
    elseif level == 6
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3+n4+n5+n6)/level+1;
    elseif level == 5
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3+n4+n5)/level+1;
    elseif level == 4
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3+n4)/level+1;
    elseif level == 3
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2+n3)/level+1;
    elseif level == 2
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1+n2)/level+1;
    elseif level == 1
        blurredImage(countRimg-1,countCimg-1,countZimg) = (n0+n1)/level+1;
    end
    end
    
    end
end