#!/usr/bin/python3
# Constructing Mechanistic Models of COVID-19 by Applying Machine Reading 

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import csv
# Input data files are available in the "../input/" directory.
# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory
import subprocess
import sys
# install the indra packages
#def install(package):
#    subprocess.check_call([sys.executable, "-m", "pip", "install", indra])
from indra.sources import reach
import os
for dirname, _, filenames in os.walk('/kaggle/input'):
    for filename in filenames:
        os.path.join(dirname, filename)

# Any results you write to the current directory are saved as output.

covidMetaDataFN = '2020-03-13/all_sources_metadata_2020-03-13.csv'
pmcids = []
with open(covidMetaDataFN) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        if line_count == 1:
                pmc = f'{row[4]}'
                pmc = pmc.replace('PMC', '', 1)
                if ((pmc != '') & (pmc != 'pmcid')):
                    pmcids.append(pmc)
                #line_count += 1
                #reach_processor = reach.process_pmc(pmc)
        #    print(f'\t{row[0]} works in the {row[1]} department, and was born in {row[2]}.')
    #print(f'Processed {line_count} lines.')

reach_processor = reach.process_pmc('1054884')
 # print(reach_processor)
    
#line_count = 0
#for pmcid in pmcids:
#    if line_count == 0:
#        print(pmcid)
#        reach_processor = reach.process_pmc(pmcid)
#        print(reach_processor.print_event_statistics())
#        line_count += 1
#        print(reach_processor.get_all_events())
