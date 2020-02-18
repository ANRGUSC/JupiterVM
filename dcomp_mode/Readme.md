### Prepare Experiment on MergeTB

First, prepare your cloud nodes via an "experiment" in MergeTB. Login to 
https://launch.mergetb.net, create a project, and create an experiment. To run 
the scripts in this repository, you can use the provided model dcomp_model.py.
In the Models section, upload dcomp_model.py. Then, click on the new model and 
click on "Push to Experiment". Select the experiment that you created.  If you 
used the example model, three nodes in total will be created with the hostnames
`master`, `n1`, and `n2`. 

You will access your experiment nodes through the xdc. Create an xdc container
and click the link to the xdc UI. Under the "Files" tab, you will see a drop
down menu labeled "New". Expand the menu and click "Terminal". 

### Attach xdc to Experiment and Materalize a Realization
`{PROJECT_NAME}` and `{EXPERIMENT_NAME}` refer to the names used above in 
section "Prepare Experiment on MergeTB". `{REALIZATION_NAME}` is the new name
for the realization (e.g. real0).

    mergetb login {USERNAME}
    mergetb -p {PROJECT_NAME} realize {EXPERIMENT_NAME} {REALIZATION_NAME} --accept
    mergetb -p {PROJECT_NAME} materialize {EXPERIMENT_NAME} {REALIZATION_NAME}
    mergetb -p {PROJECT_NAME} attach {EXPERIMENT_NAME} {REALIZATION_NAME} {XDC_NAME}

### Install Required Packages

    sudo apt update
    sudo apt upgrade -y
    sudo apt install git -y
    git clone https://github.com/ANRGUSC/JupiterVM.git

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
