#!/usr/bin/python
'''
Bit Generator
Generates all unique bit stream combinations of length n

Created by David Tran
Last Modified: 01-29-2014
Version 0.5.0.0

'''
from sys import argv

def printSubsetToFile( subsetList, outputFile = 'bit_stream' ):

  subsetLength = len(subsetList[0])

  fileList = [ open('%s%d' % (outputFile, i),'w') for i in range(subsetLength) ]

  for eachSubset in subsetList:
    for position, eachElement in enumerate(eachSubset):
      fileList[position].write("%d\n" % (eachElement))

  [ filePtr.close() for filePtr in fileList ]

subset = lambda tu: [[ int(((x)&(1<<y))>0) for y in range(tu) ] for x in range(1<<tu) ]

if __name__ == '__main__':
  if len(argv) >= 2 :
    printSubsetToFile(subset(int(argv[1])))
  else:
    print( "./bitgenerator.py (bit count)" )

