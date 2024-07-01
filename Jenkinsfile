pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "nexus"  // Update with your Docker registry URL
        ANSIBLE_HOST = "inventroy"  // Update with your Ansible host
    }
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout specific branch
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/deepak-kanyal-iopshub/hello-world.git']]])
                }
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry
                    docker.withRegistry('https://${DOCKER_REGISTRY}', 'docker-registry-credentials') {
                        // Build Docker image from Dockerfile
                        def customImage = docker.build("your-docker-image-name")
                        
                        // Push Docker image to registry
                        customImage.push()
                    }
                }
            }
        }
        
        stage('Deploy with Ansible') {
            steps {
                // Execute Ansible playbook
                ansiblePlaybook(
                    credentialsId: 'ansible-ssh-credentials',  // SSH credentials for Ansible
                    inventory: "${ANSIBLE_HOST},",
                    playbook: 'path/to/ansible/playbook.yml'  // Update path to your playbook
                )
            }
        }
    }
}
