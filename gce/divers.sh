# Création et démarrage de la VM
gcloud compute instances create my-app-instance --tags http-server --metadata-from-file startup-script=gce/startup-script.sh

# Visualisation des logs de la VM
gcloud compute instances get-serial-port-output my-app-instance

# Accéder à la VM en ssh
gcloud compute --project "blockchain-185216" ssh --zone "europe-west1-c" "my-app-instance"

# Création du firewall pour donner accès à la VM depuis internet
gcloud compute firewall-rules create default-allow-http-9091 \
    --allow tcp:9091 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http-server \
    --description "Allow port 9091 access to http-server"