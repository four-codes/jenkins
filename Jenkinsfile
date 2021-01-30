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
        stage ('Development') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' }
            }
            steps {
                echo "Hello, development env!"
            }
        }
        stage ('Test Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'test' }
            }
            steps {
                echo "Hello, test env!"
            }
        }
        stage ('Prod Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'prod' }
            }
            steps {
                echo "Hello, prod env!"
            }
        }
    }
}