pipeline {
    agent any 

     environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }      

    stages {
        stage('Build') {
            steps {
                
                sh '''
                aws configure set region us-east-1
                aws sts get-caller-identity
                echo ""completed
                '''
            } 
        }

    }
}
