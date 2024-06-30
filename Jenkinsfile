
pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "your-docker-registry-url"  // Update with your Docker registry URL
        ANSIBLE_HOST = "ansible-hostname"  // Update with your Ansible host
    }
    
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry
                    docker.withRegistry('https://${env.DOCKER_REGISTRY}', 'docker-registry-credentials') {
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
                    inventory: "${env.ANSIBLE_HOST},",
                    playbook: 'path/to/ansible/playbook.yml'
                )
            }
        }
    }
}
