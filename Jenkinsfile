pipeline {
    agent any
    environment {
        FULL_PATH_BRANCH = "${sh(script:'git name-rev --name-only HEAD', returnStdout: true)}"
        GIT_BRANCH = FULL_PATH_BRANCH.substring(FULL_PATH_BRANCH.lastIndexOf('/') + 1, FULL_PATH_BRANCH.length())
    }
    stages {
        stage('test') {
            steps {
                sh '''
                    branchName =  $GIT_BRANCH
                    
                    if ($branchName == 'master') {
                        echo 'Master Branch'
                    } else {
                        echo "some other branch"
                    }
                
                '''
            }
        }
        stage('test1') {
            steps {
                sh 'echo "$GIT_BRANCH"'
            }
        }
        stage('test3') {
            steps {
                script {
                    if ($GIT_BRANCH == 'master') {
                        echo 'I only execute on the master branch'
                    } else {
                        echo 'I execute elsewhere'
                    }
                }
            }
        }
    }
}
