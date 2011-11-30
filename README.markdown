# What is it?

A few shell scripts that can install various mac apps with minimal user intervention.  They were written by and for a ruby developer.  The ruby developer who brought you ruby switcher.

## Getting started

To get the basics that you need as a ruby developer execute the following:

1. Install XCode.  Apple requires authentication but doesn't accept http basic auth so I can't automate that step.
2. Execute:

		curl -L https://github.com/muness/scorched_leopard/raw/master/setup.sh > ./setup.sh
		curl -L https://github.com/muness/scorched_leopard/raw/master/app_installers.sh > ./app_installers.sh
        echo "source ./app_installers.sh" >> ~/.bash_profile
		sh ./setup.sh
	
And the following will be installed:

* Ack
* Adium
* Firefox
* Mac Ports (including the mysql, postgres and git ports)
* Ruby Switcher (and ruby 1.8.6, RubyGems, rake, mysql and postgres gems)
* TextMate

## Want MORE?
e.g. :

Here's the list of additional apps that app_installers.sh knows how to install:

	install_iterm      # iTerm
    install_chrome     # Google Chrome
    install_gitx       # GitX
    install_mvim       # MacVim
    install_sizeup     # Sizeup
    install_stuf       # Stuf
    install_taskpaper  # TaskPaper
    install_true_crypt # TrueCrypt # Note: this asks for user input while mounting the dmg

# License

Simple:

* You cannot and will not blame me if these scripts don't work.
* You can fork at will as long as you give me credit for the original work.

# TODO
 - make mount/unmount specify volume name
 - extract common code in installers
 - pull out (all?) functions from setup.sh to app_installers.sh so they can be sourced separately
