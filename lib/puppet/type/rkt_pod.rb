Puppet::Type.newtype(:rkt_pod) do
  @doc = 'A type representing a rkt pod'
  newparam(:uuid, namevar: true)
  newproperty(:app)
  newproperty(:image_name)
  newproperty(:ensure)
end
