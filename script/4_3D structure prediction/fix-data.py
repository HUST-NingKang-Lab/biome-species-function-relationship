#!/bin/env python
import os
import sys

infile_path=sys.argv[1]
outfile_path=sys.argv[2]

infile=file(infile_path,'r')
outfile=file(outfile_path,'w')
line=infile.readline()
j=0
while line:
    j+=1;
    #if j%10000000==0:
    #    print j/10000000;
    #if line.__contains__('\0'):
    #    print 'line '+str(j)+';'+line
    newline=line.replace('\0','')
    if newline.startswith('>'):
        outfile.write(newline)
    else:
        if newline.strip('\n').isalpha():
            outfile.write(newline)
        else:
            print 'line '+str(j)+':'+newline
            pos=0;
            for ch in newline.strip('\n'):
                if not ch.isalpha():
                    break;
                pos+=1;    
            outfile.write(newline[0:pos]+'\n')
            outfile.write('>'+newline[pos:]+'\n')
    line=infile.readline()

outfile.close()
infile.close()
