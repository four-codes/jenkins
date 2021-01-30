pipeline {
    agent any
    parameters {
        choice(
            choices: ['select', 'dev' , 'test', 'prod'],
            description: 'Mention the target environment',
            name: 'REQUESTED_ACTION')
    }
    stages {
        stage ('NO TARGET') {
            when {
                expression { params.REQUESTED_ACTION == 'select' }
            }
            steps {
                echo "PLEASE PASS TARGET NAME"
            }
        }
        stage ('DEVELOPMENT') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' }
            }
            steps {
                echo "Hello, development env!"
            }
        }
        stage ('TEST') {
            when {
                expression { params.REQUESTED_ACTION == 'test' }
            }
            steps {
                echo "Hello, test env!"
            }
        }
        stage ('PRODUCTION') {
            when {
                expression { params.REQUESTED_ACTION == 'prod' }
            }
            steps {
                echo "Hello, prod env!"
            }
        }
    }
}