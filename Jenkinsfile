pipeline {
    agent any
        environment {
              DEMO = "PROJECT"
    }
    parameters {
        string(
            name: 'BRANCHNAME', 
            defaultValue: '', 
            description: 'Please Enter Your Branch Name?')
        
        string(
            name: 'ANIMALS', 
            defaultValue: 'Mr DONKEY', 
            description: 'Who should I say hello to?')
    }
    stages {
        stage ('developing environment') {
            when { 
                expression { params.BRANCHNAME == 'master' }
            }
            steps {
              ``sh '''
                    hostname -i
                '''
            }
        }
        stage ('staging environment') {
            steps {
                sh '''
                    env
                '''
            }
        }
        stage ('testing environment') {
            steps {
                sh '''
                    hostname
                '''
            }
        }
        
        stage ('prod environment') {
            when {
                branch 'master'
            }
            steps {
                echo env.GIT_BRANCH
            }
        }
    }
}
