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
                sh 'docker-composer --version'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
