
import importlib
import sys

model_file=sys.argv[1]

#TRY Importing the file
import_name = model_file.split(".")[0]
model=importlib.import_module(import_name)



with open("hosts",'w') as g:
  g.write("[master]\n")
  for m in model.JUPITER_MASTER_NODES:
    g.write("{}\n".format(m))


  g.write("\n[nodes]\n")
  for w in model.JUPITER_WORKER_NODES:
    g.write("{}\n".format(w))

