# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

import sys
import os
import subprocess
import multiprocessing

#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

def worker(cmd):
  print("Calling process: %s" % cmd)
  ret = subprocess.call(cmd, shell=True)
  return (ret)

#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

# Main function
if __name__ == "__main__":

  FROM  = int(sys.argv[1]) - 1
  TO    = int(sys.argv[2])
  FEATS = sys.argv[3]

  print("---------------------------------------------------")
  print(" **** Meta-features extraction ***** ")
  print("---------------------------------------------------")

  print(" *** Datasets extracted ***")
  print("@ From: %d" % FROM)
  print("@ To: %d" % TO)
  print("@ Features: %s" % FEATS)
  print("---------------------------------------------------")

  datasets = os.listdir("data/datasets")
  sub = [data.replace(".arff", "") for data in datasets[FROM:TO]]

  before = "R CMD BATCH --no-save --no-restore '--args' --datafile="
  after  = " --option=" + FEATS +" mainExtraction.R out_"
  log    = "_" + FEATS + ".log &"

  # binding commands
  commands = [before + data + after + data + log for data in sub]

  # for cmd in commands:
  #   print(cmd)
 
  # Calling commands over Pool
  pool = multiprocessing.Pool(None)
  r = pool.map_async(worker, commands)
  r.wait()
  print(" Done !!!")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
