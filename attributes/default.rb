# 全サーバーで共通してインストールするアップリケーション
#
default['mj-base']['common_applications'] = %w{git git-flow curl vim postfix s3cmd afio figlet landscape-common nmap apache2-utils logwatch ntp sysstat}

default['mj-base']['option_applications'] = []