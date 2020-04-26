pipeline {
    agent any
    stages {
        stage('docker installtion verify') { 
            steps {
                sh '''
                    docker --version
                '''

            }
        }
        stage('Docker-Compose installtion verify') { 
            steps {
                sh 'docker-compose --version'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'docker-compose -f dockermonitor/docker-compose.yml up -d'
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
