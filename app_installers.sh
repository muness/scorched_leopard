function install_adium {
  sudo rm -rf /Applications/Adium.app &&
  curl -O -s http://adiumx.cachefly.net/Adium_1.4.3.dmg &&
  hdiutil attach Adium_1.4.3.dmg &&
  sudo cp -R /Volumes/Adium\ 1.4.3/Adium.app /Applications &&
  hdiutil detach /Volumes/Adium\ 1.4.3
}

function install_bash_prompt {
  curl -L http://github.com/relevance/etc/tree/master%2Fbash%2Fbash_vcs.sh?raw=true > ~/.bash_dont_think.sh &&
  echo "source ~/.bash_dont_think.sh" >> ~/.bash_profile
}

function install_euca_tools {
	curl -L -o euca_deps.tgz http://open.eucalyptus.com/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://eucalyptussoftware.com/downloads/releases/euca2ools-1.2-src-deps.tar.gz &&
	tar xzf euca_deps.tgz && cd euca2ools-1.2-src-deps/ &&
	tar xzf M2Crypto-0.19.1.tar.gz && cd M2Crypto-0.19.1 && sudo python setup.py install && cd ..
	tar xzf boto-1.8d.tar.gz && cd boto-1.8d && sudo python setup.py install && cd ..
	cd .. &&
	curl -L -o euca_tools.tgz http://open.eucalyptus.com/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://eucalyptussoftware.com/downloads/releases/euca2ools-1.2.tar.gz &&
	tar xzf euca_tools.tgz &&
	cd euca2ools-1.2 &&
	sudo make # fails!
	sudo cp bin/euca-* /usr/local/bin/ &&
	cd ..
}

# TODO: Update to iTerm 2
function install_iterm {
  sudo rm -rf /Applications/iTerm.app &&
	curl -O -L -s http://downloads.sourceforge.net/iterm/iTerm_0.10.zip &&
	unzip -q iTerm*.zip &&
	sudo mv iTerm.app /Applications
}

# TODO: Update to a later mvim
function install_mvim {
  sudo rm -rf /Applications/MacVim.app &&
  curl -O -s http://macvim.googlecode.com/files/MacVim-snapshot-49.tbz &&
  tar xjf MacVim-snapshot-49.tbz &&
  cd MacVim-snapshot-49 &&
  sudo mv MacVim.app /Applications &&
  mv mvim ~/bin && cd /tmp
}

# TODO: Update to a later TextMate
function install_mate {
  sudo rm -rf /Applications/TextMate.app &&
  curl -O -s http://download-b.macromates.com/TextMate_1.5.9.dmg &&
  hdiutil attach TextMate_1.5.9.dmg &&
  cd /Volumes/TextMate\ 1.5.9/ &&
  sudo cp -R TextMate.app /Applications &&
  cd /tmp && sleep 1 &&
  hdiutil detach /Volumes/TextMate\ 1.5.9/ &&
  ln -sf /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate
}

function install_macports {
  curl -O -s http://distfiles.macports.org/MacPorts/MacPorts-1.8.0.tar.bz2 &&
  tar xjf MacPorts-1.8.0.tar.bz2 &&
  cd MacPorts-1.8.0 &&
  ./configure && make && sudo make install &&
  sudo /opt/local/bin/port selfupdate
}

function install_ack {
  curl -s http://betterthangrep.com/ack-standalone > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
}

# Update to 7
function install_true_crypt {
  curl -o TrueCrypt.dmg -L -s http://www.truecrypt.org/download/TrueCrypt%206.3a%20Mac%20OS%20X.dmg &&
  hdiutil attach TrueCrypt.dmg &&
  cd /Volumes/TrueCrypt\ 6.3a/ &&
  sudo installer -pkg TrueCrypt\ 6.3a.mpkg/ -target "/" &&
  cd /tmp && sleep 10 &&
  hdiutil detach /Volumes/TrueCrypt\ 6.3a/ ; echo "..." # for some reason this doesn't always unmount
}

function install_gitx {
  sudo rm -rf /Applications/GitX.app &&
  curl -O -L -s http://frim.frim.nl/GitXStable.app.zip &&
  unzip -q GitXStable.app.zip &&
  sudo mv GitX.app /Applications &&
  sudo ln -sf /Applications/GitX.app/Contents/Resources/gitx /usr/local/bin
}

function install_firefox {
  sudo rm -rf /Applications/Firefox.app &&
  curl -o ff3.dmg -L -s 'http://download.mozilla.org/?product=firefox-3.6.12&os=osx&lang=en-US' &&
  hdiutil attach ff3.dmg &&
  sudo cp -R /Volumes/Firefox/Firefox.app /Applications &&
  hdiutil detach /Volumes/Firefox
}

function install_chrome {
  sudo rm -rf /Applications/Google\ Chrome.app &&
  curl -O -L -s http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg &&
  hdiutil attach GoogleChrome.dmg &&
  sudo cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications &&
  hdiutil detach /Volumes/Google\ Chrome/  
}

function install_sizeup {
  sudo rm -rf /Applications/SizeUp.app &&
  curl -O -s -L http://www.irradiatedsoftware.com/downloads/SizeUp.zip &&
  unzip -q SizeUp.zip &&
  mv SizeUp.app /Applications
}

function install_taskpaper {
  sudo rm -rf /Applications/TaskPaper.app &&
  curl -O -L -s http://taskpaper.s3.amazonaws.com/TaskPaper.dmg &&
  hdiutil attach TaskPaper.dmg &&
  sudo cp -R /Volumes/TaskPaper-2.1/TaskPaper.app /Applications &&
  hdiutil detach /Volumes/TaskPaper-2.1
}

function install_skype {
  sudo rm -rf /Applications/Skype.app &&
  curl -O -L -s http://www.skype.com/go/getskype-macosx.dmg &&
  hdiutil attach getskype-macosx.dmg &&
  sudo cp -R /Volumes/Skype/Skype.app /Applications &&
  hdiutil detach /Volumes/Skype
}

function install_stuf {
  sudo rm -rf /Applications/Stuf.app &&
  curl -O -L -s http://s3.amazonaws.com/EscapersStuf/Stuf.zip &&
  unzip -q Stuf.zip &&
  mv Stuf.app /Applications
}

function install_p4merge {
  local p4merge='#!/bin/sh
/Applications/p4merge.app/Contents/MacOS/p4merge $*
'
  local p4diff='#!/bin/sh
[ $# -eq 7 ] && /usr/local/bin/p4merge "$2" "$5"
'
  sudo rm -rf /Applications/p4merge.app 
  curl -O -L -s http://www.perforce.com/downloads/perforce/r09.1/bin.macosx104u/P4V.dmg &&
  hdiutil attach P4V.dmg &&
  sudo cp -R /Volumes/P4V/p4merge.app /Applications/ &&
  echo "$p4merge" > p4merge &&
  sudo cp p4merge /usr/local/bin &&
  echo "$p4diff" > p4diff &&
  sudo cp p4diff /usr/local/bin &&
  sudo chown root:wheel /usr/local/bin/{p4merge,p4diff} &&
  sudo chmod a+x /usr/local/bin/{p4merge,p4diff} &&
  git config --global diff.external p4diff &&
  git config --global merge.keepBackup false &&
  git config --global merge.tool p4merge &&
  git config --global merge.p4merge.cmd 'p4merge "$PWD/$BASE" "$PWD/$LOCAL" "$PWD/$REMOTE" "$PWD/$MERGED"'  &&
  git config --global merge.p4merge.keepTemporaries false &&
  git config --global merge.p4merge.trustExitCode false &&
  git config --global merge.p4merge.keepBackup false &&
  hdiutil detach /Volumes/P4V
}

function install_macports_postgres {
  sudo sh -c "
    export PATH=$PATH:/opt/local/bin &&
    port install postgresql84-server &&
    mkdir -p /opt/local/var/db/postgresql84/defaultdb &&
    chown postgres:postgres /opt/local/var/db/postgresql84/defaultdb &&
    sudo su postgres -c '/opt/local/lib/postgresql84/bin/initdb -D /opt/local/var/db/postgresql84/defaultdb' &&
    launchctl load -w /Library/LaunchDaemons/org.macports.postgresql84-server.plist &&
    /opt/local/etc/LaunchDaemons/org.macports.postgresql84-server/postgresql84-server.wrapper start"
}

function install_macports_mysql {
  sudo sh -c "
    export PATH=$PATH:/opt/local/bin &&
    port install mysql5-server &&
    sudo /opt/local/lib/mysql5/bin/mysql_install_db --user=mysql"
}
