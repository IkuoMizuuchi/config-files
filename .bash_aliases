#-*-Mode: shell-script;-*-
# .aliases
# $Id: .bash_aliases 4144 2014-03-09 13:59:48Z ikuo $
#

function setenv () {
    export $1="$2";
}
alias unsetenv=unset

alias emacs='\emacs -nw'
function be () {
    /usr/bin/emacs -r -display localhost:0.0 $* &
}
#alias be='/usr/bin/emacs -r -display localhost:0.0 &'

alias cp='\cp -i'
alias mv='\mv -i'
alias rm='ikuo_rm'
alias unrm='ikuo_unrm'

if [ "$EMACS_DIR" = "" ]; then	# not Meadow
alias ls='ls -F --show-control-char --color=no'
elif [ "$TERM" = "emacs" -o "$EMACS" = t ]; then
# alias ls='ls -F --show-control-char -C'
alias ls='ls -F --show-control-char --color=no -C'
else
alias ls='ls -F --show-control-char --color=no'
fi
alias ll='ls -l'
alias pd=pushd
alias po=popd

alias	s='source ~/.bashrc'
alias	aliases='source ~/.bash_aliases'

alias cldir="find . \( -name '*~' -o -name '#*#' -o -name '*.aux' -o -name '*.blg' -o -name core -o -iname 'Thumbs.db*' -o -iname 'THUMB*.DBE' -o -iname '*.bb' -o -iname '*.stackdump' \) -ls -exec rm -f {} \;"
alias cldir-msword="find . \( -name '\~\$*' -o -name '~*.tmp' \) -print -exec rm {} \;"
alias cldir-pptview="find . \( -iname gdiplus.dll -o -iname intldate.dll -o -iname ppvwintl.dll -o -iname saext.dll -o -iname unicows.dll -o -iname AUTORUN.INF -o -iname playlist.txt -o -iname play.bat -o -iname pptview.exe -o -iname pvreadme.htm \) -print -exec rm {} \;"

alias	ff='find . -iname'
function ffll () {
    find . -iname "${1}" -ls
}
function fflltr () {
    find . -iname "$1" -exec ls -Fl {} \; | sort -k 5
}
alias	ffllrt=fflltr

alias	mkae='make -j'
alias	maek='make -j'
alias	amek='make -j'
alias	amke='make -j'

alias	whois-jp='\whois -h whois.nic.ad.jp'
alias	whois-us='\whois -h 198.41.0.6'
alias	whois-usmil='\whois -h 192.112.36.5'
alias	whois-usgov='\whois -h 205.130.57.2'
alias	whois-europe='\whois -h 193.0.0.200'
alias	whois-asia='\whois -h 203.37.255.97'

alias	r=rlogin

alias	j='jobs -l'
alias	f='fg %\!*'

#alias cvs='cvs -z3'
alias cvsupdate="cvs -q update -dP | grep -v '?'"
alias svnupdate="svn update ; svn -q status | grep -v '?'"

function texcompile () {
    njlatex $1
    njbibtex $1
    njlatex $1
    njlatex $1
    grep Warn $1.log
}

alias c='cat'

#alias man='env LESSCHARSET= man'

if [ "${ARCHDIR}" = "Cygwin" ]; then
    function pathconv () {
	cygpath -aw $1
    }
else
    function pathconv () {
	$1
    }
fi

alias kterm='\kterm -bg black -fg white -sl 4096 -geometry 80x45 -fk maru14'

export NOEXEBUTREADABLE='{*.{ai,pdf,tex,blg,bbl,ps,PS,log,dvi,aux,sty,jpg,JPG,gif,bmp,BMP,cls,mpg,MPG,avi,ppt,c,h,cpp,l,3dm,dxf,NC5,wrl,mtx,mts,igs,x_t,dwg,txt,TXT,eps,ppm,kdraw,wmf,doc,DOC,xls,XLS,bib,emf,url,wmv},Makefile,Thumbs.db,.cvsignore,Repository,Entries,Root}*'

alias chmod-all="chmod a-x,u+r ${NOEXEBUTREADABLE}"
alias chmod-all-exe='chmod a+rx *.{exe,EXE,dll,DLL}'

function chmod-all-dir () {
	find . -iname ${NOEXEBUTREADABLE} -exec chmod a-x,a+r {} \;
}

function settitle() { echo -n "^[]2;$@^G^[]1;$@^G"; }

alias nkf='\nkf --utf8'

alias cp_date='env LS_COLORS= \cp_date'

alias eximage="egrep -v '(jpg|gif|png|css|ico)'"
alias exbots="egrep -v '(baidu.jp/spider|naver.com/robots/|google.com/bot|ysearch/slurp|cuil.com/twiceler/robot.html)'"
alias exlab="egrep -v '^(165.93.(112.18[12]|146.182)|::1|218.230.110.31|127.0.0.1|11-201)'"


if [ "${ARCHDIR}" == "Cygwin" -o "${ARCHDIR}" == "Cygwin64" ]; then
######## Cygwin ########

alias meadow='/usr/local/Meadow/bin/Meadow.exe -r'
alias p='ps aux'
alias where='type -a'
alias ldd='cygcheck'
alias start='cygstart'
alias xdvi='cygstart'
alias xv='/cygdrive/c/Program\ Files/IrFanView/i_view32.exe'
alias traceroute=tracert
alias ifconfig='ipconfig | nkf --utf8'

alias nslookup='/cygdrive/c/WINDOWS/system32/nslookup'
alias finger='/cygdrive/c/WINDOWS/system32/finger'
#alias	rsh='/cygdrive/c/WINDOWS/system32/rsh'

function jless () {
    /usr/bin/nkf --utf8 $1 | /usr/bin/less
}

alias cygjava='/usr/local/bin/java'
alias cygjavac='/usr/local/bin/javac'
alias cygjar='/usr/local/bin/jar'
alias cygjarsigner='/usr/local/bin/jarsigner'
alias cygjavap='/usr/local/bin/javap'
alias cygjavadoc='/usr/local/bin/javadoc'
alias cygjavah='/usr/local/bin/javah'

alias eus='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/eus.exe'
alias eusx='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/eusx.exe'
alias eusgl='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/eusgl.exe'
alias jskeus='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskeus.exe'
alias jskeusx='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskeusx.exe'
alias jskeusgl='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskeusgl.exe'
alias jskrbeus='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskrbeus.exe'
alias jskrbeusx='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskrbeusx.exe'
alias jskrbeusgl='env ARCHDIR=Cygwin LANG=japanese ${EUSDIR}/${ARCHDIR}/bin/jskrbeusgl.exe'

alias href="/usr/local/href-0.3.3/href.exe"

# end of Cygwin
else
######## Linux ########

alias p='ps -edfl | grep -v root'

function where () {
    alias $1;
    which -a $1;
}
alias	start='gnome-open'

fi
