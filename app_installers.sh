
function install_iterm {
	curl -O -s http://iterm.sourceforge.net/iTerm_0.9.6.20090415.zip &&
	unzip iTerm*.zip &&
	sudo mv iTerm.app /Applications
}

function install_mvim {
  curl -O -s http://macvim.googlecode.com/files/MacVim-snapshot-49.tbz &&
  tar xjf MacVim-snapshot-49.tbz &&
  cd MacVim-snapshot-49 &&
  sudo mv MacVim.app /Applications &&
  mv mvim ~/bin && cd /tmp
}

function install_mate {
  curl -O -s http://download-b.macromates.com/TextMate_1.5.9.dmg &&
  hdiutil attach TextMate_1.5.9.dmg &&
  cd /Volumes/TextMate\ 1.5.9/ &&
  sudo cp -R TextMate.app /Applications &&
  cd /tmp &&
  hdiutil detach /Volumes/TextMate\ 1.5.9/ &&
  ln -s /Applications/TextMate.app/Contents/Resources/mate /usr/local/bin/mate
}

function install_qsb {
  curl -O -s http://qsb-mac.googlecode.com/files/GoogleQuickSearchBox-2.0.0.1674.Release.dmg &&
  hdiutil attach GoogleQuickSearchBox-2.0.0.1674.Release.dmg &&
  cd /Volumes/GoogleQuickSearchBox-2.0.0.1674.Release &&
  sudo cp -R Quick\ Search\ Box.app /Applications/ &&
  cd /tmp &&
  hdiutil detach /Volumes/GoogleQuickSearchBox-2.0.0.1674.Release &&
  open /Applications/Quick\ Search\ Box.app/
}

function install_macports {
  curl -O -s http://distfiles.macports.org/MacPorts/MacPorts-1.8.0-10.5-Leopard.dmg &&
  hdiutil attach MacPorts-1.8.0-10.5-Leopard.dmg &&
  cd /Volumes/MacPorts-1.8.0 &&
  sudo installer -pkg MacPorts-1.8.0.pkg -target "/" &&
  cd /tmp &&
  hdiutil detach /Volumes/MacPorts-1.8.0/
}

function install_ack {
  curl http://ack.googlecode.com/svn/tags/latest/ack > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
}