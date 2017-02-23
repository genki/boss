# boss
Boss for docker services

**USAGE**

start the service.

```
docker service create --name boss -p 21081:21081 \
  --constraint node.role==manager \
  --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  s21g/boss
```

* Notify the addition of a worker node to the boss from the `startup script` of VM instance.
  ```
  curl http://localhost:21081/update/<service-name>
  ```
 * Boss spins up and down number of replicas to rebalance tasks amoung swarm cluster.

* Notify the removal of a worker node to the boss from the `shutdown script` of VM instance.
  ```
  curl http://localhost:21081/drain/`hostname`
  ```
  * Boss change the availability of the node to 'drain'

In addition, the boss checks periodically the node list to find downed workers to remove them.
