require 'spec_helper'

describe "System spec" do
    describe "Required packages should be installed" do
        describe package('php7.0-cli') do
            it { should be_installed }
        end
        describe package('mysql-server') do
            it { should be_installed }
        end
        describe file('/usr/local/composer') do
            it { should be_file }
        end
        describe file('/usr/local/codecept') do
            it { should be_file }
        end
        describe service('mysql') do
            it { should be_enabled }
            it { should be_running }
        end
        describe command("mysql -usomeuser -psomemysqlpasswordfromsomeuser -s -e 'show databases like \"somedb\";'") do
            its(:stdout) { should match(/somedb/) }
        end
    end
end
