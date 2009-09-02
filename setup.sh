function install_mac_must_haves {
  sudo rm -rf /tmp/*
  cp app_installers.sh /tmp

  pushd /tmp
  sudo sh -c "
    cd /tmp
    source app_installers.sh && 
    install_mate &&
    install_ack &&
    install_firefox &&
    install_adium &&
    install_macports &&
    export PATH=$PATH:/opt/local/bin &&
    port install git-core +svn+doc+bash_completion && 
    port install mysql5-server postgresql84-server &&
    sudo port clean --all installed &&
    launchctl load -w /Library/LaunchDaemons/org.macports.mysql5.plist &&
    launchctl load -w /Library/LaunchDaemons/org.macports.postgresql84-server.plist"
  popd
  
  sudo rm -rf /tmp/*
}

function add_ports_to_path {
  echo "PATH=\$PATH:/opt/local/bin" >> ~/.bash_profile
}

function install_ruby_must_haves {
  local GEM_RC='
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

  curl -L -s http://github.com/relevance/etc/tree/master%2Fbash%2Fruby_switcher.sh?raw=true?raw=true > ~/ruby_switcher.sh
  echo "source ~/ruby_switcher.sh" >> ~/.bash_profile

  source ~/ruby_switcher.sh
  install_ruby_186

  echo "use_ruby_186" >> ~/.bash_profile

  ARCHFLAGS="-arch i386" gem install mysql
  ARCHFLAGS="-arch i386" gem install postgres -- \
    --with-pgsql-lib=/opt/local/lib/postgresql84 \
    --with-pgsql-include=/opt/local/include/postgresql84
    
  gem install capistrano looksee
  
  local IRB_RC='
require "irb/completion"
require "looksee/shortcuts"
  '
  
  echo "$IRB_RC" > ~/.irbrc
}

function install_git_nice_to_have {
  git config --global alias.ci commit
  git config --global alias.st status
  gem install defunkt-github webmat-git_remote_branch
}

install_mac_must_haves

export PATH=$PATH:/opt/local/bin

add_ports_to_path
install_ruby_must_haves
install_git_nice_to_have
