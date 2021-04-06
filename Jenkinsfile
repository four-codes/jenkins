pipeline {
    agent any
        environment {
              DEMO = "PROJECT"
    }
    parameters {
        string(
            name: 'PERSON', 
            defaultValue: 'Mr Jenkins', 
            description: 'Who should I say hello to?')
        string(
            name: 'ANIMALS', 
            defaultValue: 'Mr DONKEY', 
            description: 'Who should I say hello to?')
    }
    stages {
        stage ('developing environment') {
            environment { 
                BRANCH_NAME=env.GIT_BRANCH
            }
            steps {
                script {
                    
                    if ( $BRANCH_NAME == 'master') {
                        echo 'This is master branch'
                    } else {
                        ss ''' env '''
                    }
                }
            }
        }
        stage ('staging environment') {
            steps {
                echo "Hello ${params.PERSON}"
            }
        }
        stage ('testing environment') {
            steps {
                sh '''
                    env
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
