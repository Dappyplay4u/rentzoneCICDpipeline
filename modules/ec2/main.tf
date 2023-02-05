### WEB SERVERS PRIVATE SUBNETS
resource "aws_instance" "web-server-prod" {
  ami = var.ami-id1
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az1_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.webserver_security_group_id]
  user_data              = file("deployment-servers-setup.sh")
  iam_instance_profile = "jenkins-cicd-server-role"
  tags = {
    Environment = "prod"
  }
}

resource "aws_network_interface" "main_network_interface-prod" {
  subnet_id   = var.public_subnet_az1_id

  tags = {
    Name = "web-server-prod_network_interface"
  }
}

resource "aws_instance" "web-server-stage" {
  ami = var.ami-id1
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az2_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.webserver_security_group_id]
  user_data              = file("deployment-servers-setup.sh")
  iam_instance_profile = "jenkins-cicd-server-role"
  tags = {
    Environment = "stage"
  }
}

resource "aws_network_interface" "main_network_interface-stage" {
  subnet_id   = var.public_subnet_az2_id

  tags = {
    Name = "web-server-stage_network_interface"
  }
}

resource "aws_instance" "web-server-dev" {
  ami = var.ami-id1
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az1_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.webserver_security_group_id]
  user_data              = file("deployment-servers-setup.sh")
  iam_instance_profile = "jenkins-cicd-server-role"
  tags = {
    Environment = "dev"
  }
}

resource "aws_network_interface" "main_network_interface-dev" {
  subnet_id   = var.public_subnet_az1_id

  tags = {
    Name = "web-server-dev_network_interface"
  }
}

###JENKINS SERVERS PUBLIC SUBNETS

resource "aws_instance" "jenkins_server" {
  ami = var.ami-id1
  instance_type = "t2.large"
  subnet_id = var.public_subnet_az2_id
  key_name = "jenkinskeypair"
  user_data              = file("jenkins-maven-ansible-setup.sh")
  vpc_security_group_ids = [var.jenkins_security_group_id]
  tags = {
    Name = "jenkins server"
  }
}

resource "aws_network_interface" "main_network_interface-jenkins" {
  subnet_id   = var.public_subnet_az2_id
  tags = {
    Name = "jenkins_network_interface"
  }
}

### NEXUS SERVERS PUBLIC SUBNETS
resource "aws_instance" "Nexus_server" {
  ami = var.ami-id1
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az1_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.Nexus_security_group_id]
  user_data              = file("nexus-setup.sh")
  tags = {
    Name = "Nexus server"
  }
}

resource "aws_network_interface" "main_network_interface-Nexus" {
  subnet_id   = var.public_subnet_az1_id

  tags = {
    Name = "Nexus_network_interface"
  }
}

### Prometheus SERVERS PUBLIC SUBNETS
###SERVERS PUBLIC SUBNETS
resource "aws_instance" "Prometheus_server" {
  ami = var.ami-id1
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az2_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.Prometheus_security_group_id]
  user_data              = file("prometheus-setup.sh")
  iam_instance_profile = "jenkins-cicd-server-role"
  tags = {
    Name = "Prometheus server"
  }
}

resource "aws_network_interface" "main_network_interface-Prometheus" {
  subnet_id   = var.public_subnet_az2_id

  tags = {
    Name = "Prometheus_network_interface"
  }
}

###Grafana SERVERS PUBLIC SUBNETS
resource "aws_instance" "Grafana_server" {
  ami = var.ami-id2
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az1_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.Grafana_security_group_id]
  user_data              = file("grafana-setup.sh")
  tags = {
    Name = "Grafana server"
  }
}

resource "aws_network_interface" "main_network_interface-Grafana" {
  subnet_id   = var.public_subnet_az1_id

  tags = {
    Name = "Grafana_network_interface"
  }
}

##SonarQube SERVERS PUBLIC SUBNETS
resource "aws_instance" "SonaQube_server" {
  ami = var.ami-id2
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_az2_id
  key_name = "jenkinskeypair"
  vpc_security_group_ids = [var.SonaQube_security_group_id]
  user_data              = file("SonaQube-setup.sh")
  tags = {
    Name = "SonaQube server"
  }
}

resource "aws_network_interface" "main_network_interface-SonaQube" {
  subnet_id   = var.public_subnet_az2_id

  tags = {
    Name = "SonaQube_network_interface"
  }
}
