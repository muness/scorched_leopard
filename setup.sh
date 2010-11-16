function install_mac_must_haves {
  sudo rm -rf /tmp/*
  cp app_installers.sh /tmp

  pushd /tmp
  sudo sh -c "
    cd /tmp
    mkdir -p /usr/local/bin &&
    mkdir -p ~/bin &&
    source app_installers.sh && 
    install_mate &&
    install_ack &&
    install_firefox &&
    install_adium &&
    install_macports &&
    export PATH=$PATH:/opt/local/bin &&
    port install ccache &&
    perl -i.orig -p -e 's/(configureccache\s+)no/$1yes/' /opt/local/etc/macports/macports.conf &&
    perl -i.orig -p -e 's/\#(buildmakejobs\s+)1/$1 0/' /opt/local/etc/macports/macports.conf &&
    install_macports_postgres &&
    install_macports_mysql &&
    port install git-core +doc+bash_completion &&
    port clean --all installed"
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
:backtrace: false
:benchmark: false
  '
  echo "$GEM_RC" > ~/.gemrc

  local IRB_RC='
require "rubygems"
require "irb/completion"
  '
  
  echo "$IRB_RC" > ~/.irbrc
}

function install_git_nice_to_have {
  git config --global alias.ci commit
  git config --global alias.st status
  git config --global alias.d  diff
  git config --global alias.co checkout
  gem install github git_remote_branch
}

function install_mate_helpers {
	pushd &&
  mkdir -p ~/Library/Application\ Support/TextMate/Bundles &&
  cd ~/Library/Application\ Support/TextMate/Bundles &&
  git clone git://github.com/protocool/ack-tmbundle.git Ack.tmbundle || (cd Ack.tmbundle && git pull) &&
  popd
}

install_mac_must_haves

export PATH=$PATH:/opt/local/bin

add_ports_to_path
install_ruby_must_haves
install_git_nice_to_have
install_mate_helpers
