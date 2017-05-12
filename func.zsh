
function transcodeAudio() {
    ffmpeg -i $1 -vcodec copy -scodec copy -acodec libmp3lame -ab 128k -ar 48000 -ac 2 aFixed_$1
}

function burn() {
   growisofs -dvd-compat -Z /dev/sr0=$1
}

function isRunning() {
    return $( ps ax | grep -v grep | grep $1 > /dev/null )
}

function startGPG() {
    if isRunning 'gpg-agent'; then
	      printf "gpg:\u2713"
    else
	      echo "[gpg: starting]"
	      eval $(gpg-agent --daemon)
    fi
}

function startMediaTomb() {
    if isRunning 'mediatomb'; then
	      printf " mediatomb:\u2713"
    else
	      echo "[mediatomb: starting]"
	      mediatomb -d > /dev/null
    fi
}

function startSABnzb() {
    if isRunning 'sabnzbd'; then
	      printf " sabnzbd:\u2713"
    else 
	      echo "[sabnzbd: starting]"
	      sabnzbdplus -d > /dev/null
    fi
}

function startLoadKeys() {
    loadkeys ~/.loadkeys
}

function x264p1() {
     ffmpeg -i "$1" -an -vcodec libx264 -pass 1  -preset veryslow -threads 0 -b 3000k -x264opts frameref=15:fast_pskip=0 -f rawvideo -y /dev/null
}

function x264p2() {
    ffmpeg -i "$1" -acodec copy -ab 256k -ar 96000 -vcodec libx264 -pass 2 -preset veryslow -threads 0 -b 3000k -x264opts frameref=15:fast_pskip=0 "$2"
}

function scanFlatbed() {
    if [ $# -eq 0 ]
    then
        echo "Usage: scanFlatbed document_name"
        exit 1
    fi
    scanimage -p --format=tiff -y 280 --mode=Color | convert - "$1.pdf"
}

function scanAdf() {
    if [ $# -eq 0 ]
    then
        echo "Usage: scanAdf document_name"
        exit 1
    fi
    startdir=$(pwd)
    tmpdir=scan-$RANDOM
    cd /tmp
    mkdir $tmpdir
    cd $tmpdir
    scanimage -p -y 275 --format=tiff --batch --mode=Color --source="Automatic Document Feeder" 
    tiffcp -c lzw out*.tif output.tif
    convert output.tif "$startdir/$1.pdf"
    cd $startdir
}

function tmux_title() {
    printf '\033]2;%s\033\\' $1
}

function startMemcached() {
    if isRunning 'memcached'; then
	      printf "memecached:\u2713"
    else
	      echo "[memecached: starting]"
	      memcached -d
    fi
}

function startRabbitmq() {
    if isRunning 'rabbitmq'; then
	      printf "rabbitmq:\u2713"
    else
	      echo "[rabitmq: starting]"
	      sudo rabbitmq-server -detached
    fi
}

function startSshAgent() {
    if ! pgrep -u $USER ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-thing
    fi
    if [[ "$SSH_AGENT_PID" == "" ]]; then
        eval $(<~/.ssh-agent-thing)
    fi
    ssh-add -l >/dev/null ||
        alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
}

function install-ssh-key() {
    if [ $# -eq 0 ]
    then
        echo "Usage: install-ssh-key d@torba.us"
        exit 1
    fi
    scp ~/.ssh/ $1
    cat ~/.ssh/id_rsa.pub |
        ssh $1 'umask 077; cat >>.ssh/authorized_keys'
}

