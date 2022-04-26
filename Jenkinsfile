pipeline {
    agent any
    tools {
        jdk 'jdk-17' 
    }
    stages {
        stage("build project") {
            steps {
                echo 'building project...'
                sh "mvn clean package"
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