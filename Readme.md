## Vagrant and Kubernetes


#### 1. Install dependencies 

 cd into vagrant_mode/deps/

`sudo sh install_deps.sh`

#### 2. Run Vagrant to get Master VM up and running

 cd into vagrant_mode/
 
`vagrant up master`

#### 3. Run Vagrant to get Node1 VM up and running
`vagrant up node1`

#### 4. Check if node1 joined master
```
vagrant ssh master
sudo -i
kubectl get nodes
```
We should see master and node1 ready. 

#### 5. Run Vagrant to get Node2 VM up and running
`vagrant up node2`

Repeat step.4 to check node2 has joined and ready too. 

#### 6. Destroy VMs
`vagrant destroy [master,node1,node2]`
