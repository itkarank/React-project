pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/itkarank/React-Project'
            }
        }

       stage('Docker Build & Push') {
            steps {
                script{

                    
                    withDockerRegistry(credentialsId: '4dc60544-f54b-48cd-ad44-bd685badc389', toolName: 'React-Project') {
                        
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
                withDockerRegistry(credentialsId: '4dc60544-f54b-48cd-ad44-bd685badc389', toolName: 'React-Project') {
                    sh "docker run -d --name shopping-cart -p 8070:8070 karan143/React-Project:latest" }
                }
                
            }
        }
    }
}
