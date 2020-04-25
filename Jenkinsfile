pipeline {
    agent any 
    stages {
        stage('docker installtion verify') { 
            steps {
                sh 'docker --version'
            }
        }
        stage('Docker-Compose installtion verify') { 
            steps {
                sh 'docker-compose --version'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
