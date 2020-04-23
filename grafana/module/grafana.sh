# #!/bin/bash 
# # This script is used to install prometheus on Amazon Linux AMI
# # Link for help https://devopscube.com/install-configure-prometheus-linux/
# # Update system
# sudo yum update -y

# # Add users
# sudo useradd --no-create-home --shell /bin/false prometheus
# sudo mkdir /etc/prometheus
# sudo mkdir /var/lib/prometheus
# sudo chown prometheus:prometheus /etc/prometheus
# sudo chown prometheus:prometheus /var/lib/prometheus

# # Download prometheus from a link
# # Releases are shown here https://github.com/prometheus/prometheus/releases
# curl -LO https://github.com/prometheus/prometheus/releases/download/v2.3.2/prometheus-2.3.2.linux-amd64.tar.gz
# tar -xvf prometheus-2.3.2.linux-amd64.tar.gz
# mv prometheus-2.3.2.linux-amd64 prometheus-files




# # Copy binaries
# sudo cp prometheus-files/prometheus /usr/local/bin/
# sudo cp prometheus-files/promtool /usr/local/bin/
# sudo chown prometheus:prometheus /usr/local/bin/prometheus
# sudo chown prometheus:prometheus /usr/local/bin/promtool



# # Move console files
# sudo cp -r prometheus-files/consoles /etc/prometheus
# sudo cp -r prometheus-files/console_libraries /etc/prometheus
# sudo chown -R prometheus:prometheus /etc/prometheus/consoles
# sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries



# # Creates prometheus config file
# sudo bash -c 'cat > /etc/prometheus/prometheus.yml' <<EOF
# global:
#   scrape_interval: 10s
#   evaluation_interval: 1s

# scrape_configs:

#   - job_name: 'prometheus'
#     scrape_interval: 5s
#     static_configs:
#     - targets: ['localhost:9090']

#   - job_name: 'node'
#     ec2_sd_configs:
#       - region: us-east-1
#         port: 9100

#   - job_name: 'node_exporter'
#     static_configs:
#       - targets: ['localhost:9100']

# EOF

# # Change permission
# sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml




# # Creates Systemd service
# sudo bash -c 'cat > /etc/systemd/system/prometheus.service' <<EOF
# [Unit]
# Description=Prometheus
# Wants=network-online.target
# After=network-online.target
# [Service]
# User=prometheus
# Group=prometheus
# Type=simple
# ExecStart=/usr/local/bin/prometheus \
# --config.file /etc/prometheus/prometheus.yml \
# --storage.tsdb.path /var/lib/prometheus/ \
# --web.console.templates=/etc/prometheus/consoles \
# --web.console.libraries=/etc/prometheus/console_libraries
# [Install]
# WantedBy=multi-user.target
# EOF



# # Restarts
# sudo systemctl daemon-reload
# sudo systemctl start prometheus
# sudo systemctl enable prometheus
# sudo systemctl status prometheus




# #=====================================================================================================================================
# !/bin/bash
# #Documentation: https://www.howtoforge.com/tutorial/how-to-install-prometheus-and-node-exporter-on-centos-8/
# #Documentation: https://www.robustperception.io/automatically-monitoring-ec2-instances

# wget -P /tmp https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
# tar xvfz /tmp/node_exporter-0.18.1.linux-amd64.tar.gz
# sudo mv node_exporter-0.18.1.linux-amd64 /etc/prometheus/node_exporter


# sudo bash -c 'cat > /etc/systemd/system/node_exporter.service' <<EOF
# [Unit]
# Description=Node Exporter
# Wants=network-online.target
# After=network-online.target
# [Service]
# User=prometheus
# ExecStart=/etc/prometheus/node_exporter/node_exporter
# [Install]
# WantedBy=default.target
# EOF

# sudo systemctl daemon-reload
# sudo systemctl start node_exporter
# sudo systemctl enable node_exporter
# systemctl status node_exporter


#=====================================================================================================================================
#!/bin/bash

# Creates a repo
sudo bash -c 'cat > /etc/yum.repos.d/grafana.repo' <<EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

# Installs Grafana
sudo yum install grafana fontconfig freetype* urw-fonts -y

# Starts Grafana
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service
sudo systemctl status grafana-server
