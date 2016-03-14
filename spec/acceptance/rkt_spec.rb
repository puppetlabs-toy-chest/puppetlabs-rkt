require 'spec_helper_acceptance'

describe 'rkt' do
  context 'installation' do
    before(:all) do
      @pp = <<-EOS
        class { 'rkt': }
        class { 'rkt::acbuild': }
      EOS
      @result = apply_manifest_with_exit(@pp)
    end

    it_behaves_like 'an idempotent resource'

    ['rkt', 'acbuild'].each do |command|
      describe command("#{command} version") do
        its(:exit_status) { should eq 0 }
      end
    end

    describe group('rkt') do
      it { should exist }
    end
  end
end
