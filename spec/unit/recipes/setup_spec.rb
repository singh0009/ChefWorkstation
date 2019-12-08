#
# Cookbook:: .
# Spec:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'workstation::setup' do
  context 'when on centos' do
 #   platform 'centos', '8'

      let(:chef_run) do
        runner = ChefSpec::ServerRunner.new
        runner.converge(described_recipe)
      end
  
     it 'installs the correct package' do
      expect(chef_run).to install_package('vim-enhanced')
     end

     it 'installs the correct package' do
      expect(chef_run).to install_package('nano')
     end
     it 'installs the correct package' do
      expect(chef_run).to install_package('tree')
     end
     it 'installs the correct package' do
      expect(chef_run).to install_package('ntp')
     end
     it 'installs the correct package' do
      expect(chef_run).to install_package('git')
     end
     it 'installs the correct package' do
      expect(chef_run).to install_package('emacs')
     end
     it 'creates an default motd file' do
       expect(chef_run).to create_template('/etc/motd') 
     end
     it 'enable the ntpd service' do
      expect(chef_run).to enable_service('ntpd')
     end
     it 'start the ntpd service' do
      expect(chef_run).to start_service('ntpd')
     end
     it 'creates group' do
      expect(chef_run).to create_group('admins')
     end
      it 'converges successfully' do
      #it 'raise an exception' do
        expect{chef_run}.to_not raise_error
      end
  end
end
