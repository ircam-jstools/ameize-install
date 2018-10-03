# this script is intended to be sourced, as it defines variables and functions

log "Registering services:"

for service in boot/*.service ; do
    log "- ${service}"
    sudo cp "$service" /etc/systemd/system/
    sudo systemctl enable "$(basename "$service")"
done
