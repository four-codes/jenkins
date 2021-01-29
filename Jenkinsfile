pipeline {
    agent any
    stages {
        stage ('Speak') {
            when {
                expression { GIT_BRANCH = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim() == 'master' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }
        }
    }
}
