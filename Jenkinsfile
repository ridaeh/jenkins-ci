pipeline {
    agent any
    stages {
        stage("build project") {
            steps {
                echo 'building project...'
                sh "mvn package"
            }
        }
        stage("Test project") {
            steps {
                echo 'testing project...'
                sh "mvn test"
            }
        }
    }
}