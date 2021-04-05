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
       stage ('prod environment') {
            when {
                branch 'master'
            }
            steps {
                echo "Hello ${params.PERSON}"
            }
    }
}
