pipeline {
    agent any
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
}
