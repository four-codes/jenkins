pipeline {
    agent any 
     environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
        REGION                = 'us-east-1'
    }      
    stages {
        stage('Docker Image build') {
            steps {
                sh '''
                aws configure set region us-east-1
                $(aws ecr get-login --region $REGION --no-include-email)
                echo "completed"
                '''
            } 
        }
        stage('Build') {
            steps {
                sh '''
                aws sts get-caller-identity
                echo "completed"
                '''
            } 
        }

    }
}
