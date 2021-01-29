pipeline {
    agent any
    environment {
       GIT_BRANCH = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
    }
    stages {
        stage ('Speak') {
            when {
                expression { sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim() == 'master' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }
        }
        }
                stage ('Speak') {
                    sh 'echo $GIT_BRANCH'
        }
    }
