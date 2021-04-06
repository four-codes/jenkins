pipeline {
    agent any
        environment {
              DEMO = "PROJECT"
    }
    parameters {
        string(name: 'BRANCHNAME', defaultValue: '', description: 'Please Enter Your Branch Name?')
        choice(name: 'TARGET_ENVIRONMENT', choices: ['dev', 'staging', 'test', 'prod'], description: 'Pick something')      
        string(name: 'ANIMALS', defaultValue: 'Mr DONKEY', description: 'Who should I say hello to?')
    }
    stages {
        stage ('developing environment') {
            when { 
                expression { params.BRANCHNAME == 'master' && params.TARGET_ENVIRONMENT == 'prod'}
            }
            steps {
              sh 
                '''
                    echo "this is production deployment area"
                '''
            }
        }
        stage ('staging environment') {
            when { 
                expression { params.BRANCHNAME == 'test' && params.TARGET_ENVIRONMENT == 'test'}
            }
            steps {
              sh 
                '''
                    echo "this is testing deployment area"
                '''
            }
        }
        stage ('testing environment') {
            when { 
                expression { params.BRANCHNAME == 'stage' && params.TARGET_ENVIRONMENT == 'staging'}
            }
            steps {
              sh 
                '''
                    echo "this is staging deployment area"
                '''
            }
        }
        
        stage ('prod environment') {
            when { 
                expression { params.BRANCHNAME == 'dev' || params.TARGET_ENVIRONMENT == 'dev'}
            }
            steps {
              sh 
                '''
                    echo "this is dev deployment area"
                '''
            }
        }
    }
}
