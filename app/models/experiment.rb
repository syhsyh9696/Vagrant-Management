class Experiment < ApplicationRecord
  has_one :judgement, :dependent => :destroy
  has_many :submissions

  has_and_belongs_to_many :users

  validates :title, presence: true

  def generate_vagrantfile_for_followers
    vagrant_nodes = Array.new
    followers = self.users
    followers.each do |follower|
      info = Hash.new
      info['nodename'] = self.title + "_" + follower.stunum[-3..-1]
      info['stunum'] = follower.stunum
      info['stuname'] = follower.stuname
      info['ip'] = "192.168.1#{info['stunum'][-3]}.#{info['stunum'][-2..-1]}"
      vagrant_nodes << info
    end

    vagrantfiles_template = ERB.new %Q[
      Vagrant.configure("2") do |config|
        <% vagrant_nodes.each do |node| %>
          config.vm.define "<%= node['nodename'] %>" do |client|
            client.vm.box = "ubuntu/trusty64"
            client.vm.hostname = "<%= node['stunum'] %>"
            client.vm.network "private_network", ip: "<%= node['ip'] %>"
          end
        <% end %> 
      end
    ].strip
    
    return vagrantfiles_template.result(binding)
  end
end
