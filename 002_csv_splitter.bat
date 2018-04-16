@echo off & python -x "%~f0" %* & goto :eof

import sys
import glob as glob



class SplitCSV:
    def __init__(self):
        self.csv_file = None
        self.file_name = None
        self.globbed = None

    def csv_splitter(self, globber='*.csv', line_limit=500000):
        self.globbed = glob.glob(globber)
        self.csv_file = open(str(self.globbed[0]), 'r').readlines()
        self.filename = 1
        for i in range(len(self.csv_file)):
            if i % line_limit == 0:
                open('split_csv_' + str(self.filename) + '.csv', 'w+').writelines(
                    self.csv_file[i:i + line_limit])
                self.filename += 1


x = SplitCSV()
x.csv_splitter()