#### Install the dependencies by running setup/get-deps.sh

#### cd into setup and run the following lists of commands using ansible-playbook

1. `ansible-playbook -K -i hosts common.yml`
2. `ansible-playbook -K -i hosts master.yml`
3. `ansible-playbook -K -i hosts nodes.yml`


### Check kubernetes is UP by SSHing into the master node and running
 - `kubectl get nodes`
 - `kubectl get pods --all-namespaces`  
