pipeline {
    agent any
    parameters {
        choice(
            choices: ['dev' , 'test', 'master'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        stage ('Development') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }
        }
        stage ('TestEnvironment') {
            when {
                expression { params.REQUESTED_ACTION == 'test' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }
        }
        stage ('ProdEnvironment') {
            when {
                expression { params.REQUESTED_ACTION == 'master' }
            }
            steps {
                echo "Hello, bitwiseman!"
            }
        }
    }
}