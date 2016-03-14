require 'spec_helper'

pod = Puppet::Type.type(:rkt_pod)

describe pod do
  let :params do
    [
      :uuid,
      :provider,
    ]
  end

  let :properties do
    [
      :app,
      :image_name,
      :ensure,
    ]
  end

  it 'should have expected properties' do
    properties.each do |property|
      expect(pod.properties.map(&:name)).to be_include(property)
    end
  end

  it 'should have expected parameters' do
    params.each do |param|
      expect(pod.parameters).to be_include(param)
    end
  end
end
