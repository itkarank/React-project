pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/itkarank/terrajen1'
            }
        }

       stage('Docker Build & Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'e8442a03-f89f-46d7-853e-ca9d84d501d0', toolName: 'React-Project') {
                        
                        sh "docker build -t React-Project -f docker/Dockerfile ."
                        sh "docker tag  React-Project karan143/React-Project:latest"
                        sh "docker push karan143/React-project:latest"
                    }
                }
            }
        }    
        
        stage('Docker Deploy to Container') {
            steps {
                script {
                withDockerRegistry(credentialsId: 'e8442a03-f89f-46d7-853e-ca9d84d501d0', toolName: 'React-Project') {
                    sh "docker run -d --name shopping-cart -p 8070:8070 karan143/React-Project:latest" }
                }
                
            }
        }
    }
}
