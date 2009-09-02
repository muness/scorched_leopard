= Basics

To get the basics that you need as a ruby developer execute the following:

1) Install XCode.  Apple requires authentication but doesn't accept http basic auth so I can't automate that step.
2) Execute:

	curl -L http://github.com/muness/scorched_leopard/tree/master%2Fsetup.sh?raw=true?raw=true > ./setup.sh
	curl -L http://github.com/muness/scorched_leopard/tree/master%2Fapp_installers.sh?raw=true?raw=true > ./app_installers.sh
	./setup.sh
	
And the following will be installed:

* TextMate
* Mac Ports (including the mysql, postgres and git ports)
* ack
* TrueCrypt
* Firefox
* Ruby Switcher

= More
e.g. :

	curl -L http://github.com/muness/scorched_leopard/tree/master%2Fapp_installers.sh?raw=true?raw=true > /tmp/app_installers.sh
	source /tmp/app_installers.sh
	install_qsb # or another of the functions listed below

Here's the list of additional apps that app_installers.sh knows how to install:

	install_iterm      # iTerm
    install_mvim       # MacVim
    install_qsb        # Google Quick Search Box
    install_gitx       # GitX
    install_chrome     # Google Chrome
    install_sizeup     # Sizeup
    install_taskpaper  # TaskPaper
