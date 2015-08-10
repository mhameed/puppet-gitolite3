require 'spec_helper'

describe 'gitolite3' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "gitolite3 class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('gitolite3::params') }
          it { is_expected.to contain_class('gitolite3::install').that_comes_before('gitolite3::config') }
          it { is_expected.to contain_class('gitolite3::config') }
          it { is_expected.to contain_class('gitolite3::service').that_subscribes_to('gitolite3::config') }

          it { is_expected.to contain_service('gitolite3') }
          it { is_expected.to contain_package('gitolite3').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gitolite3 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('gitolite3') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
