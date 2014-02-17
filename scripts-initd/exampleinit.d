#!/bin/sh

##
# Description: Starts the service as the java user
# chkconfig: 345 90 17
 
SCRIPT="/opt/froyo/java/bin/java -jar service-executable.jar -httpPort=9000 >/dev/null 2>&1 &"
INSTALL_DIR="/opt/mango/service"
RUNAS=java
NAME=execsvc
 
PIDFILE=/var/run/$NAME.pid
LOGFILE=/var/log/$NAME.log
 
start() {
if [ -f $PIDFILE ] && kill -0 $(cat $PIDFILE); then
  echo 'Service already running' >&2
  return 1
fi
echo 'Starting service…' >&2
#local CMD="$SCRIPT &> \"$LOGFILE\" & echo \$!"
su -c "cd $INSTALL_DIR; $SCRIPT" $RUNAS
# this is bad but it works
pid=$(ps -ef | grep service-executabl[e] | awk '{ print $2}')
echo $pid > "$PIDFILE"
echo 'Service started' >&2
}
 
stop() {
if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
  echo 'Service not running' >&2
  return 1
fi
echo 'Stopping service…' >&2
kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
echo 'Service stopped' >&2
}
 
status() {
if [ -f "$PIDFILE" ]; then
  kill -0 $(cat $PIDFILE)
  [ $? -eq 0 ] && echo "Service is running"
  return 0
else
  # again, bad but works, regex for matching explicitly, can use grep -v grep as well
  checkPID=$(ps -ef | grep service-executabl[e] | awk '{print $2}')
  if [ ! -z $checkPID ]; then
    echo "Service is running, but PIDFILE is missing - PID: $checkPID"
    return 0
  fi
fi
echo "Service is stopped"
return 1
}
 
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|status|restart}"
esac
