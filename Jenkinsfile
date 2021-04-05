pipeline {
    agent any
        environment {
            PasswordId     = "USERNAME"
            UsernameId     = "PASSWORD"
    }
    parameters {
        string(
            name: 'PERSON', 
            defaultValue: 'Mr Jenkins', 
            description: 'Who should I say hello to?')
    }
    stages {
        stage ('developing environment') {
            when {
                branch 'master'
            }
            steps {
                echo "PLEASE PASS TARGET NAME"
            }
        }
        stage ('staging environment') {
            when {
                branch 'master'
            }
            steps {
                echo "Hello ${params.PERSON}"
            }
        }
        stage ('testing environment') {
            when {
                branch 'master'
            }
            steps {
                echo "Hello ${params.PERSON}"
            }
        }
        stage ('prod environment') {
            when {
                branch 'master'
            }
            steps {
                echo "Hello ${params.PERSON}"
            }
    }
}
