Vagrant.configure("2") do |config|
    config.vm.define "Test experiment_124" do |client|
    client.vm.box = "ubuntu/trusty64"
    client.vm.hostname = "20141222124"
    client.vm.network "private_network", ip: "192.168.11.24"
  end
    config.vm.define "Test experiment_001" do |client|
    client.vm.box = "ubuntu/trusty64"
    client.vm.hostname = "20151222001"
    client.vm.network "private_network", ip: "192.168.10.01"
  end
  