# ASU-Cybersecurity-course
An overview of topics covered in the ASU cybersecurity course

The Linux folder contains three scrips:
-sys.sh
-sys_info.sh
-for_loops.sh
sys.sh is a script that: 
- creates a directory called 'research' in the user's home folder
- deletes previous system information files, if they exist, within that directory
- describes itself
- printes the date the script was run
- printes the machine type
- display's the IP address
- display's the host name
- displays any files that have full permissions for all users in the '/' folder
- printes the top memory using apps
- uses a for-loop to check the permissions on the 'shadow' and 'passwd' files
- prints the months of the year
- printes the days of the week

sys_info.sh is a script that:
- runs a quick system audit
- displays the date
- display the machine type
- display the uname info
- display the IP info
- display the host name

for_loops.sh is a script that:
- goes through a list of states and determines if any of them are home to the region known as 'So-Cal'
- checks if there are any scripts in any user's home folder

The Diagrams folder contains two diagrams:

'Azure-cloud-network-diagram' which shows the Azure network that was created and includes details such as:
- IP addresses of devices on the network
- the exposed ports on each machine
- what containers each machine is running
- the various protocols allowed between each machine

'Network-Diagram-Ch12-activity' which is a similiar diagram created for an activity. It shows details including:
- the network resource group
- the virtual networks
- the ip ranges of both virtual networks
- the devices within the network
- the docker containers mounted on each machine
- the network security groups
- the SSH, TCP, and HTTP traffic on the network

The Ansible folder contains three .yml files
'filebeat-config.yml' is an ansible configuration file which has been edited to have the proper Elastisearch and kibana host ip for the network

'filebeat-playbook.yml' is the filebeat playbook which:
- downloads and installs the filebeat .deb file
- copies the configuration file from the controller to the servers
- enables system on filebeat module
- sets up filebeat
- starts the filebeat service
- sets the filebeat service to start on startup

'metricbeat-playbook.yml' is the metricbeat playbook which:
- downloads and installs the metricbeat .deb file
- copies the metricbeat configuration file to the servers from the controller
- enables the metricbeat docker module
- starts the metricbeat service
- sets the metricbeat service to start on startup

Both setup playbooks use a more streamlined installation process combining both downloading and installing, however the manual process is left commented if needed.









## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/The-Rye-Muffin/ASU-cybersecurity-Cloud-Security/blob/df6f8323814e4307e2cadc75751da9df3a05d46a/images/Azure-cloud-network-diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the  file may be used to install only certain pieces of it, such as Filebeat.

  -![install-elk.yml](https://github.com/The-Rye-Muffin/ASU-cybersecurity-Cloud-Security/blob/7c9ec1358ac18096eb4e7d1fb5ed4cf3cd60662d/install-elk.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system services.


The configuration details of each machine may be found below.

| Name     | Function   | IP Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.10  | Linux            |
| Web1     | Web Server | 10.0.0.8   | Ubuntu           |
| Web2     | Web Server | 10.0.0.9   | Ubuntu           |
| Elk VM   | ELK host   | 10.1.0.4   | Ubuntu           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 72.212.93.45

Machines within the network can only be accessed by:
- 137.117.38.1 - The JumpBox

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Available | Allowed IP Addresses        |
|-----------|--------------------|-----------------------------|
| Jump Box  | Yes                | 72.212.93.45                |
| Elk Stack | Yes                | 72.212.93.45,174.240.23.193 |
| Web1      | No                 | None                        |
| Web2      | No                 | None                        |

The Elk Stack was given a second IP address permission to allow the user to view kibana on a mobile device

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this reduces
amount of time needed to get multiple machines up and running.

The playbook implements the following tasks:
- set's the vm's vm.max_map_count to a required minimum of 262144
- download and install docker.io
- download and install python3-pip
- install docker with pip
- download the image needed for the ELK container and launch the container
- enables the docker service on startup

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![What the output of running sudo docker PS should look like](https://github.com/The-Rye-Muffin/ASU-cybersecurity-Cloud-Security/blob/18fb1fdb50171d1a4743bed1349027bc03dbc1db/images/Sudo_docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.8 - Web1 machine
- 10.0.0.9 - Web2 machine

We have installed the following Beats on these machines:
-filebeat and metricbeat on both web1 and web2

These Beats allow us to collect the following information from each machine:

- filebeat permits us to monitor system logs on both machines, allowing us to see when system files are modified, tracking changes made to the system.
- metricbeat permits us to monitor the metrics of the system and it's services, allowing us to see changes that happen to services and how it affects our system.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the updated configuration file (metricbeat.yml) to the controller container.
- Update the hosts file to include the IP of the remote servers
- Run the playbook, and navigate to {ELK_VMs_public_IP:5601/app/kibana} to check that the installation worked as expected.

