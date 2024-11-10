##########################################################
# Components
##########################################################

resource "aws_imagebuilder_component" "os_update" {
  name        = "os-update-component"
  version     = "1.0.0"
  platform    = "Linux"
  description = "Component to update the OS using dnf"
  change_description = "Run dnf update to ensure the OS is up-to-date"

  # Use YAML for the component definition
  data = <<-EOT
schemaVersion: 1.0
name: "OSUpdate"
description: "Updates the OS with dnf update"
phases:
  - name: build
    steps:
      - name: RunOSUpdate
        action: ExecuteBash
        inputs:
          commands:
            - "sudo dnf update -y"
EOT
}

resource "aws_imagebuilder_component" "install_cloudwatch_agent" {
  name        = "install-cloudwatch-agent"
  platform    = "Linux"
  version     = "1.0.0"
  description = "Install and configure CloudWatch Agent on Amazon Linux 2023"

  data = <<EOF
name: install-cloudwatch-agent
version: 1.0.0
description: Install and configure CloudWatch Agent
schemaVersion: 1.0

phases:
  build:
    commands:
      - echo "Installing CloudWatch Agent"
      
      # Update package list and install CloudWatch agent (using dnf for Amazon Linux 2023)
      - dnf update -y
      - dnf install -y amazon-cloudwatch-agent

      # Enable and start CloudWatch Agent service
      - systemctl enable amazon-cloudwatch-agent
      - systemctl start amazon-cloudwatch-agent

      # CloudWatch Agent Configuration (example for logs)
      - echo "[general]" > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
      - echo "state_file = /var/lib/amazon-cloudwatch-agent/agent-state" >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
      - echo "[/var/log/messages]" >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
      - echo "log_group_name = /var/log/messages" >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
      - echo "log_stream_name = {instance_id}" >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
      - echo "file = /var/log/messages" >> /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

      # Restart CloudWatch Agent service to apply configuration
      - systemctl restart amazon-cloudwatch-agent

      - echo "CloudWatch Agent Installation and Configuration Complete"
EOF
}
