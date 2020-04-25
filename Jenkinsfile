pipeline {
    agent any
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }
    stages {
        stage('docker installtion verify') { 
            steps {
                echo "${DISABLE_AUTH}"
                sh 'docker --version'
            }
        }
        stage('Docker-Compose installtion verify') { 
            steps {
                echo "${DB_ENGINE}"
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
