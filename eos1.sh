#!/bin/bash	
InPath='./output/1'; # 输入路径	
OuPath='./output/10_MOD09EVI_EOS';	# 输出路径
	
module unload gcc;	
module load gcc/7.2.0;	
	
#rm -rf   $OuPath/	
mkdir -p $OuPath/	
# image name	
	
num=1;	
min_data=1	
max_data=21	
	
#Thread=1;	
for InName in $(ls $InPath/*tif); do	
  InFile=$(echo $InName | awk -F/ '{print $NF}');	
  OuFile=$(echo $InFile | sed 's/Sin/WGS/g') ;	
  OuName=$OuPath/$OuFile'_EOS.tif';	
  	
  if [ $num -ge $min_data ] && [ $num -lt $max_data ]		
    	then echo $InFile		
        		
        echo $num	
			
		echo $InName #OuName #InFile #OuName  	
		./open_MP_EOS $InName $OuName 	
			
  	
  fi	
  	
num=$(( num+1 ));	
	
done	
wait	
