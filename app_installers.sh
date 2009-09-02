
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
  curl -O -s http://distfiles.macports.org/MacPorts/MacPorts-1.8.0-10.5-Leopard.dmg &&
  hdiutil attach MacPorts-1.8.0-10.5-Leopard.dmg &&
  cd /Volumes/MacPorts-1.8.0 &&
  sudo installer -pkg MacPorts-1.8.0.pkg -target "/" &&
  cd /tmp && 
  hdiutil detach /Volumes/MacPorts-1.8.0/ ; echo "..."
}

function install_ack {
  curl http://ack.googlecode.com/svn/tags/latest/ack > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
}

function install_true_crypt {
  curl -O -s http://www.truecrypt.org/download/TrueCrypt%206.2a%20Mac%20OS%20X.dmg && echo "more here..."
}