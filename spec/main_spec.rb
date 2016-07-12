require 'spec_helper'

describe "System spec" do
    describe "Required packages should be installed" do
        describe package('php7.0-cli') do
            it { should be_installed }
        end
        describe package('mysql-server') do
            it { should be_installed }
        end
        describe file('/usr/local/bin/composer') do
            it { should be_file }
        end
        describe file('/usr/local/bin/codecept') do
            it { should be_file }
        end
        describe service('mysql') do
            it { should be_enabled }
            it { should be_running }
        end
        describe command("mysql -umydbuser -pmysqlpass123 -s -e 'show databases like \"mydb\";'") do
            its(:stdout) { should match(/mydb/) }
        end
    end
end
