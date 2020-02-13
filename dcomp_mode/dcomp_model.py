import mergexp as mx

net = mx.Topology('hello')

# replace me with your experiment topology
nodes = [net.device(name) for name in ['master', 'n1', 'n2']]
net.connect(nodes)

mx.experiment(net)
