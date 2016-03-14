Puppet::Type.type(:rkt_pod).provide(:ruby) do
  desc 'Support for Puppet managing pods in rkt'

  mk_resource_methods
  commands :rkt => 'rkt'

  def self.instances
    output = rkt(['list'])
    lines = output.split("\n")
    lines.shift # remove header row
    lines.collect do |line|
      uuid, app, image_name, state = line.split(' ')
       new({
        :name => uuid,
        :app => app,
        :image_name => image_name,
        :ensure => state,
       })
    end
  end

  def self.prefetch(resources)
    instances.each do |prov|
      if resource = resources[prov.name] # rubocop:disable Lint/AssignmentInCondition
        resource.provider = prov
      end
    end
  end

  def exists?
    true
  end
end
