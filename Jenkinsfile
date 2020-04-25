pipeline {
    agent any
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
        load "$HOME/.env/test.groovy"

    }
    stages {
        stage('Read env file') { 
            steps {
                echo "${env.DB_URL}"
            }
        }
        stage('docker installtion verify') { 
            steps {
                sh '''
                    docker --version
                    ansible --version
                '''
                echo "${env.DB_URL2}"

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
