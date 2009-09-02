mkdir ~/tmp
mkdir ~/bin

sudo rm -rf /tmp/*
cp app_installers.sh /tmp

pushd /tmp
sudo sh -c "
  cd /tmp
  source app_installers.sh && 
  install_true_crypt && # note: this asks for user input while mounting the dmg
  install_iterm &&
  install_mvim &&
  install_mate &&
  install_qsb &&
  install_ack &&
  install_gitx &&
  install_macports &&
  export PATH=$PATH:/opt/local/bin &&
  port install git-core +svn+doc+bash_completion mysql5-server postgresql84-server"
popd

echo "PATH=$PATH:/opt/local/bin:~/bin" >> ~/.bash_profile
export PATH=$PATH:/opt/local/bin:~/bin

git config --global alias.ci commit

GEM_RC='
gem: --no-ri --no-rdoc
:update_sources: true
:verbose: true
:bulk_threshold: 1000
:sources:
- http://gems.rubyforge.org
- http://gems.github.com
:backtrace: false
:benchmark: false
'
echo "$GEM_RC" > ~/.gemrc

curl -L http://github.com/relevance/etc/tree/master%2Fbash%2Fruby_switcher.sh?raw=true?raw=true > ~/ruby_switcher.sh
echo "source ~/ruby_switcher.sh" >> ~/.bash_profile

source ~/ruby_switcher.sh
install_ruby_186

# WIP: determining mac os version can be done this way...
# sw_vers -productVersion

# WIP install mysql gem
# ARCHFLAGS="-arch i386" gem install mysql -- \
#   --with-mysql-dir=/usr/local/mysql --with-mysql-lib=/usr/local/mysql/lib \
#   --with-mysql-include=/usr/local/mysql/include
# 
# ARCHFLAGS="-arch i386" gem install postgres -- \
#   --with-pgsql-dir=/Library/PostgreSQL/8.4/
# 


