# What is it?

A few shell scripts that can install various mac apps with minimal user intervention.  They were written by and for a ruby developer.  The ruby developer who brought you ruby switcher.

## Getting started

To get the basics that you need as a ruby developer execute the following:

1. Install XCode.  Apple requires authentication but doesn't accept http basic auth so I can't automate that step.
2. Execute:

		curl -L http://github.com/muness/scorched_leopard/tree/master%2Fsetup.sh?raw=true?raw=true > ./setup.sh
		curl -L http://github.com/muness/scorched_leopard/tree/master%2Fapp_installers.sh?raw=true?raw=true > ./app_installers.sh
		./setup.sh
	
And the following will be installed:

* Ack
* Adium
* Firefox
* Mac Ports (including the mysql, postgres and git ports)
* Ruby Switcher (and ruby 1.8.6, RubyGems, rake, mysql and postgres gems)
* TextMate

## I want MORE
e.g. :

	curl -L http://github.com/muness/scorched_leopard/tree/master%2Fapp_installers.sh?raw=true?raw=true > /tmp/app_installers.sh
	source /tmp/app_installers.sh
	install_qsb # or another of the functions listed below

Here's the list of additional apps that app_installers.sh knows how to install:

	install_iterm      # iTerm
    install_chrome     # Google Chrome
    install_gitx       # GitX
    install_mvim       # MacVim
    install_qsb        # Google Quick Search Box
    install_sizeup     # Sizeup
    install_taskpaper  # TaskPaper
    install_true_crypt # TrueCrypt # Note: this asks for user input while mounting the dmg

# License

Simple:

* You cannot and will not blame me if these scripts don't work.
* You can fork at will as long as you give me credit for the original work.