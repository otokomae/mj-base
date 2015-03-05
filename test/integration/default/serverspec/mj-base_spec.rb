require 'serverspec'

# common アプリケーションのインストールテスト
%w{git git-flow curl vim postfix s3cmd afio figlet landscape-common nmap apache2-utils logwatch ntp sysstat}.each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end

# option アプリケーションのインストールテスト
%w{chkrootkit unzip}.each do |pkg|
    describe package(pkg) do
        it { should be_installed }
    end
end

# motd設定の確認
describe file('/etc/update-motd.d/00-header') do
    it {should be_file}
    it { should contain "BIN_HOSTNAME='/bin/hostname'" }
end
