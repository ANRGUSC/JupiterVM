#### 1. Install the dependencies by running 
- `sudo sh setup/get-deps.sh`

#### 2. cd into setup and run the following lists of commands using ansible-playbook

1. `ansible-playbook -K -i hosts common.yml`
2. `ansible-playbook -K -i hosts master.yml`
3. `ansible-playbook -K -i hosts nodes.yml`


### 3. Check kubernetes is UP by SSHing into the master node and running
 - `kubectl get nodes`
 - `kubectl get pods --all-namespaces`  
