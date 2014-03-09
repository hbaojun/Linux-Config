# /etc/profile

#Set our umask
umask 022

#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
JAVA_HOME="/usr/local/share/jdk1.5.0_22"
JRE_HOME="/usr/local/share/jdk1.5.0_22/jre"
CATALINA_BASE="/usr/local/share/apache-tomcat-6.0.37"
CATALINA_HOME="/usr/local/share/apache-tomcat-6.0.37"
CLASSPATH=".:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/jre/lib/deploy.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib:$JAVA_HOME/jre/lib"
# Set our default path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$CATALINA_HOME/bin"
export PATH

CDPATH=".:~:~/work"
export CDPATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
