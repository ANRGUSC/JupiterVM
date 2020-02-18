### A. Install the dependencies by running 
- `sudo sh setup/get-deps.sh`

### B. Generate the hosts file from the model python file from DCOMP

The model python file (say `ABC.py`) in the DCOMP testbed should have the declared the two variables -
JUPITER_MASTER_NODES and JUPITER_WORKER_NODES.

The hostgenerator.py script looks for these two variables and generates the `hosts` file automatically 


An example model file using this scheme is given below.


```
import mergexp as mx

net = mx.Topology('hello')

JUPITER_MASTER_NODES = ["master"]
JUPITER_WORKER_NODES = ["n1","n2"]


ALL_NODES = JUPITER_MASTER_NODES + JUPITER_WORKER_NODES
# replace me with your experiment topology
nodes = [net.device(name) for name in ALL_NODES ]
net.connect(nodes)

mx.experiment(net)
```

Download the python model file(say XYZ.py) from the DCOMP to the folder setup/init-kubernetes
Then run `python3 -B hostgenerator.py XYZ.py` to obtain the `hosts` file


### C. cd into setup and run the following lists of commands using ansible-playbook

1. `ansible-playbook -K -i hosts common.yml`
2. `ansible-playbook -K -i hosts master.yml`
3. `ansible-playbook -K -i hosts nodes.yml`


### D. Check kubernetes is UP by SSHing into the master node and running
 - `kubectl get nodes`
 - `kubectl get pods --all-namespaces`  
