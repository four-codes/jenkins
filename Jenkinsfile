pipeline {
    agent any
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }
    stages {
        stage('docker installtion verify') { 
            steps {
                sh 'docker --version'
                sh '''
                    echo "Multiline shell steps works too"
                    whoami
                '''
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
                sh 'docker-composer up -d'
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
