pipeline {
    agent any
    stages {
        stage('buid') {
            steps {
                sh 'docker build -t benediktkr/jenkins:lts .'
            }
        }

        stage('push') {
            steps {
                sh 'docker push benediktkr/jenkins:lts'
            }
        }
    }
}
