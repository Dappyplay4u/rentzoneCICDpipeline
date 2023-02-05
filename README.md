Jenkins/Maven/Ansible
Create an Amazon Linux 2 VM instance and call it "Jenkins"
Instance type: t2.large
Security Group (Open): 8080, 9100 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
Attach Jenkins server with IAM role having "AdministratorAccess"
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/jenkins-maven-ansible-setup.sh
Launch Instance
After launching this Jenkins server, attach a tag as Key=Application, value=jenkins

SonarQube
Create an Create an Ubuntu 20.04 VM instance and call it "SonarQube"
Instance type: t2.medium
Security Group (Open): 9000, 9100 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/sonarqube-setup.sh
Launch Instance


Nexus
Create an Amazon Linux 2 VM instance and call it "Nexus"
Instance type: t2.medium
Security Group (Open): 8081, 9100 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/nexus-setup.sh
Launch Instance

EC2 (Dev/Stage/Prod)
Create 6 Amazon Linux 2 VM instances
Instance type: t2.micro
Security Group (Open): 8080, 9100 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/deployment-servers-setup.sh
Launch Instance
After launching this Jenkins servers, attach a tag as Key=Environment, value=dev/stage/prod ( out of 6, each 2 instances could be tagges as one env)


Prometheus
Create Amazon Linux 2 VM instance and call it "Prometheus"
Instance type: t2.micro
Security Group (Open): 9090 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
Attach Jenkins server with IAM role having "AmazonEC2ReadOnlyAccess"
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/prometheus-setup.sh
Launch Instance


Grafana
Create an Ubuntu 20.04 VM instance and call it "Grafana"
Instance type: t2.micro
Security Group (Open): 3000 and 22 to 0.0.0.0/0
Key pair: Select or create a new keypair
User data (Copy the following user data): https://github.com/cvamsikrishna11/devops-fully-automated/blob/installations/grafana-setup.sh
Launch Instance