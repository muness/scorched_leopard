function install_adium {
  sudo rm -rf /Applications/Adium.app &&
  curl -O -s http://adiumx.cachefly.net/Adium_1.3.6.dmg &&
  hdiutil attach Adium_1.3.6.dmg &&
  sudo cp -R /Volumes/Adium\ 1.3.6/Adium.app /Applications &&
  hdiutil detach /Volumes/Adium\ 1.3.6
}

function install_iterm {
  sudo rm -rf /Applications/iTerm.app &&
	curl -O -s http://iterm.sourceforge.net/iTerm_0.9.6.20090415.zip &&
	unzip -q iTerm*.zip &&
	sudo mv iTerm.app /Applications
}

function install_mvim {
  sudo rm -rf /Applications/MacVim.app &&
  curl -O -s http://macvim.googlecode.com/files/MacVim-snapshot-49.tbz &&
  tar xjf MacVim-snapshot-49.tbz &&
  cd MacVim-snapshot-49 &&
  sudo mv MacVim.app /Applications &&
  mv mvim ~/bin && cd /tmp
}

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

function install_qsb {
  sudo rm -rf /Applications/Quick\ Search\ Box.app/ &&
  curl -O -s http://qsb-mac.googlecode.com/files/GoogleQuickSearchBox-2.0.0.1674.Release.dmg &&
  hdiutil attach GoogleQuickSearchBox-2.0.0.1674.Release.dmg &&
  cd /Volumes/GoogleQuickSearchBox-2.0.0.1674.Release &&
  sudo cp -R Quick\ Search\ Box.app /Applications/ &&
  cd /tmp && sleep 1 &&
  hdiutil detach /Volumes/GoogleQuickSearchBox-2.0.0.1674.Release/
}

function install_macports {
  curl -O -s http://distfiles.macports.org/MacPorts/MacPorts-1.8.0.tar.bz2 &&
  tar xjf MacPorts-1.8.0.tar.bz2 &&
  cd MacPorts-1.8.0 &&
  ./configure && make && sudo make install &&
  sudo /opt/local/bin/port selfupdate
}

function install_ack {
  curl http://ack.googlecode.com/svn/tags/latest/ack > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
}

function install_true_crypt {
  curl -o TrueCrypt.dmg -L -s http://www.truecrypt.org/download/TrueCrypt%206.2a%20Mac%20OS%20X.dmg &&
  hdiutil attach TrueCrypt.dmg &&
  cd /Volumes/TrueCrypt\ 6.2a/ &&
  sudo installer -pkg TrueCrypt\ 6.2a.mpkg/ -target "/" &&
  cd /tmp && sleep 10 &&
  hdiutil detach /Volumes/TrueCrypt\ 6.2a/ ; echo "..." # for some reason this doesn't always unmount
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
  curl -o ff3.5.dmg -L -s http://download.mozilla.org/\?product=firefox-3.5.2\&os=osx\&lang=en-US &&
  hdiutil attach ff3.5.dmg &&
  sudo cp -R /Volumes/Firefox/Firefox.app /Applications &&
  hdiutil detach /Volumes/Firefox
}

function install_chrome {
  sudo rm -rf /Applications/GoogleChrome.app
  curl -O -L -s http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg &&
  hdiutil attach GoogleChrome.dmg &&
  sudo cp -R /Volumes/Google\ Chrome/Google\ Chrome.app/ /Applications &&
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