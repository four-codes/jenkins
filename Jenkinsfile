pipeline {
    agent any
    environment {
       GIT_BRANCH = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD')
    }
    stages {
        stage ('StepOne') {
            when {
                expression { sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim() == 'master' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }

        }
        stage ('StepTwo') {
            steps {
                sh 'echo $GIT_BRANCH'
            }
        }
    }
}
